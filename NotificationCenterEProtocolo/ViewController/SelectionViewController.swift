//
//  SelectionViewController.swift
//  NotificationCenterEProtocolo
//
//  Created by Rafael Veronez Dias on 18/02/23.
//

import UIKit

protocol SelectionViewControllerProtocol: AnyObject {
    func updateImac()
    func updateMacbook()
}

class SelectionViewController: UIViewController {
    var selectionScreen: SelectionScreen?
    
    private weak var delegate: SelectionViewControllerProtocol?
    
    public func delegate(delegate: SelectionViewControllerProtocol) {
        self.delegate = delegate
    }
    
    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectionScreen?.delegate(delegate: self)

    }

}

extension SelectionViewController: SelectionScreenProtocol {
    func tappedMacbookButton() {
        print(#function)
//        NotificationCenter.default.post(name: Notification.Name("macbook"), object: nil)
        delegate?.updateMacbook()
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
        print(#function)
//        NotificationCenter.default.post(name: Notification.Name("imac"), object: nil)
        delegate?.updateImac()
        dismiss(animated: true)
    }
    
    
}
