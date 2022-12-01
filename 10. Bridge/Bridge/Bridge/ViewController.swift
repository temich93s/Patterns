//
//  ViewController.swift
//  Bridge
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayPicker: DayPickerView!
    
    var days = ["пн", "вт", "ср", "чт", "пт", "сб", "вс"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // источник данных это мост то есть мы
        dayPicker.dataSource = self
    }

}

extension ViewController: DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        days[indexPath.row]
    }
}
