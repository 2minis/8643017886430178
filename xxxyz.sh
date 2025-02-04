#!/bin/bash

GITHUB_API="https://api.github.com/repos"
TOOL_NAME="$1"

check_github() {
    echo "[*] Searching GitHub for $TOOL_NAME..."
    RESPONSE=$(curl -s "${GITHUB_API}/${TOOL_NAME}/releases/latest")
    
    if echo "$RESPONSE" | grep -q "Not Found"; then
        echo "[!] Tool not found on GitHub!"
        return 1
    else
        echo "[*] Tool found on GitHub."
        return 0
    fi
}

install_from_github() {
    check_github
    if [[ $? -eq 0 ]]; then
        LATEST_RELEASE_URL=$(curl -s "${GITHUB_API}/${TOOL_NAME}/releases/latest" | grep "browser_download_url" | cut -d '"' -f 4)
        wget "$LATEST_RELEASE_URL" -O "$TOOL_NAME"
        chmod +x "$TOOL_NAME"
        sudo mv "$TOOL_NAME" /usr/local/bin/
        echo "[*] $TOOL_NAME installed successfully from GitHub!"
        return 0
    fi
    return 1
}

install_tool() {
    echo "[*] Installing $TOOL_NAME..."
    
    # Check if it's installed
    if command -v "$TOOL_NAME" &>/dev/null; then
        echo "[*] $TOOL_NAME is already installed."
        return
    fi

    for PKG in "apt-get install -y" "dnf install -y" "pacman -S --noconfirm" "brew install" "choco install -y" "winget install -e --id"; do
        if command -v ${PKG%% *} &>/dev/null; then
            sudo $PKG "$TOOL_NAME" && return
        fi
    done

    for PKG in "pip install" "gem install" "npm install -g" "cargo install" "go install"; do
        if command -v ${PKG%% *} &>/dev/null; then
            $PKG "$TOOL_NAME" && return
        fi
    done

    install_from_github || echo "[!] Installation failed: Tool not found."
}

if [[ -z "$TOOL_NAME" ]]; then
    echo "Usage: $0 <tool-name>"
    exit 1
fi

install_tool
