//
//  KEKeySound.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/03.
//

import AudioToolbox

public enum KEKeySound {
    static func playSystemSound(_ sound: String) {
        let soundsPath = "/System/Library/Audio/UISounds/\(sound)"
        let url = NSURL(fileURLWithPath: soundsPath)
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }

    public static func tapDelete() {
        // key_press_delete.caf: 1155
        playSystemSound("key_press_delete.caf")
    }

    public static func tapModifier() {
        // key_press_modifier.caf: 1156
        playSystemSound("key_press_modifier.caf")
    }
}
