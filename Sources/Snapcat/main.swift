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
            title: "Screenshot ⌘⇧S",
            action: #selector(screenshot),
            keyEquivalent: "s"
        ))

        menu.addItem(NSMenuItem(
            title: "Record ⌘⇧R",
            action: #selector(record),
            keyEquivalent: "r"
        ))

        menu.addItem(NSMenuItem.separator())

        menu.addItem(NSMenuItem(
            title: "Quit",
            action: #selector(quit),
            keyEquivalent: "q"
        ))

        statusItem.menu = menu
    }

    @objc func screenshot() {
        print("screenshot triggered")
    }

    @objc func record() {
        print("record triggered")
    }

    @objc func quit() {
        NSApplication.shared.terminate(nil)
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()

app.delegate = delegate
app.run()