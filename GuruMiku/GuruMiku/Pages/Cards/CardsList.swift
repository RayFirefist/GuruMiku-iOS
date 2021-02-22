//
//  CardsList.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class CardsListModel : ObservableObject {
    @Published var cardsList: [String:CardMaster] = [:]
    @Published var characterMaster: [String:CharacterMaster] = [:]

    init() {
        let body: [String:[String]] = ["dbs":["CardMaster","CharacterMaster"]]
        var this = self
        AF.request(GuruMikuConsts.apiMultipleRequestUrl, method: .post, parameters: body, encoder: JSONParameterEncoder.sortedKeys)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MultipleApiResponse.self) { (response) in
                guard let data = response.value else {
                    print(response)
                    return
                }
                this.cardsList = data.result.CardMaster
                this.characterMaster = data.result.CharacterMaster
                print(this.cardsList.count, this.characterMaster.count)
            }
    }
    
    func getSortedCards() -> [CardMaster] {
        return cardsList.values.sorted {
            $0.id < $1.id
        }
    }
    
    func getCharacterName(characterId: Int) -> String {
        for (_, value) in characterMaster {
            if (value.Id == characterId) {
                return value.FullNameEnglish
            }
        }
        return "UNKNOWN";
    }
}

struct CardsList: View {
    
    @ObservedObject var data: CardsListModel = CardsListModel()
    
    private let columns = Array(
        repeating: GridItem(.adaptive(minimum: 100, maximum: 400), spacing: 5, alignment: .center),
        count: 3
    )
    
    var body: some View {
        ScrollView {
            Text("Cards List").font(.title)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5, content: {
                ForEach(Array(self.data.getSortedCards()), id:\.self) { (card) in
                    NavigationLink(destination: CardsDetail(cardData: card)) {
                            CardIcon(cardId: card.id, rarity: card.Rarity, attribute: card.Attribute)
                    }
                }
            })
        }.navigationBarTitle("Cards List")
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList()
    }
}
