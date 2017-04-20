//
//  MainMenu.swift
//  webinar2
//
//  Created by trbrmrdr on 14/04/2017.
//  Copyright © 2017 Poloz. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    override func didMove(to view: SKView) {
        //print("MainMenu running!")
        let title:SKLabelNode = self.childNode(withName: "title") as! SKLabelNode
        let mascot:SKSpriteNode = title.childNode(withName: "mascot") as! SKSpriteNode
        //mascot.removeFromParent()
        //self.removeAllChildren()
        //title.addChild(mascot)
        //mascot.position = CGPoint(x: 0, y: -120)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = MainMenu(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1.0))
            }
        }
    }

}
