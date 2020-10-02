//
//  diceController.swift
//  box_game
//
//  Created by Mohamed Amine on 17/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import UIKit
import AVFoundation

class cardController: UIViewController {

    var audioPlayer: AVAudioPlayer?
  
    @IBOutlet weak var numOfAttempts: UILabel!
    
    @IBOutlet weak var cardImageOne: UIImageView!
    @IBOutlet weak var cardImageTwo: UIImageView!
    var count = 0

        

    @IBAction func resetButton(_ sender: Any) {
        count = 0
        self.numOfAttempts.text = "0"
    }
    
    
    
    @IBAction func test(_ sender: Any) {
         self.playSound()
           let cardArray = [ #imageLiteral(resourceName: "3H"), #imageLiteral(resourceName: "9H"), #imageLiteral(resourceName: "9D"), #imageLiteral(resourceName: "4S"), #imageLiteral(resourceName: "10S"), #imageLiteral(resourceName: "2S") ]
           self.cardImageOne.image = cardArray.randomElement()
           self.cardImageTwo.image = cardArray.randomElement()
           self.counter()
    }
    
    func counter(){
        self.count = count + 1
        self.numOfAttempts.text = String(self.count)
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "swipe", withExtension: "mp3") else { return }

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
