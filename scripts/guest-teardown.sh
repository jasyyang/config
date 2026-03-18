#!/usr/bin/env zsh
set -euo pipefail

GUEST_DIR="${HOME}/.chezmoi-guest"

info() { printf '\033[1;34m%s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m%s\033[0m\n' "$*"; }
error() { printf '\033[1;31m%s\033[0m\n' "$*" >&2; exit 1; }

if [[ ! -d "$GUEST_DIR" ]]; then
    error "Guest directory not found: $GUEST_DIR\nNothing to clean up."
fi

if [[ -n "${CHEZMOI_GUEST:-}" ]]; then
    warn "You're inside the guest shell. Exit first, then run teardown."
    exit 1
fi

info "Removing guest directory..."
rm -rf "$GUEST_DIR"

info "Done. No trace left."
