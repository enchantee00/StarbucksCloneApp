//
//  PopUpInitial.swift
//  Clone<week2>
//
//  Created by 정지윤 on 2021/12/04.
//

import Foundation
import UIKit

class PopUpReservationViewController: UIViewController {

    
    @IBAction func ClosePopUpIB(_ sender: Any) {
        ClosePopUp()
    }
    @IBAction func NeverShowPopUp(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "check")
        ClosePopUp()
    }
    
    func ClosePopUp() {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidDisappear(_ animated: Bool) {
    
    }
}

