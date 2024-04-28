//
//  SoundManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import AVFoundation

var player: AVAudioPlayer!

func playSound() {
    let url = Bundle.main.url(forResource: "mclaren", withExtension: "mp3")
    
    // do nothing if this url is empty
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("\(error)")
    }
}
