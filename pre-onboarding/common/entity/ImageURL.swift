import Foundation

public struct ImageURL {
    public let urlString: String
    
    public func convertToURL() -> URL {
        let url = URL(string: self.urlString)!
        return url
    }
}
