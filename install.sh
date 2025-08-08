BROWSER_FILE="assets/browser.txt"
DESKTOP_FILE="$HOME/.local/share/applications/WeeTube.desktop"
TEMPLATE_FILE="app/Browser.desktop"

available_browsers=()
while read -r browser; do
    if command -v "$browser" >/dev/null 2>&1; then
        available_browsers+=("$browser")
    fi
done < "$BROWSER_FILE"

if [ ${#available_browsers[@]} -eq 0 ]; then
    echo "❌ No supported browsers found!"
    exit 1
elif [ ${#available_browsers[@]} -eq 1 ]; then
    chosen_browser="${available_browsers[0]}"
    echo "✅ Found browser: $chosen_browser"
else
    echo "Multiple browsers found:"
    for i in "${!available_browsers[@]}"; do
        echo "$((i+1)): ${available_browsers[$i]}"
    done
    read -rp "Choose browser: " choice
    chosen_browser="${available_browsers[$((choice-1))]}"
fi

mkdir -p "$(dirname "$DESKTOP_FILE")"
mkdir -p "$HOME/.local/share/icons"
cp "$TEMPLATE_FILE" "$DESKTOP_FILE"
cp assets/Wee.png "$HOME/.local/share/icons/"

sed -i "s|Exec=.*|Exec=$chosen_browser --class=YouTubeClient --app=https://www.youtube.com --new-window|" "$DESKTOP_FILE"

chmod +x "$DESKTOP_FILE"
update-desktop-database "$HOME/.local/share/applications/" 2>/dev/null

echo "✅ Installed with browser: $chosen_browser"
