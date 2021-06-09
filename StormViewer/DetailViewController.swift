//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Felipe Marques Ramos on 05/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage: String?
    var rowNumber = 0
    var totalRows = 0

    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(rowNumber) of \(totalRows)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    @objc func shareTapped(){
        guard let imageData = imageView.image?.jpegData(compressionQuality: 1.0) else {
            print("No Image found!")
            return
        }
        
        let activityController = UIActivityViewController(activityItems: [imageData], applicationActivities: [])
        activityController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // makes it work on ipad
        present(activityController, animated: true)
    }

}
