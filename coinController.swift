//
//  coinController.swift
//  box_game
//
//  Created by Mohamed Amine on 17/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import UIKit
import AVFoundation

class coinController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var numberTotalLabel: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    var audioPlayer: AVAudioPlayer?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinImage.isUserInteractionEnabled = true
       // background.isUserInteractionEnabled = true
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.right
        coinImage.addGestureRecognizer(swipeUp)
        
    }
   
    
    func coinLogin(){
         self.playSound()
         let coinArray = [ #imageLiteral(resourceName: "blue_coin"), #imageLiteral(resourceName: "gold_coin"), #imageLiteral(resourceName: "brown_coin"), #imageLiteral(resourceName: "light_blue_coin"), #imageLiteral(resourceName: "pink_coin"), #imageLiteral(resourceName: "red_coin"), #imageLiteral(resourceName: "green_coin"), #imageLiteral(resourceName: "purple_coin"), #imageLiteral(resourceName: "orange_coin"), #imageLiteral(resourceName: "silver_coin")]
         self.coinImage.image = coinArray.randomElement()
         self.counter()
    }
    
    
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?){
        if let swipeGesture = sendr{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                coinLogin()
                print("swiped right")
            default:
                break
            }
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0;
        self.numberTotalLabel.text = "0"
    }
    

    func counter(){
        self.count = count + 1
        self.numberTotalLabel.text = String(self.count)
    }
    
    
   
    func playSound() {
        guard let url = Bundle.main.url(forResource: "coin", withExtension: "wav") else { return }

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
