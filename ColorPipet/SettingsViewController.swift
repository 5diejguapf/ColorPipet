//
//  SettingsViewController.swift
//  ColorPipet
//
//  Created by serg on 29.12.2022.
//

import UIKit
import Foundation

final class SettingsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var color: UIColor!
    var exitDelegate: SetColorProtocole!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        configTextFields()
        configSliders()
        
        sliderValueChanged()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func sliderValueChanged() {
        updateTFieldsText()
        updateLabelsText()
        updateColorViewBackground()
    }
    
    @IBAction func donePressed() {
        exitDelegate.setBackground(colorView.backgroundColor)
        dismiss(animated: true)
    }
    
    // MARK: - private funcs
    
    private func configTextFields() {
        for tf in [redTextField, greenTextField, blueTextField] {
            addNumpadDoneButton(for: tf!)
            tf!.delegate = self
        }
    }
    
    private func configSliders() {
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        setSliders(from: color)
    }
    
    private func setSliders(from color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func updateColorViewBackground() {
        let color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        colorView.backgroundColor = color
    }
    
    private func updateLabelsText() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateTFieldsText() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
}

// MARK: Work with textFields and numpad

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let value = Float(textField.text ?? "") ?? 0
        
        switch textField.tag {
        case 0: redSlider.setValue(value, animated: true)
        case 1: greenSlider.setValue(value, animated: true)
        case 2: blueSlider.setValue(value, animated: true)
        default: return
        }
        
        sliderValueChanged()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if newString.isEmpty || string.isEmpty {
            return true
        }
        if newString.count > 4 {
            return false
        }
        // exclude strings like: 000, 01, 001 ....
        if !newString.starts(with: "0.") && text.starts(with: "0") && string != "." {
            return false
        }
        guard let number = Float(newString) else { return false }
        if number < 0.0 || number > 1.0 {
            return false
        }
        return true
    }
    
    private func addNumpadDoneButton(for textField: UITextField) {
        let keypadToolbar: UIToolbar = UIToolbar()
        keypadToolbar.sizeToFit()
        textField.inputAccessoryView = keypadToolbar
        
        // add a done button to the numberpad
        keypadToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: textField, action: #selector(UITextField.resignFirstResponder)),
        ]
    }
}
