import UIKit

/// Controller to show and search for Characters
final class RMCharactersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequest,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
                print(String(describing: model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
