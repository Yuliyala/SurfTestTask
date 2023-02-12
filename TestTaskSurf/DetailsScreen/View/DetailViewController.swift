//
//  DetailViewController.swift
//  TestTaskSurf
//
//  Created by Yuliya Lapenak on 2/12/23.
//

import UIKit

class DetailViewController: UIViewController {

    let firstCollectionDataSource = InternshipType.allCases.map { $0.readable }
    let secondCollectionDataSource = InternshipType.allCases.map { $0.readable }

    var rootView: DetailView {
        view as! DetailView
    }

    override func loadView() {
        super.loadView()
        view = DetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        rootView.oneRowCollectionView.delegate = self
        rootView.oneRowCollectionView.dataSource = self
        rootView.twoRowsCollectionView.delegate = self
        rootView.twoRowsCollectionView.dataSource = self
        rootView.sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .primaryActionTriggered)
    }

    @objc func sendButtonPressed(){
        let alert = UIAlertController(title: Content.alertTitle, message: Content.alertBody, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Content.alertAction, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = collectionView == rootView.oneRowCollectionView ? firstCollectionDataSource[indexPath.item] : secondCollectionDataSource[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == rootView.oneRowCollectionView ? firstCollectionDataSource.count : secondCollectionDataSource.count
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
    }
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let word = collectionView == rootView.oneRowCollectionView ? firstCollectionDataSource[indexPath.item] : secondCollectionDataSource[indexPath.item]
        return CGSize(width: word.size(withAttributes: [.font : Fonts.cellTitle]).width + 50, height: 44)
    }
}

