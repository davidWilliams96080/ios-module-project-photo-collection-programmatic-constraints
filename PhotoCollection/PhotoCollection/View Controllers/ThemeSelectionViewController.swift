//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        setUpSubViews()
        setTheme()
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            selectBlueTheme()
            segmentedControl.selectedSegmentTintColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        case 1:
            selectGreenTheme()
            segmentedControl.selectedSegmentTintColor = UIColor.systemGreen
        case 2:
            selectYellowTheme()
            segmentedControl.selectedSegmentTintColor = UIColor.systemYellow
        case 3:
            selectDarkTheme()
            segmentedControl.selectedSegmentTintColor = UIColor.darkGray
        default:
            break
        }
         dismiss(animated: true, completion: nil)
    }
    
    func setUpSubViews() {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Which theme would you like to use?"
        label.textAlignment = .center
        view.addSubview(label)
        
        // y
        let labelYConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120)
        
        // x
        let labelLeadingConstraint = label.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
//
//        let darkButton = UIButton(type: .system)
//        darkButton.translatesAutoresizingMaskIntoConstraints = false
//        darkButton.setTitle("Dark", for: .normal)
//        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
//        view.addSubview(darkButton)
//
//        // y
//        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
//
//        // x
//        darkButton.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
//
//        let blueButton = UIButton(type: .system)
//        blueButton.translatesAutoresizingMaskIntoConstraints = false
//        blueButton.setTitle("Blue", for: .normal)
//        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
//
//        view.addSubview(blueButton)
//
//        // y
//        let blueButtonCenterYConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
//
//        // x
//        let blueButtonLeadingConstraint = blueButton.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
//
//
       // NSLayoutConstraint.activate([labelYConstraint, labelLeadingConstraint, blueButtonCenterYConstraint, blueButtonLeadingConstraint])
        
        /// Segemented Control for theme selection intead of buttons
        
        func addControl() {
            
            let segmentItems = ["Blue", "Green", "Yellow", "Dark"]
            let control = UISegmentedControl(items: segmentItems)
            control.translatesAutoresizingMaskIntoConstraints = false
            
            // control.frame = CGRect(x: 10, y: 250, width: (self.view.frame.width - 20), height: 0)
            control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
            control.backgroundColor = .clear
            control.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            control.layer.borderColor = UIColor.black.cgColor
            control.layer.borderWidth = 2.0
            
            guard let themePreference = themeHelper?.themePreference else { return }
            switch themePreference {
            case "Blue":
                control.selectedSegmentIndex = 0
                control.selectedSegmentTintColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
            case "Green":
                control.selectedSegmentIndex = 1
                control.selectedSegmentTintColor = .systemGreen
            case "Yellow":
                control.selectedSegmentIndex = 2
                control.selectedSegmentTintColor = .yellow
            case "Dark":
                control.selectedSegmentIndex = 3
                control.selectedSegmentTintColor = .darkGray
            default:
                break
            }

            view.addSubview(control)
            let controlTop = control.topAnchor.constraint(equalTo: label.topAnchor, constant: 40)
            let controlCenterX = control.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
             NSLayoutConstraint.activate([labelYConstraint, labelLeadingConstraint, controlTop, controlCenterX])
                   }
        
                   addControl()
    }
    
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
    }
    
    @objc func selectYellowTheme() {
        themeHelper?.setThemePreferenceToYellow()
    }
    
    @objc func selectGreenTheme() {
        themeHelper?.setThemePreferenceToGreen()
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        case "Yellow":
            backgroundColor = .yellow
        case "Green":
            backgroundColor = .green
        default:
            break
        }
        view.backgroundColor = backgroundColor
    }
}
