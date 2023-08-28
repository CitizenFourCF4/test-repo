#!/bin/bash

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)
   VALUE="${ARGUMENT:${#KEY}+1}"

   export "$KEY"="$VALUE"
done

# use here your expected variables
echo "PR_TITLE = $PR_TITLE"
echo "REPOSITORY_NAME = $REPOSITORY_NAME"
echo "DETAILS = $DETAILS"
echo "DEVELOPER_LOGIN = $DEVELOPER_LOGIN"

BOT_API_KEY="6634635160:AAG2A8EHdfRafEOZUsKgpEjAaz8uWy0yjYg"
CHAT_ID="453041569"
PARSE_MODE="Markdown"

HEADER="*UPDATE ⚙️*"

if [ -z "$DETAILS" ]; then
   DETAILS="Developer left no comments"
fi

MESSAGE="$HEADER%0A%0A$PR_TITLE%0A%0A_repository name_| $REPOSITORY_NAME%0A_developer_| $DEVELOPER_LOGIN%0A_details_| $DETAILS"
curl -s -X POST "https://api.telegram.org/bot$BOT_API_KEY/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE" -d parse_mode="$PARSE_MODE"

