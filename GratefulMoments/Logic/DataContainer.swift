//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by Juan on 6/02/26.
//

import SwiftData

class DataContainer{
    let modelContainer: ModelContainer
    
    var context: ModelContext{
        modelContainer.mainContext
    }
    
    init() {
        let schema = Schema([
            Moment.self,
        ])


        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)


        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])


            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
