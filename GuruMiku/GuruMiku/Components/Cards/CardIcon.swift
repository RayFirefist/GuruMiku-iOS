//
//  CardIcon.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import SwiftUI

struct CardIcon: View {
    
    var framePngName: String = ""
    var cardId: Int = 0
    var awaken: Int = 0
    var attribute: String = ""
    
    init(cardId: Int, rarity: Int, awaken: Bool = false, attribute: Int? = nil) {
        self.framePngName = ""
        self.cardId = cardId
        self.attribute = CardMasterAttributes[attribute ?? 1] ?? "party"
        if (rarity > 1) {
            self.framePngName = "frame\(rarity).png"
        }
        else {
            self.framePngName = "frame\(rarity)_\(self.attribute).png"
        }
        self.awaken = awaken ? 1 : 0
    }
    
    var body: some View {
        ZStack {
            ImageView(withURL: "\(GuruMikuConsts.gameAssetsUrl)/ondemand/card_icon/card_icon_0\(cardId)_\(awaken).jpg", width: 100)
            ImageView(withURL: "\(GuruMikuConsts.siteAssetsUrl)/chara/icon/\(framePngName)", width: 100)
            ImageView(withURL: "\(GuruMikuConsts.siteAssetsUrl)/chara/type/icon_\(attribute).png", width: 23, offsetX: 36, offsetY: -35)
        }
    }
}

struct CardIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                ZStack {
                    CardIcon(cardId: 40430002, rarity: 3)
                }
                Text("Hey DJ!").padding()
            }
            HStack {
                CardIcon(cardId: 40430002, rarity: 1, attribute: 1)
                Text("Hey DJ!").padding()
            }
            HStack {
                CardIcon(cardId: 40430002, rarity: 4)
                Text("Hey DJ!").padding()
            }
        }
    }
}
