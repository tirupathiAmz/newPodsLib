//
//  CustomAlert.swift
//  newPodsLib
//
//  Created by Tirupathi Mandali on 10/19/21.
//

import UIKit

public class CustomAlert: UIView {
    
    @IBOutlet public weak var okButton: UIButton!
    @IBOutlet public weak var cancelButton: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var alertBaseView: UIView!
    @IBOutlet weak var buttonsStack: UIStackView!
    
    private let nibName = String(describing: CustomAlert.self)
    private var contentView: UIView?
    
    // Caallbacks
    var okClicked: (()->())?
    var cancelClicked: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    
    private func setupUI() {
        guard let view = loadViewFromNib() else { return }
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(view)
        contentView = view
        
        self.icon.layer.cornerRadius = self.icon.bounds.size.width / 2
        self.icon.layer.borderWidth = 5.0
        self.icon.layer.borderColor = UIColor.white.cgColor
        alertBaseView.layer.cornerRadius = 10.0
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
  public  func showAlert(alertType: AlertType, title: String?, message: String?) {
        if title == nil {self.title.isHidden = true} else {self.title.isHidden = false}
        if message == nil {self.message.isHidden = true} else {self.message.isHidden = false}
        self.title.text = title
        self.message.text = message
        switch alertType {
        case .success: self.icon.image = UIImage(named: "ic_alert_success")
        case .error: self.icon.image = UIImage(named: "ic_alert_error")
        case .info: self.icon.image = UIImage(named: "ic_alert_info")
        }
        guard let contentView = self.contentView else {return}
        UIApplication.shared.keyWindow?.addSubview(contentView)
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.contentView?.removeFromSuperview()
        self.cancelClicked?()
    }
    
    @IBAction func okClicked(_ sender: Any) {
        self.contentView?.removeFromSuperview()
        self.okClicked?()
    }
}

public enum AlertType {
    case success
    case info
    case error
}
