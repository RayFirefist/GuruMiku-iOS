//
//  SettingsList.swift
//  GuruMiku
//
//  Created by Ray on 24/02/21.
//

import SwiftUI

struct SettingsList: View {
    var body: some View {
        ScrollView {
            Text("Settings")
                .font(.title)
                .padding()
                .navigationBarTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
            Group {
                ForEach(EnabledSettings, id:\.self) { setting in
                    HStack {
                        Image(systemName: "gear").padding(10)
                        Text(LocalizedSettingsTitles[setting] ?? setting)
                            .bold()
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct SettingsList_Previews: PreviewProvider {
    static var previews: some View {
        SettingsList()
    }
}
