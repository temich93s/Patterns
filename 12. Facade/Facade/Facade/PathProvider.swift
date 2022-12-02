//
//  PathProvider.swift
//  Facade
//
//  Created by 2lup on 29.11.2022.
//

import Foundation

// класс который создает путь по которому сохраним картинку
class PathProvider {
    func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverError.couldNotCreateDestinationPath
        }
        let destinationPath = path.appendingPathComponent("\(fileName)")
        print(destinationPath)
        return destinationPath
    }
}
