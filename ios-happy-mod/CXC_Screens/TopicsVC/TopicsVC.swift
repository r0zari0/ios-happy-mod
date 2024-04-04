import SwiftUI
import UIKit

class TopicsVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var topicImage: UIImageView!
    
    @IBOutlet weak var topicName: UILabel!
    
    @IBOutlet weak var topicDescription: UITextView!
    
    @IBOutlet weak var topicsCollectionView: UICollectionView!
    
    let presenter: TopicPresenter
    
    init(presenter: TopicPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupUI()
    }
    func setupUI() {
        titleLabel.text = "Topics"
        presenter.setTopic(presenter.topic)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        topicsCollectionView.delegate = self
        topicsCollectionView.dataSource = self
        
        topicsCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CustomCollectionViewCell.self))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width: CGFloat = 220
            let height: CGFloat = 200
            return CGSize(width: width, height: height)
        }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
}

extension TopicsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCollectionViewCell.self), for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
