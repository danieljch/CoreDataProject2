//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Daniel Jesus Callisaya Hidalgo on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    enum predicateType {
        case beginsWith, endsWith, contains
        func output() -> String {
            switch self {
            case .beginsWith: return "BEGINSWITH"
            case .endsWith: return "ENDSWITH"
            case .contains: return "CONTAINS"
            }
        }
            
    }
    var predicate : String {
        if beginsWith {
            return "BEGINSWITH"
        } else {
            return "ENDSWITH"
        }
    }
    @State private var beginsWith = true
    var body: some View {
        VStack {
            FilteredList(predicate: predicate, filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S "
            }
            Toggle(isOn: $beginsWith) {
                Text("BEGINSWITH")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
