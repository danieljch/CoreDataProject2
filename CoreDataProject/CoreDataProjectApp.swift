//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Daniel Jesus Callisaya Hidalgo on 4/3/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
