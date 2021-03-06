//
//  GameScene.swift
//  webinar2
//
//  Created by Poloz on 05/04/2017.
//  Copyright © 2017 Poloz. All rights reserved.
//	
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let playerNode = SKSpriteNode(imageNamed: "myship")
    
    
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
        self.size = view.bounds.size
        setupPlayer()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GameScene.spawnEnemy), userInfo: nil, repeats: true)
    }
    
    func setupPlayer() {
        playerNode.position = CGPoint(x: self.frame.midX, y: self.frame.minY + self.playerNode.size.height)
        self.addChild(playerNode)
    }
    
    func moveShip( touch: UITouch){
        playerNode.position.x = touch.location(in: self).x
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    func shot(){
        func makeShotBullet(isLeftCannon: Bool, player: SKSpriteNode) -> SKSpriteNode{
            let shotNode = SKSpriteNode(imageNamed: "shot")
            shotNode.position.y = playerNode.position.y
            shotNode.zPosition = -1
            let multiplierX: CGFloat = 0.42
            if isLeftCannon {
                shotNode.position.x = playerNode.position.x - playerNode.size.width * multiplierX
            } else {
                shotNode.position.x = playerNode.position.x + playerNode.size.width * multiplierX
            }
            return shotNode
        }
        let shot1 = makeShotBullet(isLeftCannon: true, player: playerNode)
        let shot2 = makeShotBullet(isLeftCannon: false, player: playerNode)
        self.addChild(shot1)
        self.addChild(shot2)
        
        let moveAction = SKAction.moveTo(y: self.size.height, duration: 0.4)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        shot1.run(sequence)
        shot2.run(sequence)
    }
    
    func spawnEnemy(){
        let enemy = SKSpriteNode(imageNamed: "enemyship")
        let x = self.size.width - enemy.size.width
        let y = self.size.width + enemy.size.height
        enemy.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(x))), y: y)
        self.addChild(enemy)
        let moveAction = SKAction.moveTo(y: self.frame.minY, duration: 3)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        enemy.run(sequence)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveShip(touch: touches.first!)
        shot()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveShip(touch: touches.first!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
