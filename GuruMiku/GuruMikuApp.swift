//
//  Test_SwiftUIApp.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import SwiftUI

@main
struct GuruMikuApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    CardsList()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Cards")
                        }
                        .navigationTitle("Cards List")
                        .navigationBarTitle("Cards List")
                        .navigationBarTitleDisplayMode(.inline)
                    MusicsList()
                        .tabItem {
                            Image(systemName: "music.note")
                            Text("Musics")
                        }
                        .navigationBarTitle("Musics List")
                        .navigationBarTitleDisplayMode(.inline)
                    Text("TODO")
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Events")
                        }
                        .navigationBarTitle("Events List")
                        .navigationBarTitleDisplayMode(.inline)
                    Text("TODO")
                        .tabItem {
                            Image(systemName: "creditcard.fill")
                            Text("Gacha")
                        }
                        .navigationBarTitle("Gacha List")
                        .navigationBarTitleDisplayMode(.inline)
                    SettingsList()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }
            }.navigationBarHidden(true)
        }
    }
}
