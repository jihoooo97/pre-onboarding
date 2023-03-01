import UIKit

final class ImageCell: UITableViewCell {

    var loadImageView = UIImageView()
    var loadProgressView = UIProgressView()
    var loadButton = UIButton()
    
    static let cellId = "imageCell"
    
    var loadButtonAction: (() -> ())?
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
        initConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    func bind(url: URL) {
        loadImageView.image = UIImage(systemName: "photo")
        loadImageView.loadImage(url: url)
    }
    
    @objc private func loadButtonTap() {
        loadImageView.image = UIImage(systemName: "photo")
        loadButtonAction?()
    }
    
    private func initUI() {
        loadImageView.image = UIImage(systemName: "photo")
        loadImageView.contentMode = .scaleAspectFit
        
        loadProgressView.progress = 0.5
        
        loadButton.backgroundColor = .systemBlue
        loadButton.layer.cornerRadius = 8
        loadButton.setTitle("Load", for: .normal)
        loadButton.setTitleColor(.white, for: .normal)
        loadButton.addTarget(self, action: #selector(loadButtonTap), for: .touchDown)
    }
    
    private func initConstraint() {
        [loadImageView, loadProgressView, loadButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [loadImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
         loadImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
         loadImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
         loadImageView.widthAnchor.constraint(equalTo: loadImageView.heightAnchor, multiplier: 1.333)]
            .forEach { $0.isActive = true }
        
        [loadProgressView.leftAnchor.constraint(equalTo: loadImageView.rightAnchor, constant: 8),
         loadProgressView.rightAnchor.constraint(equalTo: loadButton.leftAnchor),
         loadProgressView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)]
            .forEach { $0.isActive = true }
        
        [loadButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
         loadButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         loadButton.widthAnchor.constraint(equalToConstant: 72),
         loadButton.heightAnchor.constraint(equalToConstant: 36)]
            .forEach { $0.isActive = true }
    }
    
}
