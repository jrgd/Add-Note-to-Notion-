# AN - Add Notes (to Notion)


[ ] fix the tags
[ ] accept a request without all the parameters


## Basics

- Currently, the three ARGS are required title, content, tags
- the tags are not split, so the string forms a single tag

## Top install and use this

### CLI

	zsh an.sh 'title' 'content' 'tags'

### needs notion.env with the page_id and the secret
see: https://www.notion.so/my-integrations
The file should contain the following
	NOTION_DATABASE_ID=""
	NOTION_KEY=""
	NOTION_VERSION="2022-06-28"
	NOTION_URL="https://api.notion.com/v1/pages"
- remember the NOTION_KEY will only work if the parent page has been "shared" with the integration: go on the Page inside of Notion; use the horizontal three dots to access Connectr To where you can pick the App to connect to (ours was called Notes CLI)


### Needs JQ to mash up JSON from CLI
brew install jq

### Needs either Curl or Wget
install which ever you prefer and edit the script
As I'm developing this, i'm still working with wget