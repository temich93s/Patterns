//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by 2lup on 29.11.2022.
//

import Foundation

// протокол объект которого будет загружать фотографии
protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
