#!/bin/bash

URL="https://megahtex.com/"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

if [[ "$STATUS" != "200" ]]; then
  MESSAGE="⚠️ Website issue\nURL: $URL\nStatus: $STATUS"

  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_MT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_BOT_MT_UPTIME" \
    -d text="Check MegahTex Ecomm"
fi
