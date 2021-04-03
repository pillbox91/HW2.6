//
//  ColorViewController.swift
//  HW2.6
//
//  Created by Андрей Аверьянов on 28.03.2021.
//

import UIKit



class ColorViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var delegate: BackgroundColorDelegate!
    var currentColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = currentColor
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
       
    }
    
    // MARK: - Working with colorView
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0: setValue(for: redLabel)
        case 1: setValue(for: greenLabel)
        case 2: setValue(for: blueLabel)
        default: break
        }
        
        setColor()
    }
    
    
    @IBAction func doneButton() {
        delegate?.backgroundColorViewController(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension ColorViewController {
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
            }
        }
        
        private func setValue(for sliders: UISlider...) {
            let ciColor = CIColor(color: currentColor)
            
            sliders.forEach { slider in
                switch slider.tag {
                case 0: redSlider.value = Float(ciColor.red)
                case 1: greenSlider.value = Float(ciColor.green)
                case 2: blueSlider.value = Float(ciColor.blue)
                default: break
                }
            }
        }
        
        private func string(from slider: UISlider) -> String {
            return String(format: "%.2f", slider.value)
        }
    }


