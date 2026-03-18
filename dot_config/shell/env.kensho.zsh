# Profile identifier (used by nvim)
export CONFIG_PROFILE=kensho

# 1Password SSH Agent (macOS)
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# PATH
export PATH="$PATH:/opt/homebrew/opt/php@8.4/bin:/opt/homebrew/opt/php@8.4/sbin"
export PATH="$PATH:/opt/homebrew/opt/freetds/bin"
export PATH="$PATH:/opt/homebrew/opt/libxml2/bin:/opt/homebrew/opt/libxslt/bin"

# UV (Kensho PyPI)
export UV_DEFAULT_INDEX=https://pypi.infra.kensho.com/simple
export UV_NATIVE_TLS=true

# Kensho
export KENSHO_USE_PG=1
export AWS_PROFILE=kensho
export NODE_OPTIONS="--use-system-ca"
