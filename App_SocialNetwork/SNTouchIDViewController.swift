//
//  SNTouchIDViewController.swift
//  App_SocialNetwork
//
//  Created by formador on 31/3/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit
import LocalAuthentication

class SNTouchIDViewController: UIViewController {
    
    //MARK: - Variablea locales
    var customTouchID = LAContext()
    var messageData = "Necesito saber si eres tú"
    var nombre = "Andres"
    
    var alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)
    var alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    
    //MARK: - IBOutlets
    @IBOutlet weak var myMomentoAutenticacionLBL: UILabel!
    @IBOutlet weak var myComentarioAutenticacionLBL: UILabel!
    
    
    //MARK: - IBActions
    
    @IBAction func desbloqueToucheIDACTION(_ sender: Any) {
        
        myMomentoAutenticacionLBL.text = "Autenticando"
        var toucheIDError : NSError?
        
        if customTouchID.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &toucheIDError){
            
            customTouchID.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                                         localizedReason: messageData,
                                         reply: { (exitoso, errorTouche) in
                
                    if exitoso{
                        self.myMomentoAutenticacionLBL.text = "TouchID Exitoso"
                        self.myComentarioAutenticacionLBL.text = "has logrado demostrar que eres tu"
                        self.alertVC.title = "Autenticación exitosa"
                        self.alertVC.message = "se que eres tu \(self.nombre)"
                        //pickerPhoto()
                    }else{
                        self.myMomentoAutenticacionLBL.text = "TouchID No Exitoso"
                        self.myComentarioAutenticacionLBL.text = "No has logrado demostrar que eres tu"
                        self.alertVC.title = "Autenticación No exitosa"
                        
                        switch errorTouche!._code{
                        case LAError.authenticationFailed.rawValue:
                            self.alertVC.message = "Fallo en la Autenticación"
                        case LAError.userCancel.rawValue:
                            self.alertVC.message = "El usuario ha cancelado la autenticacion"
                        case LAError.systemCancel.rawValue:
                            self.alertVC.message = "El sistema ha cancelado la autenticacion"
                        case LAError.userFallback.rawValue:
                            self.alertVC.message = "Solocito que uses la contraseña"
                        default:
                            self.alertVC.message = "Otra cosa ha salido mal"
                        }
                        self.present(self.alertVC, animated: true, completion: { 
                            self.myComentarioAutenticacionLBL.text = self.messageData
                        })
                    }
            })
            
            
        }else{
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertVC.addAction(alertAction)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
