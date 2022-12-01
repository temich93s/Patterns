//
//  Proxy.swift
//  Proxy
//
//  Created by 2lup on 29.11.2022.
//

import Foundation

// переменная для хранения кеша
var cacheDate: Data?

// создаем прокси
class Proxy: LoadServiceProtocol {
    
    // будем передавать сюда загрузчик фотографий
    private var service: LoadServiceProtocol
    
    // инициализатор для передачи загрузчика фотографий
    init(service: LoadServiceProtocol) {
        self.service = service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        // проверяем закешированы ли данные
        if cacheDate == nil {
            // если пустая то заполняем кеш и оповещаем пользователя
            service.loadImage(url: url) { (data, response, error) in
                // сохраняем данные в кеш
                cacheDate = data
                // возвращаем результат пользователю
                completion(data, response, error)
            }
        } else {
            // возвращаем данные пользователю но уже из кеша
            completion(cacheDate, nil, nil)
        }
    }
}


