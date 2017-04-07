//
//  SNPostSocialNetworkViewController.swift
//  App_SocialNetwork
//
//  Created by formador on 31/3/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit
import Social

class SNPostSocialNetworkViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    //MARK: - IBActions
    @IBAction func showCameraACTION(_ sender: Any) {
       pickerPhoto()
    }
    
    @IBAction func showFacebookACTION(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let postFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postFacebook?.setInitialText(myTextView.text)
            postFacebook?.add(myImageView.image)
            postFacebook?.add(URL(string: "http://www.andresocampo.com"))
            present(postFacebook!, animated: true, completion: nil)
            
            limpiarDatos()
            
        }else{
            present(muestraAlert("Cuenta de Facebook",
                                 messageData: "Por favor inicia la sesión de Facebook para compratir",
                                 titleAction: "OK"),
                    animated: true,
                    completion: nil)
        }
        
    }
    
    @IBAction func showTwitterACTION(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let postTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postTwitter?.setInitialText(myTextView.text)
            postTwitter?.add(myImageView.image)
            postTwitter?.add(URL(string: "http://www.andresocampo.com"))
            present(postTwitter!, animated: true, completion: nil)
            
            limpiarDatos()
            
        }else{
            present(muestraAlert("Cuenta de Facebook",
                                 messageData: "Por favor inicia la sesión de Facebook para compratir",
                                 titleAction: "OK"),
                    animated: true,
                    completion: nil)
        }
    }
    
    @IBAction func showActivityACTION(_ sender: Any) {
        
        let textPost = myTextView.text
        let imagePost = myImageView.image
        let urlPost = "http://www.andresocampo.com"
        let composePost = UIActivityViewController(activityItems: [textPost!, imagePost!, urlPost], applicationActivities: nil)
        present(composePost, animated: true, completion: nil)
        limpiarDatos()
    }
    
    @IBAction func showAlertVCACTION(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Utils
    func limpiarDatos(){
        myTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        myImageView.image = #imageLiteral(resourceName: "imgPlaceholder")
    }
    
    
    
    
    
    


}//TODO: - Fin de la clase

extension SNPostSocialNetworkViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        }else{
            muestraLibreriaFotos()
        }
    }
    
    func muestraMenu(){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let tomaFotoCamarAction = UIAlertAction(title: "Toma foto", style: .default) { _ in
            self.muestraCamaraDisposito()
        }
        let seleccionaFotoAction = UIAlertAction(title: "Selecciona desde la Librería", style: .default) { _ in
            self.muestraLibreriaFotos()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(tomaFotoCamarAction)
        alertVC.addAction(seleccionaFotoAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    func muestraLibreriaFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraCamaraDisposito(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}






