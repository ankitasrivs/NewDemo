

import UIKit

final class ImageCacheManager {
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    func setImage(_ image: UIImage, url: NSURL, responseData: Data) {
        cachedImages.setObject(image, forKey: url, cost: responseData.count)
    }
    
    func loadImage(url: NSURL, item: CharacterRepresentableViewModel) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
}
