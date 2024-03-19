//
//  ReffOnProfissional.swift
//  REFFON
//
//  Created by Guilherme on 3/17/24.
//

import Foundation
class Profissional: Usuario {
    var idProfissional: Int
    var tempoProfissao: Int
    var tipoServico: String
    var avaliacao: Int

    init(idUsuario: Int, nome: String, email: String, senha: String, idProfissional: Int, tempoProfissao: Int, tipoServico: String, availacao: Int) {
        self.idProfissional = idProfissional
        self.tempoProfissao = tempoProfissao
        self.tipoServico = tipoServico
        self.avaliacao = availacao
        // Chama o inicializador da classe base
        super.init(idUsuario: idUsuario, nome: nome, email: email, senha: senha)
    }
    
    private enum CodingKeys: String, CodingKey {
        case idProfissional, tempoProfissao, tipoServico, avaliacao
    }
    
    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           idProfissional = try container.decode(Int.self, forKey: .idProfissional)
           tempoProfissao = try container.decode(Int.self, forKey: .tempoProfissao)
           tipoServico = try container.decode(String.self, forKey: .tipoServico)
           avaliacao = try container.decode(Int.self, forKey: .avaliacao)
           try super.init(from: decoder)
       }

       override func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(idProfissional, forKey: .idProfissional)
           try container.encode(tempoProfissao, forKey: .tempoProfissao)
           try container.encode(tipoServico, forKey: .tipoServico)
           try container.encode(avaliacao, forKey: .avaliacao)
           try super.encode(to: encoder)
       }
}
