#!/usr/bin/env zsh
set -euo pipefail

GUEST_DIR="${HOME}/.chezmoi-guest"
REPO="jasyyang/dotfiles"

info() { printf '\033[1;34m%s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m%s\033[0m\n' "$*"; }
error() { printf '\033[1;31m%s\033[0m\n' "$*" >&2; exit 1; }

if [[ -d "$GUEST_DIR" ]]; then
    info "Guest directory exists, re-entering shell..."
else
    info "Installing chezmoi to guest directory..."
    mkdir -p "${GUEST_DIR}/.local/bin"
    if ! command -v chezmoi &>/dev/null; then
        sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${GUEST_DIR}/.local/bin"
    fi
    CHEZMOI="${GUEST_DIR}/.local/bin/chezmoi"
    [[ -x "$CHEZMOI" ]] || CHEZMOI="$(command -v chezmoi)"

    info "Applying dotfiles to ${GUEST_DIR}..."
    "$CHEZMOI" init --apply --destination "$GUEST_DIR" "$REPO"
fi

info "  - Your dotfiles are isolated in ${GUEST_DIR}"
info "  - Type 'exit' to return to normal shell"
info "  - Run 'rm -rf ${GUEST_DIR}' to clean up"
echo ""

export ZDOTDIR="$GUEST_DIR"
export XDG_CONFIG_HOME="${GUEST_DIR}/.config"
export XDG_DATA_HOME="${GUEST_DIR}/.local/share"
export STARSHIP_CONFIG="${GUEST_DIR}/.config/starship.toml"
export CHEZMOI_GUEST=1

exec zsh -l
