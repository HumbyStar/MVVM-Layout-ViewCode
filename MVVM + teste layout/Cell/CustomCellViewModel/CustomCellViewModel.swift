//
//  CustomCellViewModel.swift
//  MVVM + teste layout
//  Created by Humberto Rodrigues on 21/01/23.
//
//  MARK: Criamos uma ViewModel para a célula, pois precisamos manipular a tratativa e implementar toda essa edição do que ira aparecer para meu usuário, essa manipulação e formatação é sempre necessária na ViewModel quando falamos de MVVM

import UIKit // Não é um bom habito trabalhar com UIKit dentro da minha ViewMode, porém como estamos trabalhando com UIImage, iremos colocar o import.

enum DescriptionCustomCell: String {
    case name = "Nome: "
    case profession = "Profissão: "
    case salary = "Salário: "
    case age = "Idade: "
}

class CustomCellViewModel {
    private var data: Human// data info de cada human, vamos considerar como RG, cria uma por vez, de acordo com o indexPath que é passado na ViewController, não tem acesso ao array da ViewModel principal.
    
    init(data: Human){
        self.data = data
    }
    public var getHuman: Human {
        return self.data
    }
    
    public var getName: String {
        return DescriptionCustomCell.name.rawValue + self.data.name
    }
    
    public var getProfession: String {
        return DescriptionCustomCell.profession.rawValue + self.data.profession
    }
    public var getSalary: String {
        return DescriptionCustomCell.salary.rawValue + self.data.salary
    }

    public var getAge: String {
        return DescriptionCustomCell.age.rawValue + String(self.data.age)
    }
    public var getUserImage: UIImage {
        return self.data.imageUser
    }
    
    public var getIsEnableHearth: Bool {
        return self.data.isEnableHearth
    }
    
    public func changeHearthState(value: Bool) {
        self.data.isEnableHearth = value
        //se era false, ele recebe false ou true
    }

}
