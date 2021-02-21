class BaseCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    func start() {
        fatalError("Children should implement 'start'.")
    }
}
