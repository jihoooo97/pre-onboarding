import Foundation

public protocol ImageUseCaseProtocol {
    func excute(urlStrings: [String]) -> [URL]
}
