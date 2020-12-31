//
//  ViewController.swift
//  Project18
//
//  Created by Timothy Hoiberg on 31/12/20.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var temperatureCelsius: Double = 50 {
        didSet {
            updateFahrenheit()
        }
    }
    @objc dynamic var temperatureFahrenheit: Double = 50
    @objc dynamic var icon: String {
        switch temperatureCelsius {
        case let temp where temp < 0:
            return "☃️"
        case 0...10:
            return "❄️"
        case 10...20:
            return "☁️"
        case 20...30:
            return "🌤️"
        case 30...40:
            return "☀️"
        case 40...50:
            return "🔥"
        default:
            return "💀"
        }
    }

    @IBAction func reset(_ sender: Any) {
        temperatureCelsius = 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let numbers: NSArray = [1, 2, 3, 4, 9]
        print(numbers.value(forKeyPath: "@count.self")!)
        print(numbers.value(forKeyPath: "@min.self")!)
        print(numbers.value(forKeyPath: "@max.self")!)
        print(numbers.value(forKeyPath: "@sum.self")!)
        print(numbers.value(forKeyPath: "@avg.self")!)
        
        updateFahrenheit()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func setNilValueForKey(_ key: String) {
        if key == "temperatureCelsius" {
            temperatureCelsius = 0
        }
    }
    
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        if key == "icon" {
            return ["temperatureCelsius"]
        } else {
            return []
        }
    }
    
    func updateFahrenheit() {
        let celsius = Measurement(value: temperatureCelsius, unit: UnitTemperature.celsius)
        
        temperatureFahrenheit = round(celsius.converted(to: .fahrenheit).value)
    }
}

