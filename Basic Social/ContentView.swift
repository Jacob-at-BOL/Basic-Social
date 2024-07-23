//
//  ContentView.swift
//  Basic Social
//
//  Created by Jacob on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var isRunningOnMacOS: Bool {
            #if os(macOS)
            return true
            #else
            return false
            #endif
        }
        
        VStack {
            if isRunningOnMacOS {
                macOSView()
            } else {
                iOSView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
