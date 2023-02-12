//
//  DetailView.swift
//  TestTaskSurf
//
//  Created by Yuliya Lapenak on 2/12/23.
//

import UIKit

class DetailView: UIView {

    var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Colors.textPrimary
        label.text = Content.bottomSheetTitle
        label.font = Fonts.title
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = Colors.textSecondary
        label.text = Content.bottomSheetDescription
        label.font = Fonts.description
        return label
    }()

    private let headerLabelsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let horizontalCollectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        return layout
    }()

    let oneRowCollectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var oneRowCollectionView = UICollectionView(frame: .zero, collectionViewLayout: oneRowCollectionLayout)
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = Colors.textSecondary
        label.text = Content.bottomSheetInfo
        label.font = Fonts.description
        return label
    }()

    private let infoLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var twoRowsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalCollectionLayout)
    
    var bottomStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .horizontal
        stackView.backgroundColor = .white
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.textColor = Colors.textSecondary
        label.text = Content.joinUs
        label.font = Fonts.description
        return label
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Content.buttonTitle, for: .normal)
        button.titleLabel?.font = Fonts.buttonTitle
        button.backgroundColor = Colors.textPrimary
        button.layer.cornerRadius = 30
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private let bottomContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    func setupView() {
        backgroundColor = .white
        oneRowCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        twoRowsCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        oneRowCollectionView.showsHorizontalScrollIndicator = false
        twoRowsCollectionView.showsHorizontalScrollIndicator = false

        addSubview(stackView)
        addSubview(bottomContainer)
        bottomContainer.addSubview(bottomStackView)
        stackView.addArrangedSubview(headerLabelsContainer)

        headerLabelsContainer.addSubview(titleLabel)
        headerLabelsContainer.addSubview(descriptionLabel)

        stackView.addArrangedSubview(oneRowCollectionView)
        stackView.addArrangedSubview(infoLabelContainer)
        infoLabelContainer.addSubview(infoLabel)
        stackView.addArrangedSubview(twoRowsCollectionView)
        
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(sendButton)
        
        setConstraints()
    }
    
    func setConstraints() {

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            oneRowCollectionView.heightAnchor.constraint(equalToConstant: 48),
            twoRowsCollectionView.heightAnchor.constraint(equalToConstant: 108),

            sendButton.widthAnchor.constraint(equalToConstant: 219),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            bottomContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomStackView.topAnchor.constraint(equalTo: bottomContainer.topAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -20),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomContainer.safeAreaLayoutGuide.bottomAnchor, constant: -32),

            titleLabel.topAnchor.constraint(equalTo: headerLabelsContainer.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: headerLabelsContainer.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerLabelsContainer.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: headerLabelsContainer.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: headerLabelsContainer.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: headerLabelsContainer.bottomAnchor, constant: -12),
            infoLabel.topAnchor.constraint(equalTo: infoLabelContainer.topAnchor, constant: 24),
            infoLabel.leadingAnchor.constraint(equalTo: infoLabelContainer.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: infoLabelContainer.trailingAnchor, constant: -20),
            infoLabel.bottomAnchor.constraint(equalTo: infoLabelContainer.bottomAnchor, constant: -12),
        ])

    }
}
