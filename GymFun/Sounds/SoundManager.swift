//
//  SoundManager.swift
//  GymFun
//
//  Created by Rangga Biner on 28/04/24.
//

import AVFoundation


var player: AVAudioPlayer!


func playSound(name: String, extensionFile: String) {
    let url = Bundle.main.url(forResource: name, withExtension: extensionFile)
    
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

func stopSound() {
    player?.stop()
}
