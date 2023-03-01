import UIKit

open class LoadImageViewController: BaseViewController {

    var imageTableView = UITableView()
    var loadAllButton = UIButton()
    
    private var visibleCells: [ImageCell] {
        return imageTableView.visibleCells.compactMap { $0 as? ImageCell }
    }
    private let viewModel: LoadImageViewModelProtocol
    
    public init(viewModel: LoadImageViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getURLs()
        initUI()
        initConstraint()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        
        imageTableView.separatorStyle = .none
        imageTableView.allowsSelection = false
        imageTableView.delegate = self
        imageTableView.dataSource = self
        imageTableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.cellId)
        
        loadAllButton.backgroundColor = .systemBlue
        loadAllButton.titleLabel?.textColor = .white
        loadAllButton.setTitle("Load All Images", for: .normal)
        loadAllButton.layer.cornerRadius = 8
        loadAllButton.addTarget(self, action: #selector(loadAllButtonTap), for: .touchDown)
    }

    private func initConstraint() {
        let guide = view.layoutMarginsGuide
        
        [imageTableView, loadAllButton].forEach { view.addSubview($0) }
        
        imageTableView.translatesAutoresizingMaskIntoConstraints = false
        loadAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        [imageTableView.leftAnchor.constraint(equalTo: guide.leftAnchor),
         imageTableView.rightAnchor.constraint(equalTo: guide.rightAnchor),
         imageTableView.topAnchor.constraint(equalTo: guide.topAnchor),
         imageTableView.bottomAnchor.constraint(equalTo: loadAllButton.topAnchor, constant: -36)]
            .forEach { $0.isActive = true }
        
        [loadAllButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16),
         loadAllButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -16),
         loadAllButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -32),
         loadAllButton.heightAnchor.constraint(equalToConstant: 40)]
            .forEach { $0.isActive = true }
    }
    
    @objc private func loadAllButtonTap() {
        let imageCells: [IndexPath] = imageTableView.indexPathsForVisibleRows ?? []
        
        imageCells
            .map { imageTableView.cellForRow(at: $0) as! ImageCell }
            .enumerated().forEach { [weak self] in
                guard let self = self else { return }
                let index = imageCells[$0.offset].row
                let url = self.viewModel.imageURLs[index]

                $0.element.bind(url: url)
            }
    }
    
}


extension LoadImageViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension LoadImageViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imageURLs.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.cellId, for: indexPath) as! ImageCell
        
        cell.loadButtonAction = { [weak self] in
            guard let self = self else { return }
            cell.bind(url: self.viewModel.imageURLs[indexPath.row])
        }
        
        return cell
    }
    
}
