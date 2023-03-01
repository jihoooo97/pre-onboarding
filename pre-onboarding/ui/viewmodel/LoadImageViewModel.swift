import Foundation

public protocol LoadImageViewModelProtocol {
    var imageURLs: [URL] { get }
    func getURLs()
}

open class LoadImageViewModel: LoadImageViewModelProtocol {
    
    private let imageUseCase: ImageUseCaseProtocol
    
    public let urlStrings: [String] = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR88wSEPn9OSZzSkda_7I9jW03Q4Jlx2a7PTA&usqp=CAU",
                          "https://s2.best-wallpaper.net/wallpaper/2560x1920/1902/Iron-Man-Hulkbuster_2560x1920.jpg",
                          "https://img2.quasarzone.co.kr/web/editor/1909/1909obj___1032857212.jpg",
                          "https://i.ytimg.com/vi/rNG19kyLq1M/maxresdefault.jpg",
                          "https://p4.wallpaperbetter.com/wallpaper/620/295/580/iron-man-3-iron-man-vs-mandarin-wallpaper-preview.jpg"]
    public var imageURLs: [URL] = []
    
    public init(imageUseCase: ImageUseCaseProtocol) {
        self.imageUseCase = imageUseCase
    }
    
    
    public func getURLs() {
        let urls = imageUseCase.excute(urlStrings: urlStrings)
        imageURLs = urls
    }
    
}
