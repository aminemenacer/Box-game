//
//  cardsController.swift
//  box_game
//
//  Created by Mohamed Amine on 19/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import UIKit
import AVFoundation

class cardsController: UIViewController {

    var audioPlayer: AVAudioPlayer?
  
    
    
    @IBOutlet weak var numOfAttempts: UILabel!
    @IBOutlet weak var cardImageOne: UIImageView!
    @IBOutlet weak var cardImageTwo: UIImageView!
    var count = 0
    
    
    override func viewDidLoad() {
     super.viewDidLoad()
       
        cardImageOne.isUserInteractionEnabled = true
        cardImageTwo.isUserInteractionEnabled = true
       
       let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
       swipeRight.direction = UISwipeGestureRecognizer.Direction.right
       cardImageOne.addGestureRecognizer(swipeRight)
       cardImageTwo.addGestureRecognizer(swipeRight)

       let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
       swipeLeft.direction = UISwipeGestureRecognizer.Direction.right
       cardImageOne.addGestureRecognizer(swipeLeft)
       cardImageTwo.addGestureRecognizer(swipeLeft)

    
           
    }
    
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?){
        if let swipeGesture = sendr{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                cardLogic()
                print("swiped right")
            case UISwipeGestureRecognizer.Direction.left:
                cardLogic()
                print("swiped left")
            default:
                break
            }
        }
    }
    
    
    func cardLogic(){
       self.playSound()
        let cardArray = [ #imageLiteral(resourceName: "2C"), #imageLiteral(resourceName: "2D"), #imageLiteral(resourceName: "9D"), #imageLiteral(resourceName: "2H"), #imageLiteral(resourceName: "2S"), #imageLiteral(resourceName: "3C"), #imageLiteral(resourceName: "3D"), #imageLiteral(resourceName: "3H"), #imageLiteral(resourceName: "3S"), #imageLiteral(resourceName: "4C"), #imageLiteral(resourceName: "4D"), #imageLiteral(resourceName: "4H"), #imageLiteral(resourceName: "4S"), #imageLiteral(resourceName: "5C"), #imageLiteral(resourceName: "5D"), #imageLiteral(resourceName: "5H"), #imageLiteral(resourceName: "5S"), #imageLiteral(resourceName: "6C"), #imageLiteral(resourceName: "6D"), #imageLiteral(resourceName: "6H"), #imageLiteral(resourceName: "6S"), #imageLiteral(resourceName: "7C"), #imageLiteral(resourceName: "8C"), #imageLiteral(resourceName: "8D"), #imageLiteral(resourceName: "8H"), #imageLiteral(resourceName: "8S"), #imageLiteral(resourceName: "9C"), #imageLiteral(resourceName: "9D"), #imageLiteral(resourceName: "9H"), #imageLiteral(resourceName: "9S"), #imageLiteral(resourceName: "10C"), #imageLiteral(resourceName: "10D"), #imageLiteral(resourceName: "10H"), #imageLiteral(resourceName: "10S"), #imageLiteral(resourceName: "AC"), #imageLiteral(resourceName: "AD"), #imageLiteral(resourceName: "AH"), #imageLiteral(resourceName: "JC"), #imageLiteral(resourceName: "JD"), #imageLiteral(resourceName: "JH"), #imageLiteral(resourceName: "JS") , #imageLiteral(resourceName: "QC"), #imageLiteral(resourceName: "QD"), #imageLiteral(resourceName: "QH"), #imageLiteral(resourceName: "QS"), #imageLiteral(resourceName: "KC"), #imageLiteral(resourceName: "KD"), #imageLiteral(resourceName: "KH"), #imageLiteral(resourceName: "KS") , #imageLiteral(resourceName: "AC"), #imageLiteral(resourceName: "AD"), #imageLiteral(resourceName: "AH")]
       self.cardImageOne.image = cardArray.randomElement()
       self.cardImageTwo.image = cardArray.randomElement()
       self.counter()
        
    }
    
    @IBAction func testButton(_ sender: Any) {
        cardLogic()
    }
    
      func counter(){
          self.count = count + 1
          self.numOfAttempts.text = String(self.count)
      }
    
    
    @IBAction func resetButton(_ sender: Any) {
           count = 0
           self.numOfAttempts.text = "0"
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

