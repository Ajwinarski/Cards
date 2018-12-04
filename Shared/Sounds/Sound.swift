//
//  Sound.swift
//  Cards!
//
//  Created by Austin Winarski on 4/2/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import AVFoundation

var soundPlayer: AVAudioPlayer?

func playPop() {
    guard let url = Bundle.main.url(forResource: "pop", withExtension: "wav") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        soundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        
        /* iOS 10 and earlier require the following line:
         soundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let soundPlayer = soundPlayer else { return }
        
        soundPlayer.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

func playFlip() {
    guard let url = Bundle.main.url(forResource: "flip", withExtension: "wav") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        soundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        
        /* iOS 10 and earlier require the following line:
         soundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let soundPlayer = soundPlayer else { return }
        
        soundPlayer.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
