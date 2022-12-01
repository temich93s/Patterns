//
//  DetailViewController.swift
//  Proxy
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // сама фотка
    let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/VanGogh_1887_Selbstbildnis.jpg/274px-VanGogh_1887_Selbstbildnis.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    // функция занимающаяся загрузкой
    func loadImage() {
        // создаем объект что занимается загрузкой фотографии (загрузчик)
        let imageService = LoadImageService()
        // передаем этот объект в прокси что бы прокси работал и контролировал загрузчик
        let proxy = Proxy(service: imageService)
        // вызываем у прокси загрузку что бы магия прокси работала
        proxy.loadImage(url: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }

    @IBAction func refreshButton(_ sender: UIButton) {
        cacheDate = nil
        imageView.image = nil
        loadImage()
    }

}
