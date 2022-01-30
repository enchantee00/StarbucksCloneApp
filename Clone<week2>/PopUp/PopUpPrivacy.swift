//
//  PopUpPrivacy.swift
//  Clone<week2>
//
//  Created by 정지윤 on 2021/12/04.
//

import Foundation
import UIKit


class PopUpPrivacyViewController: UIViewController {
    
    
    @IBAction func Agreed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "Auth")
        let home = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
        home.requestAuthorization()
        ClosePopUp()
        print("agreed")
    }
    @IBAction func Disagreed(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "Auth")
        ClosePopUp()
        print("disagreed")
    }
    
    func ClosePopUp() {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
