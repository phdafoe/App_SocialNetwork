//
//  APIHELPERS.swift
//  App_GaritosMadrid
//
//  Created by formador on 10/3/17.
//  Copyright © 2017 formador. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Alert Controler
func muestraAlert(_ titleData : String, messageData : String, titleAction : String) -> UIAlertController{
    let alert = UIAlertController(title: titleData, message: messageData, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: titleAction, style: .default, handler: nil))
    return alert
}
















