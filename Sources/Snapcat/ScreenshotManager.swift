import Cocoa

class ScreenshotManager {

    static let shared = ScreenshotManager()

    func capture() {

        guard let screen = NSScreen.main else { return }

        let rect = screen.frame

        guard let image = CGWindowListCreateImage(
            rect,
            .optionOnScreenOnly,
            kCGNullWindowID,
            .bestResolution
        ) else { return }

        let rep = NSBitmapImageRep(cgImage: image)

        guard let data = rep.representation(using: .png, properties: [:]) else { return }

        let filename = "snapcat-\(Int(Date().timeIntervalSince1970)).png"

        let url = FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Desktop/\(filename)")

        try? data.write(to: url)

        NSPasteboard.general.clearContents()
        NSPasteboard.general.setData(data, forType: .png)
    }
}
