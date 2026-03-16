#!/bin/bash

if [ ! -d "./actions/$1" ]; then
    mkdir -p "./$1"
    else
    echo "Directory ./$1 already exists. Please choose a different name."
    exit 1
fi

FILE="./$1/SKILL.md"

echo "---" >> "$FILE"
echo "name:" >> "$FILE"
echo "description:" >> "$FILE"
echo "---" >> "$FILE"
echo "# Name" >> "$FILE"
echo "" >> "$FILE"
echo "## Purpose" >> "$FILE"
echo "" >> "$FILE"
echo "## Guidelines" >> "$FILE"
echo "" >> "$FILE"
echo "## Checklist" >> "$FILE"

#TEMPLATE_REAL="---\nname:\ndescription:\n---\n# Name\n\n## Purpose\n\n## Guidelines\n\n## Checklist\n"
