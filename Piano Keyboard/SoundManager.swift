//
//  SoundManager.swift
//  Escape room
//
//  Created by Tessa Lee on 8/12/25.
//
import SwiftUI
import AVFoundation

class SoundManager {
    static let shared = SoundManager() // Singleton for easy access
    var players: [String: AVAudioPlayer] = [:]

    func loadSound(named name: String, withExtension ext: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("Sound file \(name).\(ext) not found.")
            return
        }
        do {
            players[name] = try AVAudioPlayer(contentsOf: url)
            players[name]?.prepareToPlay() // Pre-load the sound
        } catch {
            print("Error loading sound \(name): \(error.localizedDescription)")
        }
    }

    func playSound(named name: String) {
        players[name]?.play()
    }
}
