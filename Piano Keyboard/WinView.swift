//
//  WinView.swift
//  Piano Keyboard
//
//  Created by Tessa Lee on 8/12/25.
//

import SwiftUI
import AVKit

struct WinView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("You did it!🎉")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                
                Text("Watch this tutorial to solve the puzzle and retrieve the ball")
                    .font(.system(size: 30))
                    .foregroundStyle(.red)
                
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "tutorial", withExtension: "mp4")!))
                    .frame(height: 600)
            }
        }
    }
}

#Preview {
    WinView()
}
