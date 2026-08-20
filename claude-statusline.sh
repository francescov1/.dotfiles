#!/bin/sh
# Claude Code statusLine: shows a waiting banner from state files written by the Stop/Notification hooks.
# Prints nothing while running so the row only appears when the session is blocked on the user.
sid=$(jq -r '.session_id // empty')
if [ -n "$sid" ] && [ -f "$HOME/.claude/state/waiting/$sid" ]; then
  printf '\033[1;33m⏺ waiting for you\033[0m'
fi
