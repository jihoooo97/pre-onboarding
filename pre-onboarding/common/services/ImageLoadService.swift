import Foundation

class ImageLoadService {

    func loadImageUrls() -> [String] {
        let urls = [ImageUrl(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR88wSEPn9OSZzSkda_7I9jW03Q4Jlx2a7PTA&usqp=CAU"),
                    ImageUrl(url: "https://s2.best-wallpaper.net/wallpaper/2560x1920/1902/Iron-Man-Hulkbuster_2560x1920.jpg"),
                    ImageUrl(url: "https://img2.quasarzone.co.kr/web/editor/1909/1909obj___1032857212.jpg"),
                    ImageUrl(url: "https://i.ytimg.com/vi/rNG19kyLq1M/maxresdefault.jpg"),
                    ImageUrl(url: "https://p4.wallpaperbetter.com/wallpaper/620/295/580/iron-man-3-iron-man-vs-mandarin-wallpaper-preview.jpg")                     ]
        return urls.map { $0.url }
    }
    
}
