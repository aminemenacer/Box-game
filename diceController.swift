//
//  diceController.swift
//  box_game
//
//  Created by Mohamed Amine on 17/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import UIKit
import AVFoundation

class diceController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var numberTotalLabel: UILabel!
    
    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    var count = 0

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 0){
            self.playSound()
            let diceArray = [ #imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6") ]
            self.diceImageOne.image = diceArray.randomElement()
            self.diceImageTwo.image = diceArray.randomElement()
            self.counter()
        }
    }
    
    @IBAction func reserButton(_ sender: Any) {
        count = 0;
        self.numberTotalLabel.text = "0"
        
    }

    
    func counter(){
        self.count = count + 1
        self.numberTotalLabel.text = String(self.count)
    }
    
    
   
    func playSound() {
        guard let url = Bundle.main.url(forResource: "dice", withExtension: "wav") else { return }

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
