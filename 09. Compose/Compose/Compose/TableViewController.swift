//
//  TableViewController.swift
//  Compose
//
//  Created by 2lup on 29.11.2022.
//

import UIKit

class TableViewController: UITableViewController {

    // корневая директория. тип протокол
    private var currentFolder: ComposeProtocol = Folder(name: "Main")
    
    // для перехода по папка через рекурсию TableViewController
    private var tableViewController: TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        return vc!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addFileBarButton(_ sender: Any) {
        currentFolder.addComponent(c: File(name: "new file"))
        tableView.reloadData()
    }
    
    @IBAction func addFolderBarButton(_ sender: Any) {
        currentFolder.addComponent(c: Folder(name: "new folder"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFolder.contentCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // кастим так как возвращает Any
        guard let contents = currentFolder.showContent() as? [ComposeProtocol] else { fatalError() }
        // формируем данные на основе папки
        let item = contents[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item is Folder ? "Folder" : "File"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // переход по папкам через рекурсивный подход
        guard let contents = currentFolder.showContent() as? [ComposeProtocol] else { fatalError() }
        let item = contents[indexPath.row]
        // передаем ему текущий каталог как корневой
        tableViewController.currentFolder = item
        item is Folder ? showFolder() : print(item.showContent())
    }
    
    // функция перехода в папку
    func showFolder() {
        navigationController?.pushViewController(tableViewController, animated: true)
    }

}
