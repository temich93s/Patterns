//
//  ViewController.swift
//  Facade
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

// энам по обработки ошибок
enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestinationPath
}

// энам типа картинки
enum ImageType {
    case png
    case jpeg(compressionQuality: CGFloat)
}


class ViewController: UIViewController {

    // экземпляр фасада
    let imageSaver = ImageSaverFacade()
    let image = UIImage(named: "Lightwire")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try imageSaver.save(image: image, type: .png, fileName: "name", overwrite: true)
        } catch {
            print(error)
        }
    }

}

