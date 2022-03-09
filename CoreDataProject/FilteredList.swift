//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Daniel Jesus Callisaya Hidalgo on 8/3/22.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

