#!/bin/bash

# Get all tracked files that have been modified (not new untracked ones)
FILES=$(git status --porcelain | grep " M" | awk '{print $2}')

if [ -z "$FILES" ]; then
    echo "❌ No modified files found!"
    exit 1
fi

for FILE in $FILES; do
    echo "📄 Processing $FILE ..."

    # Backup original
    cp "$FILE" "$FILE.bak"
    > "$FILE"   # empty the file

    WORDNUM=1
    while IFS= read -r line; do
        for word in $line; do
            echo -n "$word " >> "$FILE"
            git add "$FILE"
            git commit -m "$FILE [Word $WORDNUM]: $word"
            ((WORDNUM++))
        done
        echo "" >> "$FILE"   # preserve line breaks
    done < "$FILE.bak"

    rm "$FILE.bak"
    echo "✅ Finished $FILE"
done

echo "🎉 Done! All words committed separately."
