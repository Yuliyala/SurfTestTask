//
//  MainController.swift
//  TestTaskSurf
//
//  Created by Yuliya Lapenak on 2/12/23.
//

import UIKit

class MainController: UIViewController {

    let backImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backImage")
        image.backgroundColor = .red
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSheet()
    }
   
    func setupSheet() {
        let vc = DetailViewController()
        vc.isModalInPresentation = true
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                275
            }), .custom(resolver: { context in
                475
            }), .custom(resolver: { context in
                0.99 * context.maximumDetentValue
            })]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.preferredCornerRadius = 30.0
        }
           self.present(vc, animated: false)
    }
    
   func setupImage() {
       self.view = backImageView
    }
    
}

