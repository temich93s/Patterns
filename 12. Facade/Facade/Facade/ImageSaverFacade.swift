//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by 2lup on 29.11.2022.
//

import Foundation
import UIKit

// наш  фасад, предоставляет методы работы, в себе содержит экземпляры других классов
class ImageSaverFacade {
    // скрытые классы
    private let pathProvider = PathProvider()
    private let dataProvider = ImageDataProvider()
    
    // публичный метод для пользователя
    public func save(image: UIImage, type: ImageType,
                     fileName: String, overwrite: Bool) throws {
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from: image, type: type)
        let writeOptions: Data.WritingOptions = overwrite ? (.atomic) : (.withoutOverwriting)
        try imageData.write(to: destinationURL, options: writeOptions)
    }
}
