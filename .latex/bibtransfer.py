import bibtexparser
import os
import re
import argparse
from collections import defaultdict


def parse_bib_file(bib_file: str) -> dict[str, dict[str, str]]:
    """Parses a .bib file using bibtexparser and returns a dictionary mapping cite keys to whole entries."""
    with open(bib_file, "r", encoding="utf-8") as f:
        bib_database: bibtexparser.bibdatabase.BibDatabase = bibtexparser.load(f)

    cite_entries: dict[str, dict[str, str]] = {
        entry["ID"]: entry for entry in bib_database.entries
    }

    return cite_entries


def extract_cite_keys_from_tex(tex_file: str) -> set[str]:
    """Extracts the set of cite keys used in the LaTeX file by reading it as a single string."""
    cite_keys: set[str] = set()
    cite_pattern = re.compile(r"\\cite\{([^}]+)\}")

    with open(tex_file, "r", encoding="utf-8") as f:
        tex_content = f.read()

    matches: list[str] = cite_pattern.findall(tex_content)

    for match in matches:
        keys: list[str] = match.split(",")
        for key in keys:
            cite_keys.add(key.strip())

    return cite_keys


def update_bibfile(
    main_bib: str, project_bib: str, tex_file: str
) -> tuple[list[str], list[str]]:
    """Updates the project bibliography file with entries missing from the main bibliography file."""

    main_bib_entries: dict[str, dict[str, str]] = parse_bib_file(main_bib)
    project_bib_entries: dict[str, dict[str, str]] = parse_bib_file(project_bib)
    tex_cite_keys: set[str] = extract_cite_keys_from_tex(tex_file)
    project_keys = set(project_bib_entries.keys())
    main_keys = set(main_bib_entries.keys())
    added: list[str] = []
    still_missing: list[str] = []

    bibwriter: bibtexparser.bwriter.BibTexWriter = bibtexparser.bwriter.BibTexWriter()
    new_bib_database: bibtexparser.bibdatabase.BibDatabase = (
        bibtexparser.bibdatabase.BibDatabase()
    )

    with open(project_bib, "a", encoding="utf-8") as project_bib_file:
        for cite_key in tex_cite_keys:
            if cite_key not in project_keys:
                if cite_key in main_keys:
                    new_bib_database.entries.append(main_bib_entries[cite_key])
                    added.append(cite_key)
                else:
                    still_missing.append(cite_key)

        if new_bib_database.entries:
            project_bib_file.write(bibwriter.write(new_bib_database))

    return added, still_missing


def main():
    parser = argparse.ArgumentParser(
        description="Update project bibliography from a main library."
    )
    parser.add_argument(
        "--main_bib",
        default=os.path.expanduser("~/.latex/main.bib"),
        help="Path to the main .bib file (default: ~/.latex/main.bib)",
    )
    parser.add_argument(
        "--project_bib", required=True, help="Path to the project .bib file"
    )
    parser.add_argument(
        "--tex_file", required=True, help="Path to the main .tex file for the project"
    )

    args = parser.parse_args()

    if not os.path.exists(args.main_bib):
        print(f"Main bibliography file not found: {args.main_bib}")
        return
    if not os.path.exists(args.project_bib):
        print(f"Project bibliography file not found: {args.project_bib}")
        return
    if not os.path.exists(args.tex_file):
        print(f"Main tex file not found: {args.tex_file}")
        return

    added, still_missing = update_bibfile(
        args.main_bib, args.project_bib, args.tex_file
    )

    if added:
        print("Added the following entries to the project.bib:")
        for entry in added:
            print(f"  - {entry}")
    else:
        print("No new entries added to project.bib.")

    if still_missing:
        print("Still missing the following entries:")
        for entry in still_missing:
            print(f"  - {entry}")
    else:
        print("No missing entries.")


if __name__ == "__main__":
    main()
