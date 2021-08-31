

import Foundation
import UIKit
import CoreData

protocol Coordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
}
