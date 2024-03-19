//
//  ReffOnProfissional.swift
//  REFFON
//
//  Created by Guilherme on 3/17/24.
//

import Foundation

class ReffOnProfissional: ReffOnUsuario {
    var tempoProfissao: Int
    var tipoServico: String

    init(idUsuario: Int?, nome: String?, email: String?, senha: String?, tempoProfissao: Int, tipoServico: String) {
        // Inicializa os atributos específicos de ReffOnProfissional
        self.tempoProfissao = tempoProfissao
        self.tipoServico = tipoServico
        // Chama o inicializador da classe base
        super.init(idUsuario: idUsuario, nome: nome, email: email, senha: senha)
    }

    // Se necessário, você pode sobrescrever métodos da classe base ou adicionar novos métodos específicos de ReffOnProfissional
}
