//
//  ContentView.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/15.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    var body: some View {
        Text(NSL("welcome_text"))
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}
