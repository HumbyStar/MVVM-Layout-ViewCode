//
//  Protocols.swift
//  MVVM + teste layout
//
//  Created by Humberto Rodrigues on 21/01/23.
//

import Foundation

protocol ViewCode{
    func buildHierarquic()
    func setupConstraint()
    func extrasFeatures()
}

extension ViewCode {
    func setupViewCode() {
        buildHierarquic()
        setupConstraint()
        extrasFeatures()
    }
    
    func buildHierarquic() {
        
    }
    
    func setupConstraint(){
        
    }
    func extrasFeatures(){
        
    }
}
