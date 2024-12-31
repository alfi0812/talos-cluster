#!/usr/bin/env bash
set -e
set -o noglob

sudo apk add pre-commit

# Setup fisher plugin manager for fish and install plugins
/usr/bin/fish -c "
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install edc/bass
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install PatrickF1/fzf.fish
"

kubectl krew install pv-mounter
kubectl krew install cnpg
kubectl krew install df-pv
