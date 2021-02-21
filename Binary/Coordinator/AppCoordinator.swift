import UIKit

class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    private let navigationController = UINavigationController()
    
    
    init (window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let parseCoordinator = ParseCoordinator(navigationController: self.navigationController)
        self.add(parseCoordinator)
        
        parseCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
