#!/bin/bash

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)
   VALUE="${ARGUMENT:${#KEY}+1}"
   export "$KEY"="$VALUE"
done

PARSE_MODE="Markdown"
HEADER="*UPDATE ⚙️*"
WHAT_CHANGED="*WHAT CHANGED?*"

if [ -z "$DETAILS" ]; then
   DETAILS="Developer left no comments"
fi

MESSAGE="$HEADER%0A%0A$PR_TITLE%0A%0A$WHAT_CHANGED%0A$DETAILS%0A%0A_repository name_| $REPOSITORY_NAME%0A_developer_| $DEVELOPER_LOGIN%0A_link_| $PR_LINK"
curl -s -X POST "https://api.telegram.org/bot$BOT_API_KEY/sendMessage" -d chat_id="$CHAT_ID" -d text="$MESSAGE" -d parse_mode="$PARSE_MODE"
