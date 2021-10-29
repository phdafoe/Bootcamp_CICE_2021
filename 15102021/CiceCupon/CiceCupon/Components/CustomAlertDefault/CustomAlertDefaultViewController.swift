//
//  CustomAlertDefaultViewController.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 23/10/21.
//

import UIKit

protocol CustomAlertDefaultViewControllerDelegate: AnyObject {
    func defaultPrimaryButtonPressed()
}

class CustomAlertDefaultViewController: UIViewController {
    
    // MARK: - Variables
    weak var delegate: CustomAlertDefaultViewControllerDelegate?
    var viewModel: CustomAlertViewModel?
    var type: DefaultAlertType?
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleAlertLBL: UILabel!
    @IBOutlet weak var messageAlertLBL: UILabel!
    @IBOutlet weak var acceptBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var xMarkBTN: UIButton!
    
    @IBOutlet weak var constHeightPrimaryButton: NSLayoutConstraint!
    @IBOutlet weak var constHeightSecundryButton: NSLayoutConstraint!
    @IBOutlet weak var constHeightXMarkButton: NSLayoutConstraint!
    @IBOutlet weak var contentAlertView: UIView!
    
    
    // MARK: - IBActions
    
    @IBAction func closeAlertACTION(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acceptAlertACTION(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        self.delegate?.defaultPrimaryButtonPressed()
    }
    
    @IBAction func cancelAlertACTION(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentAlertView.layer.cornerRadius = 20
        
        self.acceptBTN.layer.cornerRadius = 25
        self.acceptBTN.layer.borderWidth = 2
        self.acceptBTN.layer.borderColor = UIColor.black.cgColor
        
        
        self.customInitUI()
        // Do any additional setup after loading the view.
    }
    
    private func customInitUI() {
        switch viewModel?.type {
        case .confirmationLogin:
            self.titleAlertLBL.text = viewModel?.confirmationTitle
            self.messageAlertLBL.text = viewModel?.confirmationMessage
            self.controlShowButtons()
        case .successLogin:
            self.titleAlertLBL.text = viewModel?.succesLoginTitle
            self.messageAlertLBL.text = viewModel?.succesLoginMessage
            self.acceptBTN.setTitle(viewModel?.succesLoginPrimaryButton, for: .normal)
            self.controlShowButtons()
        default:
            self.titleAlertLBL.text = ""
            self.messageAlertLBL.text = ""
            self.acceptBTN.isHidden = true
            self.cancelBTN.isHidden = true
        }
        self.type = viewModel?.type
    }
    
    private func controlShowButtons(){
        switch viewModel?.type {
        case .confirmationLogin:
            self.constHeightPrimaryButton.constant = 0
            self.constHeightSecundryButton.constant = 0
            self.acceptBTN.isHidden = true
            self.cancelBTN.isHidden = true
        case .successLogin:
            self.constHeightSecundryButton.constant = 0
            self.constHeightXMarkButton.constant = 10
            self.cancelBTN.isHidden = true
            self.xMarkBTN.isHidden = true
        default:
            self.titleAlertLBL.text = ""
            self.messageAlertLBL.text = ""
            self.acceptBTN.isHidden = true
            self.cancelBTN.isHidden = true
        }
    }

}
