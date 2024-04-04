import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let unpackingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Unpacking mod", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 14
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        imageView.image = UIImage(systemName: "book")
        imageView.tintColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(unpackingButton)
        
        NSLayoutConstraint.activate([
            // Constraints for the image view
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // Constraints for the button
            unpackingButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            unpackingButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            unpackingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            unpackingButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            unpackingButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
