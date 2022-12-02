//
//  ViewController.swift
//  Command
//
//  Created by 2lup on 30.11.2022.
//

import UIKit

protocol BaseCommand {
    //метод отмены
    func undo() -> String
    // метод записи и хранения отмены
    func forward(_ str: String)
}

// наш командa - официант
class StringUndoCommand: BaseCommand {
    // первичная строка
    private var originalString: String
    
    // текущая строка
    private var currentString: String
    
    init(argument: String) {
        originalString = argument
        currentString = argument
    }
    
    func undo() -> String {
        // удаляем последний символ
        currentString.removeLast()
        print(currentString)
        return currentString
    }
    
    func forward(_ str: String) {
        // добавляем строку
        currentString.append(str)
        print(currentString)
    }
    
    // метод печати изменений
    func printString() {
        print(currentString)
    }
    
}

// наш исполнитель - повар
class CommandExecutor {
    // массив команд
    private var arrayOfCommand = [BaseCommand]()
    
    //метод добавления команды
    func addCommand(command: BaseCommand) {
        arrayOfCommand.append(command)
    }
    
    // методы исполнения команд добавления и удаления
    func forward(_ str: String) {
        for command in arrayOfCommand {
            command.forward(str)
        }
    }
    
    func undoLast() -> String {
        var title = String()
        for command in arrayOfCommand {
            title = command.undo()
        }
        return title
    }
}

// отправитель - клиент
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    // создаем повара
    let commandExecutor = CommandExecutor()
    // официант
    var cmdUndo: StringUndoCommand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

    // отмена по 1 символу при нажатииё
    @IBAction func undoAction(_ sender: UIButton) {
        // присваиваем отмененный текст
        textField.text = commandExecutor.undoLast()
    }
    
}

extension ViewController: UITextViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // официант принимает сообщение (операция превращается в команду)
        cmdUndo = StringUndoCommand(argument: textField.text!)
        // сохраняем команду у исполнителя
        commandExecutor.addCommand(command: cmdUndo!)
        commandExecutor.forward(string)
        return true
    }
}
