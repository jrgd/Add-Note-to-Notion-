#!/bin/zsh

TAGS_STRING=$3
# echo $TAGS_ARRAY| jq 'split(",")'
# TAGS_ARRAY=(${(@s:,:)$TAGS_STRING})
# TAGS_ARRAY=(${(s/,/)TAGS_STRING})
# TAGS_ARRAY=(${(s/,/)TAGS_STRING})
# echo $TAGS_ARRAY
# TAGS_STRING_JSON=$( jq --compact-output --null-input '$TAGS_ARRAY' --args -- "${X[@]}" #{"name": "%s", "color": "gray"},' "${TAGS_ARRAY[@]}" )
# echo $TAGS_STRING_JSON


source /Users/jrgd/dev/tools/Notion/secrets/notion.env
BODY=$(jq -n --arg DATABASE_ID "$NOTION_DATABASE_ID" --arg _TITLE "$1" --arg _CONTENT "$2" --arg _TAG $TAGS_STRING '{"parent": {"database_id": $DATABASE_ID}, "properties": {"Name": {"title": [{"text": {"content": $_TITLE } } ] }, "Tags": { "multi_select" : [ {"name":$_TAG} ] } }, "children": [{"object": "block", "type": "paragraph", "paragraph": {"rich_text": [{ "type": "text", "text": { "content": $_CONTENT } } ] } } ] } ')

# WGET
# wget -q -O- --post-data $BODY $NOTION_URL --header "content-type: application/json" --header "Authorization: Bearer $NOTION_KEY" --header "Notion-Version: $NOTION_VERSION" --server-response 


CURL
curl -X POST \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer $NOTION_KEY" \
     -H "Notion-Version: $NOTION_VERSION" \
     -d "$BODY" \
     $NOTION_URL
