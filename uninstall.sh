echo "Uninstalling WeeTube"
rm "$HOME/.local/share/applications/WeeTube.desktop"
update-desktop-database ~/.local/share/applications/ 2>/dev/null
echo "✅ Uninstalled."