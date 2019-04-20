//
//  ViewController.swift
//  zheka
//
//  Created by Артем Жорницкий on 18/04/2019.
//  Copyright © 2019 Артем Жорницкий. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var gameEngine = GameEngine(with: 3)
    
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "Restart?", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: { [weak self] (alert) in
            self?.restartTapped()
        })
        alert.addAction(okAction)
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameEngine.colorHandler = { [weak self] (color, index) in
            self?.buttons[index].backgroundColor = color
        }
    }

    func cardTapped(atIndex index: Int) {
        gameEngine.checkCard(atIndex: index)
        
        if gameEngine.state == .weWon {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func restartTapped() {
        gameEngine = GameEngine(with: 3)
    }
}

