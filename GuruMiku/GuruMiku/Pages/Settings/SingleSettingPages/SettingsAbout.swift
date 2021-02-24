//
//  SettingsAbout.swift
//  GuruMiku
//
//  Created by Ray on 24/02/21.
//

import SwiftUI
import Parma

struct SettingsAbout: View {
    
    var mdText: String = "**Failed to load the About file**"
    
    init() {
        if let path = Bundle.main.path(forResource: "ABOUT", ofType: "md") {
            debugPrint("[check] FILE AVAILABLE \(path)")
            self.mdText = NSString(string: path) as String
        }
        else {
            //self.mdText = "Welp"
        }
    }
    
    var body: some View {
        ScrollView {
            Text("About").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
            
            Parma(mdText)
        }
    }
}

struct SettingsAbout_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAbout()
    }
}
