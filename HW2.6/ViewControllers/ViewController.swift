//
//  ViewController.swift
//  HW2.6
//
//  Created by Андрей Аверьянов on 28.03.2021.
//

import UIKit

protocol BackgroundColorDelegate {
    func backgroundColorViewController(_ color: UIColor )
}

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newColorVC = segue.destination as! ColorViewController
        newColorVC.delegate = self
        newColorVC.currentColor = view.backgroundColor
    }
}

extension ViewController: BackgroundColorDelegate {
    func backgroundColorViewController(_ color: UIColor) {
        view.backgroundColor = color
    }
}
