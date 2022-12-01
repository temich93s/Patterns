//
//  LoadImageService.swift
//  Proxy
//
//  Created by 2lup on 29.11.2022.
//

import Foundation

// класс занимающийся загрузкой фотографии, подготовили его для пользователя
class LoadImageService: LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        // отключим кеширование у URLSessionConfiguration
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        // создаем нашу сессию с отключенным кешированием
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
