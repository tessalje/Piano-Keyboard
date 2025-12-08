//
//  piano.swift
//
//  Created by Tessa Lee on 7/12/25.
//

import SwiftUI
import AVFoundation
import Foundation

struct PianoKeys: View {
    @State private var players: [String: AVAudioPlayer] = [:]
    
    @State private var players2: [String: AVAudioPlayer] = [:]
    
    let whiteKeys = ["C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5", "G5", "A5", "B5"]
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3).ignoresSafeArea()
            VStack {
                Text("🎶 Play a song 🎶")
                    .font(.system(size: 60))
                
                ZStack {
                    // White keys
                    HStack(spacing: 0) {
                        ForEach(whiteKeys, id: \.self) { note in
                            Button {
                                whiteplay(note: note)
                            } label: {
                                Rectangle()
                                    .fill(.white)
                                    .stroke(.black, lineWidth: 1)
                                    .frame(width: 95, height: 350)
                                    .cornerRadius(3)
                            }
                        }
                    }
                    Button {
                        SoundManager.shared.playSound(named: "C#4")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: -570, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "D#4")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: -470, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "F#4")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: -300, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "G#4")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: -200, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "A#4")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: -100, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "C#5")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: 100, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "D#5")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: 200, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "F#5")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: 380, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "G#5")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: 480, y: -74)
                    
                    Button {
                        SoundManager.shared.playSound(named: "A#5")
                    } label: {
                        Rectangle()
                            .fill(.black)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 80, height: 200)
                            .cornerRadius(3)
                    }
                    .offset(x: 580, y: -74)
                }
            }
        }
        .onAppear {
            SoundManager.shared.loadSound(named: "C#4", withExtension: "wav")
            SoundManager.shared.loadSound(named: "D#4", withExtension: "wav")
            SoundManager.shared.loadSound(named: "F#4", withExtension: "wav")
            SoundManager.shared.loadSound(named: "G#4", withExtension: "wav")
            SoundManager.shared.loadSound(named: "A#4", withExtension: "wav")
            SoundManager.shared.loadSound(named: "C#5", withExtension: "wav")
            SoundManager.shared.loadSound(named: "D#5", withExtension: "wav")
            SoundManager.shared.loadSound(named: "F#5", withExtension: "wav")
            SoundManager.shared.loadSound(named: "G#5", withExtension: "wav")
            SoundManager.shared.loadSound(named: "A#5", withExtension: "wav")
            for note in whiteKeys {
                if let url = Bundle.main.url(forResource: note, withExtension: "wav") {
                    players[note] = try? AVAudioPlayer(contentsOf: url)
                    players[note]?.prepareToPlay()
                }
            }
        }
    }
    
    func whiteplay(note: String) {
        players[note]?.stop()
        players[note]?.currentTime = 0
        players[note]?.play()
    }
}


#Preview {
    PianoKeys()
}
