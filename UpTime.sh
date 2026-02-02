#!/bin/bash

URL="https://megahtex.com/thispagedoesntexist"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

if [[ "$STATUS" != "200" ]]; then
  MESSAGE="⚠️ Website issue\nURL: $URL\nStatus: $STATUS"

  curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
    -d chat_id="${TELEGRAM_CHAT_ID}" \
    -d text="Check MegahTex Ecomm"
fi

# set -x

# curl -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
#   -d chat_id="${TELEGRAM_CHAT_ID}" \
#   -d text="DEBUG: GitHub Actions can reach Telegram"
