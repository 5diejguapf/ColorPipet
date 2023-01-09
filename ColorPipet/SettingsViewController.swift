//
//  SettingsViewController.swift
//  ColorPipet
//
//  Created by serg on 29.12.2022.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var color: UIColor!
    var exitDelegate: SetColorProtocole!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        initRandomColor(color)
        updateLabelsText()
        
        updateColorVuewBackground()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        exitDelegate.setBackground(colorView.backgroundColor)
    }

    // MARK: - IBActions
    @IBAction func redSliderValueChanged() {
        redValue.text = String(format: "%.2f", redSlider.value)
        updateColorVuewBackground()
    }
    @IBAction func greenSliderValueChanged() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        updateColorVuewBackground()
    }
    @IBAction func blueSliderValueChanged() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        updateColorVuewBackground()
    }
    
    // MARK: - private funcs
    private func updateColorVuewBackground() {
        let color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
        colorView.backgroundColor = color
    }
    
    private func initRandomColor(_ color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func updateLabelsText() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
    
    
}

