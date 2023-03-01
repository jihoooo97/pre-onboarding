import UIKit

final class MainDIContainer {
    
    func makeLoadImageViewController(viewModel: LoadImageViewModelProtocol) -> LoadImageViewController {
        return LoadImageViewController(viewModel: viewModel)
    }

    func makeLoadImageViewModel() -> LoadImageViewModelProtocol {
        return LoadImageViewModel(imageUseCase: makeLoadImageUseCase())
    }

    func makeLoadImageUseCase() -> ImageUseCaseProtocol {
        return LoadImageUseCase(imageRepository: ImageRepository())
    }
    
}
