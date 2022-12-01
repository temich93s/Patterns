//
//  DayPickerView.swift
//  Bridge
//
//  Created by 2lup on 29.11.2022.
//

import Foundation
import UIKit

// датасоурс нашего кастомного элемент
protocol DayPickerViewDataSource {
    // кол-во дней
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    // содержимое
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

// наш кастомный элемент + наследуемся от контрола для обработки событий
class DayPickerView: UIControl {
    // создаем мост
    public var dataSource: DayPickerViewDataSource? {
        didSet {
            setupView()
        }
    }
    
    // место хранения баттонов
    private var buttons: [UIButton] = []
    // расположение на экране
    private var stackView: UIStackView!
    
    // Это что бы стек работал
    override func layoutSubviews() {
        super.layoutSubviews()
        // задаем размер вью
        stackView.frame = bounds
    }
    
    // установка вью если датасоурс установлен
    func setupView() {
        // получаем количество от источника
        let count = dataSource?.dayPickerCount(self)
        // переборщик создающий элементы
        for item in 0..<count! {
            let indexPath = IndexPath(row: item, section: 0)
            // получаем заголовки
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            // создаем кнопки с заголовком пользователя
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.blue, for: .selected)
            button.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
            buttons.append(button)
            // добавляем кнопку в стеквью
            self.addSubview(button)
        }
        // добавляем кнопку в стеквью
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc func selectedButton(sender: UIButton) {
        print(#function)
        for b in buttons {
            b.isSelected = false
        }
        // получаес тег кнопки
        let index = sender.tag
        let button = buttons[index]
        button.isSelected = true
    }
    
}
