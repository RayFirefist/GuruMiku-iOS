//
//  MusicsList.swift
//  GuruMiku
//
//  Created by Ray on 23/02/21.
//

import SwiftUI

import SwiftUI
import Alamofire
import SwiftyJSON

class MusicsListModel : ObservableObject {
    @Published var MusicsList: [String:MusicMaster] = [:]
    @Published var characterMaster: [String:CharacterMaster] = [:]
    
    init() {
        let body: [String:[String]] = ["dbs":["MusicMaster","UnitMaster","ChartMaster"]]
        var this = self
        AF.request(GuruMikuConsts.apiMultipleRequestUrl, method: .post, parameters: body, encoder: JSONParameterEncoder.sortedKeys)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MultipleApiResponse.self) { (response) in
                guard let data = response.value else {
                    print(response)
                    return
                }
                this.MusicsList = data.result.MusicMaster!
                //this.characterMaster = data.result.CharacterMaster!
                print(this.MusicsList.count, this.characterMaster.count)
            }
    }
    
    func getSortedSongs() -> [MusicMaster] {
        return MusicsList.values.sorted {
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

struct MusicsList: View {
    
    @ObservedObject var data: MusicsListModel = MusicsListModel()
    
    private let columns = Array(
        repeating: GridItem(.adaptive(minimum: 100, maximum: 400), spacing: 5, alignment: .center),
        count: 3
    )
    
    var body: some View {
        ScrollView {
            Text("Musics List").font(.title)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5, content: {
                ForEach(Array(self.data.getSortedSongs()), id:\.self) { (music) in
                    NavigationLink(destination: MusicDetails()) {
                        ImageView(withURL: "\(GuruMikuConsts.gameAssetsUrl)/music_jacket/music_jacket_\(String(music.id).leftPadding(toLength: 7, withPad: "0")).jpg")
                    }
                }
            })
        }.navigationTitle("Musics List")
    }
}

struct MusicsList_Previews: PreviewProvider {
    static var previews: some View {
        MusicsList()
    }
}
