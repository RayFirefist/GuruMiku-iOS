//
//  GameScene.swift
//  GuruMiku
//
//  Created by Ray on 22/02/21.
//

import SpriteKit
import GameplayKit
import Spine

extension Skeleton {
    public convenience init?(jsonData: String, atlasFile: String? = nil, pngFile: String? = nil) {
        let data = SyncHttpQueryAsData(address: jsonData)
        do {
            let model = try JSONDecoder().decode(SpineModel.self, from: data)
            self.init(model, atlas: atlasFile)
            applySkin(named: pngFile)
        }
        catch {
            print(error.localizedDescription, error)
            return nil
        }
        //guard let model = try? JSONDecoder().decode(SpineModel.self, from: data) else { return nil }
    }
}

class GameScene: SKScene {
    
    var spineName: String = ""
    
    func setSpineName(name: String) {
        self.spineName = name
    }
    
    private func getPath(ext: String) -> String {
        return "\(GuruMikuConsts.gameAssetsUrl)/ondemand/spine/spine_chara_\(spineName).\(ext)"
    }
    
    override func didMove(to view: SKView) {
        if let character = Skeleton(jsonData: getPath(ext: "json"), atlasFile: getPath(ext: "atlas"), pngFile: getPath(ext: "png")) {
            character.name = name
            //character.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2) - 200)
            character.position = CGPoint(x: 0, y: 0)
            
            self.addChild(character)
            
            if let walkAnimation = character.animation(named: "walk") {
                character.run(SKAction.repeatForever(walkAnimation))
            }
            print("Success on creating the spine chara")
        }
        else {
            print("Failed to create Spine Character")
        }
    }
}
