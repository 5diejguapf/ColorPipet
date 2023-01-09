//
//  MainViewController.swift
//  ColorPipet
//
//  Created by serg on 10.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.exitDelegate = self
    }
    
}

extension MainViewController: SetColorProtocole {
    func setBackground(_ color: UIColor?) {
        view.backgroundColor = color
        
    }
}
