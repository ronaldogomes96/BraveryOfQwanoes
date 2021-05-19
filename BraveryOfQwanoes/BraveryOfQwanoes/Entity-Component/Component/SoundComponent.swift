//
//  SoundComponent.swift
//  BraveryOfQwanoes
//
//  Created by Ronaldo Gomes on 12/03/21.
//

import Foundation
import UIKit
import AVFoundation

class SoundComponent {
    
    var nameSound: String
    var player: AVAudioPlayer?

    init(nameSound: String) {
        self.nameSound = nameSound
    }
    
    func stopSound() {
        player?.stop()
    }
    
    func setVolume(volume: Float) {
        player?.volume = volume
    }
    
    func playSound(volume: Float = 0.5) {
        let soundEnable = UserDefaults.standard.bool(forKey: "Sound")
        if soundEnable {
            guard let url = Bundle.main.url(forResource: nameSound, withExtension: "mp3") else { return }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                    /* iOS 10 and earlier require the following line:
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                    guard let player = player else { return }
                    player.volume = volume
                    player.numberOfLoops = -1

                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }
        } else {
            stopSound()
        }
    }
}
