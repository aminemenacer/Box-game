//
//  numberController.swift
//  box_game
//
//  Created by Mohamed Amine on 17/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class numberController:ViewController{
    
    var count = 0
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var numberText: UILabel!
    @IBOutlet weak var numAttemptsText: UILabel!
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch2.isOn = false
        
    }
    
    
    
    @IBAction func switchChangeBtn2(_ sender: Any) {
        if(switch2.isOn){
            switch1.isOn = false
            numberText.text = (String(arc4random_uniform(51) + 50))
            counter()
            playSound()
            print("number generated")
        }else{
            
        }
    }
    
    
    
    @IBAction func switchChangeBtn(_ sender: Any) {
        if(switch1.isOn){
            switch2.isOn = false
            numberText.text = String(arc4random_uniform(50))
            counter()
            playSound()
            print("number generated")
        }else {
          
        }
    }
    
    
    
    
    
    @IBAction func numberGeneratorButton(_ sender: Any) {
       
    }
    
    @IBAction func resetButton(_ sender: Any) {
       count = 0;
       self.numAttemptsText.text = "0"
    }
    
    func counter(){
        self.count = count + 1
        self.numAttemptsText.text = String(self.count)
    }
    
    func reset(){
        count = 0;
        self.numberText.text = "0"
    }
    
    func playSound() {
         guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else { return }

         do {
             try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
             try AVAudioSession.sharedInstance().setActive(true)

             /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
             audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

             /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

             guard let player = audioPlayer else { return }

             player.play()

         } catch let error {
             print(error.localizedDescription)
         }
     }
    
}


