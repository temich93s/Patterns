//
//  ImageDataProvider.swift
//  Facade
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

// класс который обрабатывает данные для каждого расширения фото
class ImageDataProvider {
    // метод по обработки фото с выкидыванием ошибки
    public func data(from image: UIImage, type: ImageType) throws -> Data {
        switch type {
        case .png:
            return try pngData(from: image)
        case .jpeg(let compressionQuality):
            return try jpegData(from: image, compressionQuality: compressionQuality)
        }
    }
    
    // функции конвертации фото
    private func pngData(from image: UIImage) throws -> Data {
        guard let imageData = image.pngData() else {
            throw ImageSaverError.couldNotCreatePNGDataFromImage
        }
        return imageData
    }
    
    private func jpegData(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            throw ImageSaverError.couldNotCreateJPEGDataFromImage
        }
        return imageData
    }
}
