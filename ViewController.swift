//
//  ViewController.swift
//  box_game
//
//  Created by Mohamed Amine on 16/06/2020.
//  Copyright © 2020 Mohamed Amine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var coinsBtn: UIButton!
    @IBOutlet weak var cardsBtn: UIButton!
    @IBOutlet weak var dicesBtn: UIButton!
    
    

    @IBOutlet weak var cardText: UIButton!
    @IBOutlet weak var dicesText: UIButton!
    @IBOutlet weak var coinsText: UIButton!
    
    

    
    
    
    @IBAction func info(_ sender: Any) {
        showAlertAction(title: "Box game", message: "This app has been developed by Mohamed Amine")

    }
    
    
    
     func showAlertAction(title: String, message: String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
           }))
           alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }

    
    
}

