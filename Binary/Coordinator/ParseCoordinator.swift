import UIKit

class ParseCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = ParseViewController()
        view.viewModelBuilder = { ParseViewModel(input: $0) }
        navigationController.pushViewController(view, animated: true)
    }
    
}
