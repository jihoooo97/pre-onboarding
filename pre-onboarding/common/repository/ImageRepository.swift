import Foundation

public class ImageRepository: ImageRepositoryProtocol {
    
    public func getURLs(urlStrings: [String]) -> [ImageURL] {
        return urlStrings.map { ImageURL(urlString: $0) }
    }
    
}
