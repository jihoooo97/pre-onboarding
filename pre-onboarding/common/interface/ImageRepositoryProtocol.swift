import Foundation

public protocol ImageRepositoryProtocol {
    func getURLs(urlStrings: [String]) -> [ImageURL]
}
