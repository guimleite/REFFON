//
//  PerfilProfissionalViewController.swift
//  REFFON
//
//  Created by Guilherme on 3/11/24.
//

import UIKit

class PerfilProfissionalViewController: UIViewController {
    
    var profissional: Profissional?
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbProfissao: UILabel!
    @IBOutlet weak var lbExperiencia: UILabel!
    @IBOutlet weak var ivStar1: UIImageView!
    @IBOutlet weak var ivStar2: UIImageView!
    @IBOutlet weak var ivStar3: UIImageView!
    @IBOutlet weak var ivStar4: UIImageView!
    @IBOutlet weak var ivStar5: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Atualiza a UI com os dados do profissional atual.
        if let nome = profissional?.nome {
            lbNome.text = nome
        }
        
        if let profissao = profissional?.tipoServico {
            lbProfissao.text = "Profissão: \(profissao)"
        }
        
        if let experiencia = profissional?.tempoProfissao {
            lbExperiencia.text = "Experiência: \(experiencia) Anos"
        }
        
        if let avaliacao = profissional?.avaliacao{
            let estrelas = [ivStar1, ivStar2, ivStar3, ivStar4, ivStar5]
                
            for (index, estrela) in estrelas.enumerated() {
                if index < avaliacao {
                    estrela?.image = UIImage(named: "StarOn")
                } else {
                    estrela?.image = UIImage(named: "StarOff")
                }
            }
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
