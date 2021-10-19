//
//  ViewController.swift
//  newPodsLib
//
//  Created by tirupathiAmz on 10/19/2021.
//  Copyright (c) 2021 tirupathiAmz. All rights reserved.
//

import UIKit
import newPodsLib
class ViewController: UIViewController {
    
    private lazy var alertView: CustomAlertView = {
        let alertView = CustomAlertView()
        alertView.cancelButton.isHidden = true
        return alertView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        MyClass.ShowMessage(controller: se, title: <#String#>, message: <#String#>)
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(showMe), for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    @objc private func showMe(){
        alertView.showAlert(alertType: .info, title: "Info", message: "This is my new Alert")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

