import UIKit

/// Root tab controller
final class RMTabBarController: UITabBarController {
    
    private let charactersVC = RMCharactersViewController()
    private let locationsVC = RMLocationsViewController()
    private let episodesVC = RMEpisodesViewController()
    private let settingsVC = RMSettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        viewControllers = [
            createNavigationVC(rootVC: charactersVC,
                               title: "CharactersVC", imageSystemName: "person"),
            createNavigationVC(rootVC: locationsVC,
                               title: "LocationsVC", imageSystemName: "globe"),
            createNavigationVC(rootVC: episodesVC,
                               title: "EpisodesVC", imageSystemName: "tv"),
            createNavigationVC(rootVC: settingsVC,
                               title: "SettingsVC", imageSystemName: "gear")
        ]
        
    }
    private func createNavigationVC(rootVC: UIViewController,
                                    title: String,
                                    imageSystemName: String) -> UINavigationController {
        rootVC.navigationItem.largeTitleDisplayMode = .automatic
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(systemName: imageSystemName, withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
        navVC.navigationBar.prefersLargeTitles = true
        return navVC
    }
}

