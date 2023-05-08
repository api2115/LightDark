//
//  ViewController.swift
//  LightDark
//
//  Created by Adam Pilarski on 08/05/2023.
//

import UIKit

class ViewController: UIViewController {

    let darkModeSwitch = UISwitch()
    let textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        
        setUpSwitch()
        setUpLabel()
        
        setUpConstraints()
        
    }
    
    func setUpLabel(){
        self.view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.text = "Demo dark mode light mode"
        textLabel.textColor = UIColor(named: "textColor")
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
    }
    
    func setUpSwitch(){
        self.view.addSubview(darkModeSwitch)
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
        darkModeSwitch.addTarget(self, action: #selector(switchMode(_:)), for: .valueChanged)
        
        if traitCollection.userInterfaceStyle == .dark {
            darkModeSwitch.isOn = true
        } else {
            darkModeSwitch.isOn = false
        }
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            darkModeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            darkModeSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: darkModeSwitch.bottomAnchor, constant: 20)
        ])
    }
    
    
    @objc func switchMode(_ sender: UISwitch!) {
        if sender.isOn {
            // Switch is on - enable dark mode
            overrideUserInterfaceStyle = .dark
        } else {
            // Switch is off - enable light mode
            overrideUserInterfaceStyle = .light
        }
    }


}

