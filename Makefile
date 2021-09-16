# The JSON list of emoji is maintained at github.com/CodeFreezr/emojo
# Found looking at golang lib https://github.com/kyokomi/emoji
.PHONY: data/emojilist.txt
data/emojilist.txt:
	mkdir -p data
	curl --location https://raw.githubusercontent.com/CodeFreezr/emojo/master/db/v5/emoji-v5.json | \
		jq --raw-output '.[] | (.Shortcode + " " + .Emoji)' \
		> data/emojilist.txt

.PHONY: install
install:
	ln -s "$(shell pwd)/bin/emojimenu" ~/bin/emojimenu
