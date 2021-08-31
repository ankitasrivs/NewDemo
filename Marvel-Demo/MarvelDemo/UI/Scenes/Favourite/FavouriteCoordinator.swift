
import Foundation
import UIKit
import CoreData

//MARK:Protocol Favourites
protocol FavouritesBaseCoordinator: Coordinator {
    var container: NSPersistentContainer? { get set }
}

//MARK:Favourites Coordinartor class
final class FavouritesCoordinator: FavouritesBaseCoordinator {
    var container: NSPersistentContainer?
    lazy var rootViewController: UIViewController = UIViewController()

    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    /// Start cordinator
    /// - Returns: VC
    func start() -> UIViewController {
        guard let container = container else { return UIViewController() }
        let presenter = FavouriteCharacterPresenter(container: container)
        let viewController = FavouritesListTableViewController(presenter: presenter)
        rootViewController = UINavigationController(rootViewController: viewController)
        presenter.view = viewController
        return rootViewController
    }
}
