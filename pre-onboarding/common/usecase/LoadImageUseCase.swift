import Foundation

open class LoadImageUseCase: ImageUseCaseProtocol {
    
    private let imageRepository: ImageRepositoryProtocol
    
    public init(imageRepository: ImageRepositoryProtocol) {
        self.imageRepository = imageRepository
    }

    
    public func excute(urlStrings: [String]) -> [URL] {
        let urls = imageRepository.getURLs(urlStrings: urlStrings).map { $0.convertToURL() }
        return urls
    }
    
}
