//
//  CollectionViewCell.swift
//  TestTaskSurf
//
//  Created by Yuliya Lapenak on 2/12/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
     
    static let identifier = "collectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor =  #colorLiteral(red: 0.1921568811, green: 0.1921568811, blue: 0.1921568811, alpha: 1)
        label.font = Fonts.cellTitle
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? Colors.textPrimary : Colors.cellBackground
            titleLabel.textColor =  self.isSelected ? Colors.cellSelectedTitle : Colors.textPrimary
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        backgroundColor = Colors.cellBackground
        layer.cornerRadius = 12
        contentView.addSubview(titleLabel)
        setConstraints()
    }

    func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
}
