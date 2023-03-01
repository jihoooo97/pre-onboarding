import UIKit

extension UIImageView {
    
    func loadImage(url: URL) {
        var defaultImage: UIImage?
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                defaultImage = UIImage(data: imageData)!
                DispatchQueue.main.async {
                    self.image = defaultImage
                }
            } else {
                defaultImage = UIImage(systemName: "photo")!
                DispatchQueue.main.async {
                    self.image = defaultImage
                }
            }
        }
    }
    
}
