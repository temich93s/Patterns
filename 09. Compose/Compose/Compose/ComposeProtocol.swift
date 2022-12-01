//
//  ComposeProtocol.swift
//  Compose
//
//  Created by 2lup on 29.11.2022.
//

import Foundation

protocol ComposeProtocol {
    // описание файловой структуры
    var name: String {get set}
    // метод показа содержимого объекта
    func showContent() -> Any
    // добавление объектов
    func addComponent(c: ComposeProtocol)
    // кол-во объектов
    func contentCount() -> Int
}

// файл который поддерживает compose
class File: ComposeProtocol {
    //имя файла
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // содержимое файла
    func showContent() -> Any {
        return name
    }
    
    // пока просто заглушка
    func addComponent(c: ComposeProtocol) {
        print("Не могу добавить")
    }
    
    // количество файлов
    func contentCount() -> Int {
        return 1
    }
}

// папки которая поддерживает compose
class Folder: ComposeProtocol {
    //имя папки
    var name: String
    
    // ветки
    private var contentArray = [ComposeProtocol]()
    
    init(name: String) {
        self.name = name
    }
    
    // содержимое файла
    func showContent() -> Any {
        return contentArray
    }
    
    // добавляем объекты через компоновщик
    func addComponent(c: ComposeProtocol) {
        contentArray.append(c)
    }
    
    // количество файлов
    func contentCount() -> Int {
        return contentArray.count
    }
}
