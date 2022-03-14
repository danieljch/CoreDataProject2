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
    
            
    
    var predicate : String {
        if beginsWith {
            return "BEGINSWITH"
        } else {
            return "ENDSWITH"
        }
    }
    @State private var beginsWith = true
    @State private var predicates = predicateType.contains
    var body: some View {
        VStack {
            FilteredList(predicate: predicates, filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
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
                lastNameFilter = "S"
            }
            Picker("Predicate", selection: $predicates){
                ForEach(predicateType.allCases, id: \.self) { predicate in
                    Text(predicate.rawValue)
                 }
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
