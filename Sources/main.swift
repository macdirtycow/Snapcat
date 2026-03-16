import Cocoa

// Main entry point
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Snapcat started! Press Command+Shift+S to take a screenshot")
        setupHotkey()
    }
    
    func setupHotkey() {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            let flags = event.modifierFlags
            let isCommandShiftS = flags.contains(.command) && 
                                  flags.contains(.shift) && 
                                  event.characters == "s"
            
            if isCommandShiftS {
                self.takeScreenshot()
            }
        }
    }
    
    func takeScreenshot() {
        let timestamp = DateFormatter()
        timestamp.dateFormat = "yyyy-MM-dd_HH-mm-ss"
        let filename = "Screenshot_\(timestamp.string(from: Date())).png"
        
        let desktopURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
        let fileURL = desktopURL.appendingPathComponent(filename)
        
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = ["-x", fileURL.path]
        
        do {
            try task.run()
            print("Screenshot saved: \(filename)")
        } catch {
            print("Error: \(error)")
        }
    }
}
