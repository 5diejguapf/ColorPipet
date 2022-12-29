//
//  ViewController.swift
//  ColorPipet
//
//  Created by serg on 29.12.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var blueSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSlider.value = Float.random(in: 0.0...1.0)
        greenSlider.value = Float.random(in: 0.0...1.0)
        blueSlider.value = Float.random(in: 0.0...1.0)
        
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        updateColorVuewBackground(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }


    @IBAction func redSliderValueChanged() {
        redValue.text = String(format: "%.2f", redSlider.value)
        updateColorVuewBackground(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    @IBAction func greenSliderValueChanged() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        updateColorVuewBackground(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    @IBAction func blueSliderValueChanged() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        updateColorVuewBackground(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    private func updateColorVuewBackground(red: Float, green: Float, blue: Float) {
        let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        colorView.backgroundColor = color
    }
}

