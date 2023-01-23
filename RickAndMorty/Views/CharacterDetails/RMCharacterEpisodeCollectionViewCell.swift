import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifer = "RMCharacterEpisodeCollectionViewCell"
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubviewWithoutTranslates(seasonLabel, nameLabel, airDateLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.seasonLabel.text = "Episode " + data.episode
            self?.nameLabel.text = data.name
            self?.airDateLabel.text = "Aired on " + data.air_date
        }
        viewModel.fetchEpisode()
    }
    
    // MARK: - Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: topAnchor),
            seasonLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            seasonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            seasonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            airDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            airDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
