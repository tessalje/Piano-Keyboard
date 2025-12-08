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
    
    @State private var userInput: [Int] = []
    @State private var navigate = false

    let correctOrder = [7, 7, 10, 10, 10, 10, 7, 7, 9, 9, 6, 9, 9, 9, 8, 8, 8, 7, 9, 9, 9, 9, 8, 8, 8, 7]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.3).ignoresSafeArea()
                VStack {
                    Button {
                        userInput = []
                    } label: {
                        Text("Reset")
                            .font(.system(size: 40))
                    }
                    .offset(x: 500)
                    
                    Text("🎶 Play a song 🎶")
                        .font(.system(size: 60))
                    
                    Text("if u make a mistake, click reset")
                        .font(.system(size: 40))
                    
                    ZStack {
                        // White keys
                        HStack(spacing: 0) {
                            ForEach(whiteKeys.indices, id: \.self) { index in
                                let note = whiteKeys[index]
                                Button {
                                    whiteplay(note: note)
                                    userInput.append(index + 1)
                                    checkSequence()
                                    print(userInput)
                                } label: {
                                    Rectangle()
                                        .fill(.white)
                                        .stroke(.black, lineWidth: 1)
                                        .frame(width: 85, height: 330)
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
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: -510, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "D#4")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: -420, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "F#4")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: -250, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "G#4")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: -170, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "A#4")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: -85, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "C#5")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: 90, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "D#5")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: 175, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "F#5")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: 340, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "G#5")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: 430, y: -64)
                        
                        Button {
                            SoundManager.shared.playSound(named: "A#5")
                        } label: {
                            Rectangle()
                                .fill(.black)
                                .stroke(.black, lineWidth: 1)
                                .frame(width: 65, height: 200)
                                .cornerRadius(3)
                        }
                        .offset(x: 520, y: -64)
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
            
            NavigationLink("", destination: WinView(), isActive: $navigate)
                .hidden()
        }
    }
    
    func whiteplay(note: String) {
        players[note]?.stop()
        players[note]?.currentTime = 0
        players[note]?.play()
    }
    
    func checkSequence() {
        if userInput == correctOrder {
            navigate = true
            userInput.removeAll()
            print("correct")
        }
    }
}


#Preview {
    PianoKeys()
}
