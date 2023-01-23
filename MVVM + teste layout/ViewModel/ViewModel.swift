//
//  ViewModel.swift
//  MVVM + teste layout
//
//  Created by Humberto Rodrigues on 21/01/23.
//

import UIKit

class ViewModel {
    private var listHuman:[Human] = []
    // Posso recupera-los através de get e set. Sendo Get para pegar os dados e Set para fazer uma possível alteração caso seja necessário.
    
    init(){
        self.loadHumans()
    }
    
    private func loadHumans() {
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 0))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 1))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 2))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 3))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 4))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 5))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 6))
        self.listHuman.append(Human(name: "Humberto", age: 26, profession: "IOS Development", salary: "4000", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHearth: false, identifier: 7))
       
    }
    
    public var numberOfRows:Int{
        return self.listHuman.count
    }
    
    public func loadCurrentUser(indexPath: IndexPath) -> Human{
        return self.listHuman[indexPath.row]
    }
 
    public func getUserName(indexPath: IndexPath) -> String {
        return self.listHuman[indexPath.row].name
    }
    
    public func changeHearthHuman(human: Human) {
        //Crio uma variavel row, e comparo qual $0(human) é compativel com o parametro human.identifier, o encontrando, eu atribuo em self.listHuman, assim o mesmo será atualizado.
        
        if let row = self.listHuman.firstIndex(where: {human.identifier == $0.identifier}) {
            self.listHuman[row] = human
        }
    }
}

//  MARK: A VIEWMODEL TRATA O OBJETO, esse é o objetivo dela.
// ViewModel é onde fica os dados, preciso deixar esses dados de maneira private, se eu os deixo de maneira publica, quem tem acesso a camada View pode ter acesso e altera-lo de alguma maneira

