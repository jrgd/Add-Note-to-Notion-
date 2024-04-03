#!/bin/zsh
# test the arguments and parsing

# args="$1"
args=$(echo "$1" | sed -e 's/[[:space:]]*$//')

echo "Input string: $args"
# pattern='#([^[:space:]]+)'
pattern='#(\w+)'
echo "Pattern: $pattern"

tags=()

# Using capturing parentheses in the pattern
# for match in ${(M)args:#$pattern}; do
#     # Extract the captured tag from the match
#     tag=${match[2]}
#     echo "Tag: $tag"
#     # Add the tag to the tags array
#     tags+=("$tag")
# done


tags=($(echo "$args" | grep -o '#\w\+' | sed 's/#//'))

printf '%s\n' "${tags[@]}"

# get the text after each # in the ARG
# TAGS_ARRAY=$( echo $ARGS | sed -n -e '/#: /')
# TAGS_ARRAY=echo $ARGS | grep -p '\d+ (?=#)'
# echo $TAG_ARRAY

#