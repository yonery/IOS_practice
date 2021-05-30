//
//  ViewController.swift
//  helloword
//
//  Created by 신혜리 on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginlabel: UILabel!
    @IBOutlet weak var idfield: UITextField!
    @IBOutlet weak var pwfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        if idfield.text == "1111" && pwfield.text == "1111"{
            let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController")
            uvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(uvc, animated: true)
            

        }
        /*
        guard let idText = idfield.text
        else {
            return
        }
        guard let pwtext = pwfield.text
        else {
            return
        }
        if isValidID(email: idText) && isVailedPW(password: pwtext) {
            if idText == "yonery@email.com" && pwtext == "aaaaa11111" {
                successAlert()
                
            } else {
                failedAlert()
            }
        }
        else{
            failedAlert()
        } */
        
    }
    func successAlert() {
        let alertController = UIAlertController(title: nil, message: "success", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title:"확인", style: UIAlertAction.Style.destructive, handler:nil)
        alertController.addAction(onAction)
        present(alertController, animated: true, completion: nil)
        
    }
    func failedAlert() {
        let alertController = UIAlertController(title: nil, message: "failed", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title:"확인", style: UIAlertAction.Style.destructive, handler:nil)
        alertController.addAction(onAction)
        present(alertController, animated: true, completion: nil)
        
    }
    // 정규표현식 사용, email 형식
    func isValidID(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    // 정규표현식을 사용, password 형식 (영+숫자 8글자 이상)
    func isVailedPW(password: String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
}

