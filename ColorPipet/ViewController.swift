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
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        initRandomColor()
        updateLabelsText()
        
        updateColorVuewBackground()
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
    
    private func initRandomColor() {
        redSlider.value = Float.random(in: 0.0...1.0)
        greenSlider.value = Float.random(in: 0.0...1.0)
        blueSlider.value = Float.random(in: 0.0...1.0)
    }
    
    private func updateLabelsText() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
}

