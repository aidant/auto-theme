import Cocoa

func handleThemeChanged() {
  let isDark = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"

  let child = Process()
  child.launchPath = "/usr/bin/env"
  child.arguments = [
    "zsh",
    "-c",
    "source ~/.zsh_functions; auto-theme \(isDark ? "dark" : "light")"
  ]
  child.launch()
  child.waitUntilExit()
}

DistributedNotificationCenter.default.addObserver(
  forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
  object: nil,
  queue: nil
) {
  (notification) in handleThemeChanged()
}

NSApplication.shared.run()
