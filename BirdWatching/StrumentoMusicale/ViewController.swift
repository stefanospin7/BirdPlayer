//
//  ViewController.swift
//  StrumentoMusicale
//
//  Created by Stefano  on 15/06/22.
//

import UIKit

import AVFoundation




class ViewController: UIViewController {

    var player : AVAudioPlayer!
    var nomeMp3:String = ""
    
   
    class Haptics {
        static let shared = Haptics()
        
        private init() { }

        func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
            UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
        }
        
        func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
            UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
        }
    }


    
    //haptic
  
    
 
    @IBAction func monkey00(_ sender: UIButton) {
        

 
        Haptics.shared.play(.heavy)

        playSound(nomeMp3: "domesticChicken00")
        
   
    }
    
    @IBAction func monkey01(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
     
        playSound(nomeMp3: "red-billedQuelea01")
    }
    
    @IBAction func monkey02(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
        playSound(nomeMp3: "mourningDove02")
    }
    
    @IBAction func monkey03(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
        playSound(nomeMp3: "americanRobin03")
    }
    
    @IBAction func monkey04(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
        playSound(nomeMp3: "commonPheasant04")
    }
    
    
    @IBAction func monkey05(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
        playSound(nomeMp3: "red-wingedBlackbird05")
    }
    
    @IBAction func monkey06(_ sender: UIButton) {
        Haptics.shared.play(.heavy)
        playSound(nomeMp3: "chippingSparrow06")
    }
    @IBAction func monkey07(_ sender: UIButton) {
        playSound(nomeMp3: "commonStarling07")
    }
    
    
    @IBAction func button08(_ sender: UIButton) {
        playSound(nomeMp3: "commonSwift08")
    }
    
    
    @IBAction func button09(_ sender: UIButton) {
        
        playSound(nomeMp3: "yellow-rumpedWarbler09")
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        player.pause()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    func playSound(nomeMp3:String) {
        
        print("#####")
        
        guard let url = Bundle.main.url(forResource: nomeMp3, withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
//    private func generateHapticFeedback(for hapticFeedback: HapticFeedback) {
//        switch hapticFeedback {
//        case .selection:
//            // Initialize Selection Feedback Generator
//            let feedbackGenerator = UISelectionFeedbackGenerator()
//
//            // Trigger Haptic Feedback
//            feedbackGenerator.selectionChanged()
//        case .impact(let feedbackStyle):
//            // Initialize Impact Feedback Generator
//            let feedbackGenerator = UIImpactFeedbackGenerator(style: feedbackStyle)
//
//            // Trigger Haptic Feedback
//            feedbackGenerator.impactOccurred()
//        case .notification(let feedbackType):
//            // Initialize Notification Feedback Generator
//            let feedbackGenerator = UINotificationFeedbackGenerator()
//
//            // Trigger Haptic Feedback
//            feedbackGenerator.notificationOccurred(feedbackType)
//        }
//    }
    

}
