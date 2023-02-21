//
//  ViewController.swift
//  NotificationCenterEProtocolo
//
//  Created by Rafael Veronez Dias on 18/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    var homeSreen: HomeScreen?

    
    override func loadView() {
        homeSreen = HomeScreen()
        view = homeSreen

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeSreen?.delegate(delegate: self)
        configObserver()
        
    }
    
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac(notification:)), name: Notification.Name("imac"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook(notification:)), name: Notification.Name("macbook"), object: nil)
    }
    
    @objc func updateImac(notification: NSNotification) {
        homeSreen?.logoImageView.image = UIImage(named: "imac_pro")
        homeSreen?.descriptionLabel.text = "Imac das galaxias"
        view.backgroundColor = .cyan
    }
    
    @objc func updateMacbook(notification: NSNotification) {
        homeSreen?.logoImageView.image = UIImage(named: "macbook_pro")
        homeSreen?.descriptionLabel.text = "Macbook das galaxias"
        view.backgroundColor = .red
    }


}

extension HomeViewController: HomeScreenProtocol {
    func tappedChooseButton() {
        let selectionViewController = SelectionViewController()
        selectionViewController.modalPresentationStyle = .fullScreen
        selectionViewController.delegate(delegate: self)
        present(selectionViewController, animated: true)
    }
    
}

extension HomeViewController: SelectionViewControllerProtocol {
    func updateImac() {
        homeSreen?.logoImageView.image = UIImage(named: "imac_pro")
        homeSreen?.descriptionLabel.text = "Imac das galaxias"
        view.backgroundColor = .cyan
    }
    
    func updateMacbook() {
        homeSreen?.logoImageView.image = UIImage(named: "macbook_pro")
        homeSreen?.descriptionLabel.text = "Macbook das galaxias"
        view.backgroundColor = .red
    }
    
    
}

