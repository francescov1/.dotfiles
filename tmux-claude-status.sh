#!/bin/sh
# Status-bar chip for Claude Code panes waiting on input (@claude_waiting set by claude hooks).
n=$(/opt/homebrew/bin/tmux list-panes -a -F '#{@claude_waiting}' | grep -c .)
if [ "$n" -gt 0 ]; then
  printf '#[fg=#ffb000,bold]⏺ %s waiting#[default] ' "$n"
else
  printf '#[fg=colour240]⏺#[default] '
fi
