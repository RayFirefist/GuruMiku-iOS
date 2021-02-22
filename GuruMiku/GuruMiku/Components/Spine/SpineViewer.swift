//
//  SpineViewer.swift
//  GuruMiku
//
//  Created by Ray on 22/02/21.
//

import SwiftUI
import Spine
import SpriteKit
import GameplayKit

struct SpineViewer: View {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var scene: SKScene {
        let scene = GameScene()
        scene.setSpineName(name: name)
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}

struct SpineViewer_Previews: PreviewProvider {
    static var previews: some View {
        SpineViewer(name: "0000000")
    }
}
