#!/usr/bin/env bash
#
# Create a new student repo from the webtec-abcd25 template.
#
# Usage: bash scripts/create-student-repo.bash <acronym> [term]
# Example: bash scripts/create-student-repo.bash mosr25
# Example: bash scripts/create-student-repo.bash mosr25 ht26
#
# [term] defaults to "ht<current year>" (the course only runs in autumn).
# It's added as a GitHub topic on the new repo, so repos from a given
# course round can later be found with:
#   gh repo list bth-webtec --topic ht26 --json name

set -euo pipefail

ACRONYM="${1:-}"
if [[ -z "$ACRONYM" ]]; then
    echo "Usage: $0 <student-acronym> [term]"
    echo "Example: $0 mosr25"
    echo "Example: $0 mosr25 ht26"
    exit 1
fi

TERM="${2:-ht$(date +%y)}"

TEMPLATE="bth-webtec/webtec-abcd25"
NEW_REPO="bth-webtec/webtec-${ACRONYM}"
CLONE_DIR="webtec-${ACRONYM}"

if [[ -d "${CLONE_DIR}" ]]; then
    echo "Error: directory '${CLONE_DIR}' already exists, aborting."
    exit 1
fi

echo "==> Creating repo ${NEW_REPO} from template ${TEMPLATE} (term: ${TERM})"

# Create the new private repo on GitHub
gh repo create "${NEW_REPO}" --private

# Tag the repo with its course term so repos from a given round can be
# found later, for updating or archiving.
gh repo edit "${NEW_REPO}" --add-topic "${TERM}"

# Clone the template (single depth is enough)
git clone "git@github.com:${TEMPLATE}.git" "${CLONE_DIR}"
cd "${CLONE_DIR}"

# Replace all occurrences of abcd25 with the student acronym
sed -i "s/abcd25/${ACRONYM}/g" README.md package.json package-lock.json

# Switch remote to the new repo
git remote set-url origin "git@github.com:${NEW_REPO}.git"

# Commit and push
git add README.md package.json package-lock.json
git commit -m "Init repo for ${ACRONYM}"
git push -u origin main

# Create and push submit branches
for KMOM in kmom03 kmom06 kmom10; do
    BRANCH="bth/submit/${KMOM}"
    git branch "${BRANCH}"
    git push origin "${BRANCH}"
    echo "==> Created branch ${BRANCH}"
done

cd ..
rm -rf "${CLONE_DIR}"

echo ""
echo "Done! Repo: https://github.com/${NEW_REPO}"
