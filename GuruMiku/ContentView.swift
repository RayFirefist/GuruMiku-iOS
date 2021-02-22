//
//  ContentView.swift
//  Test-SwiftUI
//
//  Created by Ray on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct TextSample: View {
    var body: some View {
        VStack {
            Text("Nya").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
            TextSample()
        }
    }
}
