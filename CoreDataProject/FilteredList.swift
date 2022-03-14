//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Daniel Jesus Callisaya Hidalgo on 8/3/22.
//

import SwiftUI
import CoreData
enum predicateType: String, CaseIterable {
    case beginsWith
    case endsWith
    case contains
   
    }
  

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(sortDescriptor: [NSSortDescriptor], predicate: predicateType, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
         var predicateString: String {
            switch predicate {
            case .beginsWith: return "BEGINSWITH"
            case .endsWith: return "ENDSWITH"
            case .contains: return "CONTAINS"
               
                }
            
        }
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor, predicate: NSPredicate(format: "%K \(predicateString)[c] %@", filterKey, filterValue))
        self.content = content
    }
}

