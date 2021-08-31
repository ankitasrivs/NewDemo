
import UIKit

final class ImageDownloader {
    static let shared = ImageDownloader()
    private var loadingResponses = [NSURL: [(CharacterRepresentableViewModel, UIImage?) -> Void]]()
    private var currentRequests = [CharacterRepresentableViewModel: URLSessionDataTask]()
    private var imageCache = ImageCacheManager()
    
    ///Api calling
    /// - Parameters:
    ///   - url: url passed
    ///   - item: view model
    ///   - completion: UIImage
    func load(url: NSURL, item: CharacterRepresentableViewModel, completion: @escaping (CharacterRepresentableViewModel, UIImage?) -> Void) {
        if let image = imageCache.loadImage(url: url, item: item) {
            completion(item, image)
            return
        }
        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
            defer { self.currentRequests.removeValue(forKey: item) }
            guard
                error == nil,
                let responseData = data,
                let image = UIImage(data: responseData) else {
                completion(item , nil)
                return
            }
            self.imageCache.setImage(image, url: url, responseData: responseData)
            completion(item, image)
        }
        task.resume()
        currentRequests[item] = task
    }
    
    ///  Method will cancel load on screen
    /// - Parameter item: item to be represented
    func cancelRequests(_ item: CharacterRepresentableViewModel) {
        currentRequests[item]?.cancel()
        currentRequests.removeValue(forKey: item)
    }
}
