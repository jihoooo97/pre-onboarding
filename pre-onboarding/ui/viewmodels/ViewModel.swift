import Foundation

final class ViewModel {
    
    let service = ImageLoadService()
    
    var urls: [String] = []
    
    func getImages() {
        urls = service.loadImageUrls()
    }
    
}
