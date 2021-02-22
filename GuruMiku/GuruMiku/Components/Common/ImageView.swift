//
//  Image.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import Combine
import SwiftUI


struct ImageView: View {
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var width:CGFloat?
    var height:CGFloat?
    var offsetX:CGFloat
    var offsetY:CGFloat
    
    init(withURL url:String, width: CGFloat? = nil, height: CGFloat? = nil, offsetX: CGFloat? = nil, offsetY: CGFloat? = nil) {
        self.imageLoader = ImageLoader(urlString:url)
        self.width = width
        self.height = height
        self.offsetX = offsetX ?? 0
        self.offsetY = offsetY ?? 0
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .offset(x: offsetX , y: offsetY)
                .padding()
        }.onReceive(imageLoader.dataPublisher) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
    
}

struct ImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageView(withURL: "\(GuruMikuConsts.gameAssetsUrl)/ondemand/card_chara/card_chara_040430002_1.jpg", width: CGFloat(100.0))
    }
    
}
