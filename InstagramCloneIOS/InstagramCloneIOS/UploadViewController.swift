//
//  UploadViewController.swift
//  InstagramCloneIOS
//
//  Created by Okan Serdaroğlu on 4.05.2020.
//  Copyright © 2020 Okan Serdaroğlu. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageViewSelected: UIImageView!
    @IBOutlet weak var buttonUpload: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewSelected.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageViewSelected.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func chooseImage() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageViewSelected.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textFieldComment: UITextField!
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        
        if let data = imageViewSelected.image?.jpegData(compressionQuality: 0.5){
            
            let imageReference = mediaFolder.child("image.jpg")
            imageReference.putData(data, metadata: nil) { (metaData, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                    
                }
            }
        
        }
        
    }
    

}
