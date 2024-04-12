import SwiftUI
import UIKit

class TopicsVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var topicImage: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    
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
        
        topicImage.layer.cornerRadius = 14
        backView.layer.cornerRadius = 16
        
        backView.backgroundColor = .lightGreen
        
        topicImage.image = presenter.image.image
        
        topicName.text = presenter.topic.name
        topicDescription.text = presenter.topic.modDescription
        
        presenter.setTopic(topic: presenter.topic)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        topicsCollectionView.showsHorizontalScrollIndicator = false
        
        topicsCollectionView.delegate = self
        topicsCollectionView.dataSource = self
        
        topicsCollectionView.register(.init(nibName: String(describing: TopicCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TopicCell.self))
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension TopicsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.topic.topicmodvariant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TopicCell.self), for: indexPath) as? TopicCell else {
            return UICollectionViewCell()
        }
        
        let topicVariant = presenter.topic.topicmodvariant[indexPath.item]
        cell.config(topic: topicVariant)
        
        cell.getImage(content: topicVariant, contentType: .topics)
        cell.actionClosure = {
            CXC_Navigator.shared.showCXC_DetailedVC(view: self,
                                                    screenType: .topics,
                                                    presenter: self.presenter.topic,
                                                    image: cell.topicImage,
                                                    realm: DataBaseManager.shared)
        }
        
        return cell
    }
}
