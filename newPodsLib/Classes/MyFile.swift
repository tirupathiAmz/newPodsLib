//
//  MyFile.swift
//  newPodsLib
//
//  Created by Tirupathi Mandali on 10/19/21.
//

import Foundation
import UIKit
public struct MyClass {
    
    public static func ShowMessage(controller:UIViewController,title:String,message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.present(alert, animated: true, completion: nil)
    }
}
