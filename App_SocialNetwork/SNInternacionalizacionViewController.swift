//
//  SNInternacionalizacionViewController.swift
//  App_SocialNetwork
//
//  Created by formador on 31/3/17.
//  Copyright © 2017 formador. All rights reserved.
//

import UIKit

class SNInternacionalizacionViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myNameLBL: UILabel!
    @IBOutlet weak var myCurrencyLBL: UILabel!
    @IBOutlet weak var myDateLBL: UILabel!
    @IBOutlet weak var myLastnameLBL: UILabel!
    @IBOutlet weak var myNumberPhoneLBL: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dameValores()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        muestraAlertVC()
    }
    
    //MARK: - Utils
    func dameValores(){
        myNameLBL.text = "\(NSLocalizedString("GOOD_MORNING", comment: "")) Andres"
        myLastnameLBL.text = "Ocampo"
        myCurrencyLBL.text = "\(9.999)"
        myDateLBL.text = "\(Date())"
        myNumberPhoneLBL.text = "\(65112233)"
        myImageView.image = UIImage(named: "hola.png")
    }
    
    func muestraAlertVC(){
        present(muestraAlert(NSLocalizedString("TITLE_DATA", comment: ""),
                             messageData: NSLocalizedString("MESSAGE_DATA", comment: ""),
                             titleAction: "OK"),
                animated: true,
                completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    

}
