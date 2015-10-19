//
//  GuessViewController.swift
//  Hangman
//
//  Created by Colby on 10/18/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController, UITextFieldDelegate {
    var guesses = [String]()
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessHistoryLabel: UILabel!
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func guessButtonPressed(sender: AnyObject) {
        if guessTextField.text != "" {
            guessHistoryLabel.text! += "\n" + guessTextField.text!
            guessTextField.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guesses = [String]()
        guessTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let maxlength = 1
        let curr: NSString = textField.text!
        let newString: NSString = curr.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxlength
    }
    
}
