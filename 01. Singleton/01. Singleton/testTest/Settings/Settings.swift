//
//  Settings.swift
//  testTest
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

class Settings {
    // создаем только 1 статичный экземпляр самого себя , что бы был доступ везде к нему
    static let shared = Settings()
    
    var clorStyle = UIColor.white
    var volumeLevel: Float = 1.0
    
    // приватим инициализатор что бы бы только 1 экземпляр
    private init() {}
}
