#!/bin/sh
# Claude Code statusLine: shows waiting/running from state files written by the Stop/Notification hooks.
sid=$(jq -r '.session_id // empty')
if [ -n "$sid" ] && [ -f "$HOME/.claude/state/waiting/$sid" ]; then
  printf '\033[1;33m⏺ waiting for you\033[0m'
else
  printf '\033[2m⏺ running\033[0m'
fi
