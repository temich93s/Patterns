//
//  ViewController.swift
//  FlyWeight
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // у них общая ссылка
        let red = UIColor.red
        let red2 = UIColor.red
        print(red === red2)
        
        // у этих разные адреса
        let color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let color2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        print(color === color2)
        
        // теперь через наш легковес. у этих одинаковые адреса
        let flyColor = UIColor.rgba(1, 0, 0, 1)
        let flyColor2 = UIColor.rgba(1, 0, 0, 1)
        print(flyColor === flyColor2)
    }
}

// оптимизация по пути flyweight
extension UIColor {
    // словарь цветов
    static var colorStore: [String: UIColor] = [:]
    class func rgba(_ red: CGFloat,
                    _ green: CGFloat,
                    _ blue: CGFloat,
                    _ alfa: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alfa)"
        // проверяем есть ли квет в словаре если есть вытаскиваем из словаря если нет, то создаем и записываем в словарь
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alfa)
        colorStore[key] = color
        return color
    }
}
