import UIKit

final class ImageCell: UITableViewCell {

    @IBOutlet weak var loadImageView: UIImageView!
    @IBOutlet weak var loadButton: UIButton!
    
    static let cellId = "imageCell"
    
    var loadButtonAction: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadButton.layer.cornerRadius = 8
    }
    
    @IBAction func loadButtonTap(_ sender: Any) {
        loadImageView.image = UIImage(systemName: "photo")
        loadButtonAction?()
    }
    
    func updateCell(url: String) {
        loadImageView.loadImage(url: url)
    }
    
}
