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
                    MusicsList()
                        .tabItem {
                            Image(systemName: "music.note")
                            Text("Musics")
                        }
                        .navigationTitle("Musics List")
                    Text("TODO")
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Events")
                        }
                        .navigationTitle("Events List")
                    Text("TODO")
                        .tabItem {
                            Image(systemName: "creditcard.fill")
                            Text("Gacha")
                        }
                        .navigationTitle("Gacha List")
                    SpineViewer(name: "0430001")
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .navigationTitle("Settings")
                }
            }.navigationBarHidden(true)
        }
    }
}
