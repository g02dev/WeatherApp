import SwiftData

@MainActor
public let previewModelContainer: ModelContainer = {
    let container = createInMemoryModelContainer()
    let modelContext = ModelContext(container)
    
    SampleLocations.favoriteLocations.forEach { location in
        let favoriteLocation = FavoriteLocation(location)
        modelContext.insert(favoriteLocation)
    }
    try! modelContext.save()
    
    return container
}()

private func createInMemoryModelContainer() -> ModelContainer {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    do {
        let container = try ModelContainer(
            for: FavoriteLocation.self,
            configurations: configuration
        )
        return container
    } catch {
        fatalError("Failed to create model container")
    }
}
