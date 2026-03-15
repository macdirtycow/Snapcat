import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {

        NSApp.setActivationPolicy(.accessory)

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "camera", accessibilityDescription: "Snapcat")
        }

        let menu = NSMenu()

        menu.addItem(NSMenuItem(
            title: "Capture Screen",
            action: #selector(capture),
            keyEquivalent: "s"
        ))

        menu.addItem(NSMenuItem.separator())

        menu.addItem(NSMenuItem(
            title: "Quit",
            action: #selector(quit),
            keyEquivalent: "q"
        ))

        statusItem.menu = menu

        HotkeyManager.shared.register()
    }

    @objc func capture() {
        ScreenshotManager.shared.capture()
    }

    @objc func quit() {
        NSApplication.shared.terminate(nil)
    }
}
