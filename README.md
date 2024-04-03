# AN - Add Notes (to Notion)


## Basics
- Currently, there's only one ARG required: title
- 'title' can contain #multiple #tags — they will be parsed out from the title and inserted as tag inside Notion
- 'content' is the second ARG (optionnal) and let's you write some more inside the body of the page

## Next
[x] integrate with Alfred
[ ] create a local backup
[ ] review former scripts and experiments to create notes, logs, etc.

## To install and use this
### CLI
	zsh an.sh 'title' 'content'
NB: 'title' can contain #tags, they will be parsed with the following assumption: #tag1 #tag2 #tag3 are three distinct tags; there is no space within a single tag.

### needs notion.env with the page_id and the secret
see: https://www.notion.so/my-integrations
The file should contain the following
	NOTION_DATABASE_ID=""
	NOTION_KEY=""
	NOTION_VERSION="2022-06-28"
	NOTION_URL="https://api.notion.com/v1/pages"
- remember the NOTION_KEY will only work if the parent page has been "shared" with the integration: go on the Page inside of Notion; use the horizontal three dots to access Connectr To where you can pick the App to connect to (ours was called Notes CLI)
- nb: we use the notions.env to store also the ENVIRONMENT variable

### Needs JQ to mash up JSON from CLI
brew install jq

### Needs either Curl or Wget
install which ever you prefer and edit the script
As I'm developing this, i'm still working with ~~wget~~ curl.

### Running it
- your bourne might not be the same as mine
- zsh: edit ~/.zshrc to create an alias; export $PATH and chmod +x an.sh to make it executable

### Alfred Workflow [WIP]
use the configure workflow to insert where you've stored the script