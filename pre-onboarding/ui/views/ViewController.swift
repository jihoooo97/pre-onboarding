import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var imageTableView: UITableView!
    @IBOutlet weak var loadAllButton: UIButton!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getImages()
        initUI()
    }
    
    private func initUI() {
        let nibName = UINib(nibName: "ImageCell", bundle: nil)
        imageTableView.delegate = self
        imageTableView.dataSource = self
        imageTableView.register(nibName, forCellReuseIdentifier: ImageCell.cellId)
        
        loadAllButton.layer.cornerRadius = 8
    }

    @IBAction func loadAllButtonTap(_ sender: Any) {
        let imageCells: [IndexPath] = imageTableView.indexPathsForVisibleRows ?? []
        
        imageCells
            .map { imageTableView.cellForRow(at: $0) as! ImageCell }
            .enumerated().forEach { [weak self] in
                let index = imageCells[$0.offset].row
                let url = self?.viewModel.urls[index]
                
                $0.element.loadImageView.image = UIImage(systemName: "photo")
                $0.element.loadImageView.loadImage(url: url ?? "")
            }
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.urls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.cellId, for: indexPath) as! ImageCell
        
        cell.loadButtonAction = { [weak self] in
            cell.updateCell(url: self?.viewModel.urls[indexPath.row] ?? "")
        }
        
        return cell
    }
    
}
