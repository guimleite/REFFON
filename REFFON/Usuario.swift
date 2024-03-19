//
//  ReffOnUsuario.swift
//  REFFON
//
//  Created by Guilherme on 3/17/24.
//

import Foundation

class Usuario : Codable {
    var idUsuario: Int
    var nome: String
    var email: String
    var senha: String

    init(idUsuario: Int, nome: String, email: String, senha: String) {
        self.idUsuario = idUsuario
        self.nome = nome
        self.email = email
        self.senha = senha
    }
}
