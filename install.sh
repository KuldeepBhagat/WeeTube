TARGET="$HOME/.local/share/applications/WeeTube.desktop"

echo "Installing Youtube client to: $TARGET"


mkdir -p "$(dirname "$TARGET")"

cp app/WeeTube.desktop "$TARGET"

chmod +x "$TARGET"

chmod +x ~/.local/share/applications/WeeTube.desktop
update-desktop-database "$HOME/.local/share/applications/" 2>/dev/null

echo "✅ Installed! Launch it from your app menu"