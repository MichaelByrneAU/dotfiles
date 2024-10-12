#!/usr/bin/env fish

uv generate-shell-completion fish >~/.config/fish/completions/uv.fish
uvx --generate-shell-completion fish >~/.config/fish/completions/uvx.fish
