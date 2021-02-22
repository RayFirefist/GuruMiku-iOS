//
//  CardsDetail.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import SwiftUI

struct CardsDetail: View {
    
    @State var awaken: Int = 0
    var cardId: Int
    var cardData: CardMaster
    
    init(cardData: CardMaster) {
        self.cardData = cardData
        self.cardId = cardData.id
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                ImageView(withURL: "\(GuruMikuConsts.gameAssetsUrl)/ondemand/card_chara/card_chara_0\(cardId)_\(awaken).jpg")
                ImageView(withURL: "\(GuruMikuConsts.siteAssetsUrl)/chara/frame/frame\(cardData.Rarity).png")
            }
        }.navigationTitle(cardData.CardName)
    }
}

struct CardsDetail_Previews: PreviewProvider {
    static var previews: some View {
        //CardsDetail(cardId: 40430002)
        Text("Ciao")
    }
}
