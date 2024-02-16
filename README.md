```
sed -i '' "s|~|$HOME|g" ./src/AuthTheme.swift
sed -i '' "s|~|$HOME|g" ./pro.aidan.auto-theme.plist
swiftc -o pro.aidan.AutoTheme.bin src/AuthTheme.swift
cp pro.aidan.* ~/Library/LaunchAgents/
```


```
sudo launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/pro.aidan.auto-theme.plist
sudo launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/pro.aidan.auto-theme.plist
```
