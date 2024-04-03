#!/bin/zsh

# Set your variable
source /Users/jrgd/dev/tools/Notion/secrets/notion.env

# EXTRACT TITLE WITHOUT TAGS
title=$(echo "$1" | sed -E 's/#[[:alnum:]]+ ?//g')

# EXTRACTING THE TAGS
args=$(echo "$1" | sed -e 's/[[:space:]]*$//')
pattern='#(\w+)'
tags=()
tags=($(echo "$args" | grep -o '#\w\+' | sed 's/#//'))
tags=("${(@)tags:#}")
TAGS_STRING=$(echo "$args" | grep -o '#\w\+' | sed 's/#//' | jq -R -s 'split("\n") | map(select(length > 0) | { "name": . })')
# echo $TAGS_STRING


BODY=$(jq -n --arg DATABASE_ID "$NOTION_DATABASE_ID" \
                --arg _TITLE "$title" \
                --arg _CONTENT "$2" \
                --argjson _TAG "$TAGS_STRING" \
                '{"parent": {"database_id": $DATABASE_ID}, 
                  "properties": {
                    "Name": {"title": [{"text": {"content": $_TITLE } } ] }, 
                    "Tags": { "multi_select" : $_TAG } 
                  }, 
                  "children": [
                    {"object": "block", 
                     "type": "paragraph", 
                     "paragraph": {"rich_text": [{"type": "text", "text": { "content": $_CONTENT } } ] } 
                    } 
                  ] 
                 }')

# WGET
# wget -q -O- --post-data $BODY $NOTION_URL --header "content-type: application/json" --header "Authorization: Bearer $NOTION_KEY" --header "Notion-Version: $NOTION_VERSION" --server-response 

# CURL
response=$( \
	curl -s \
		 -X POST \
	     -H "Content-Type: application/json" \
	     -H "Authorization: Bearer $NOTION_KEY" \
	     -H "Notion-Version: $NOTION_VERSION" \
	     -d "$BODY" \
	     $NOTION_URL \
)

# DEV?
if [[ "$ENVIRONMENT" == 'dev' ]]; then
	echo "$response"
else
    # Variable 'environment' is not set to 'dev'. Response from server not printed.
fi
