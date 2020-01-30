import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    var randomUsers = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Random Users"
        
        
        mainView.collectionView.backgroundColor = .black
        mainView.collectionView.dataSource = self
//        mainView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "userCell")
        mainView.collectionView.register(UINib(nibName: "RandomUserCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
        loadUsers()
    }
    
    
    
    func loadUsers() {
        UsersFetchingService.manager.getUsers { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let user):
                self.randomUsers = user
            }
        }
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? RandomUserCell else {
            fatalError("could not get cell")
        }
        let users = randomUsers[indexPath.row]
        cell.configured(for: users)
       
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // override the default items of the itemSize layout from the collectionView property initializer in the PodcastView
//    let maxSize: CGSize = UIScreen.main.bounds.size
//    let itemWidth: CGFloat = maxSize.width * 0.90
    return CGSize(width: 100, height: 100)
}
    
}
