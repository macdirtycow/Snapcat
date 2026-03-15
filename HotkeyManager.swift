import Cocoa
import Carbon

class HotkeyManager {

    static let shared = HotkeyManager()

    func register() {

        var hotKeyRef: EventHotKeyRef?

        var hotKeyID = EventHotKeyID(
            signature: OSType(32),
            id: UInt32(1)
        )

        RegisterEventHotKey(
            UInt32(kVK_ANSI_4),
            cmdKey | shiftKey,
            hotKeyID,
            GetApplicationEventTarget(),
            0,
            &hotKeyRef
        )

        InstallEventHandler(
            GetApplicationEventTarget(),
            { (_, event, _) -> OSStatus in

                var hkID = EventHotKeyID()
                GetEventParameter(
                    event,
                    EventParamName(kEventParamDirectObject),
                    EventParamType(typeEventHotKeyID),
                    nil,
                    MemoryLayout<EventHotKeyID>.size,
                    nil,
                    &hkID
                )

                ScreenshotManager.shared.capture()

                return noErr
            },
            1,
            [EventTypeSpec(
                eventClass: OSType(kEventClassKeyboard),
                eventKind: UInt32(kEventHotKeyPressed)
            )],
            nil,
            nil
        )
    }
}
