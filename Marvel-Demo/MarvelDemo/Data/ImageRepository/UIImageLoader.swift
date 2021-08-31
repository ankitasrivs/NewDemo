

import UIKit

final class UIImageLoader {
    static let share = UIImageLoader()
    private let imageDownloader = ImageDownloader()
    private var items = [UIImageView: CharacterRepresentableViewModel]()
    
    /// Upload image
    /// - Parameters:
    ///   - url: image url
    ///   - item: image item
    ///   - imageView: image view
    func load(_ url: URL, item: CharacterRepresentableViewModel, for imageView: UIImageView, completion: @escaping (()-> Void)) {
        imageDownloader.load(url: url as NSURL, item: item) { item, image in
            defer { self.items.removeValue(forKey: imageView) }
            DispatchQueue.main.async {[weak self] in
                guard let self = self else{
                    return
                }
                self.items[imageView] = item
                imageView.image = image
                item.image = image
                completion()
            }
        }
    }
    
    /// Cancel loading of image view
    func cancel(for imageView: UIImageView) {
        if let item = items[imageView] {
            imageDownloader.cancelRequests(item)
            items.removeValue(forKey: imageView)
        }
    }
}
