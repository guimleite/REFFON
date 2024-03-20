//
//  ViewController.swift
//  REFFON
//
//  Created by Guilherme on 3/11/24.
//

import UIKit

class ViewController: UIViewController {

    var profissional1: Profissional?
    @IBOutlet weak var lbNome1: UILabel!
    @IBOutlet weak var lbProfissao1: UILabel!
    @IBOutlet weak var ivStar1: UIImageView!
    @IBOutlet weak var ivStar2: UIImageView!
    @IBOutlet weak var ivStar3: UIImageView!
    @IBOutlet weak var ivStar4: UIImageView!
    @IBOutlet weak var ivStar5: UIImageView!
    
    var profissional2: Profissional?
    @IBOutlet weak var lbNome2: UILabel!
    @IBOutlet weak var lbProfissao2: UILabel!
    @IBOutlet weak var ivStar6: UIImageView!
    @IBOutlet weak var ivStar7: UIImageView!
    @IBOutlet weak var ivStar8: UIImageView!
    @IBOutlet weak var ivStar9: UIImageView!
    @IBOutlet weak var ivStar10: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfissionais()
    }
    
    func loadProfissionais() {
        guard let fileURL = Bundle.main.url(forResource: "profissionais", withExtension: "json") else { return }
                    
        do {
            let data = try Data(contentsOf: fileURL)
            
            let profissionais = try JSONDecoder().decode([Profissional].self, from: data)
            let profissionais5Estrelas = profissionais.filter { $0.avaliacao == 5 }
            
            let profissionaisDestaque = profissionais5Estrelas.shuffled()
            profissional1 = profissionaisDestaque.prefix(2).first
            profissional2 = profissionaisDestaque.prefix(2).dropFirst().first
            
            if let nome = profissional1?.nome {
                lbNome1.text = nome
            }
            if let profissao = profissional1?.tipoServico {
                lbProfissao1.text = profissao
            }
            
            if let nome = profissional2?.nome {
                lbNome2.text = nome
            }
            if let profissao = profissional2?.tipoServico {
                lbProfissao2.text = profissao
            }
            if let avaliacao1 = profissional1?.avaliacao{
                let estrelas1 = [ivStar1, ivStar2, ivStar3, ivStar4, ivStar5]
                    
                for (index, estrela) in estrelas1.enumerated() {
                    if index < avaliacao1 {
                        estrela?.image = UIImage(named: "StarOn")
                    } else {
                        estrela?.image = UIImage(named: "StarOff")
                    }
                }
            }
            
            
            if let avaliacao2 = profissional2?.avaliacao{
                let estrelas2 = [ivStar6, ivStar7, ivStar8, ivStar9, ivStar10]
                    
                for (index, estrela) in estrelas2.enumerated() {
                    if index < avaliacao2 {
                        estrela?.image = UIImage(named: "StarOn")
                    } else {
                        estrela?.image = UIImage(named: "StarOff")
                    }
                }
            }
            
        } catch {
            print("Erro ao carregar profissionais")
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pintorSegue":
            if let destinoVC = segue.destination as? PesquisaViewController {
                destinoVC.pesquisa = "Pintor"
            }
        case "encanadorSegue":
            if let destinoVC = segue.destination as? PesquisaViewController {
                destinoVC.pesquisa = "Encanador"
            }
        case "faxineiroSegue":
            if let destinoVC = segue.destination as? PesquisaViewController {
                destinoVC.pesquisa = "Faxineiro"
            }
        case "eletricistaSegue":
            if let destinoVC = segue.destination as? PesquisaViewController {
                destinoVC.pesquisa = "Eletricista"
            }
        case "perfilDestaque1Segue":
            if let destinoVC = segue.destination as? PerfilProfissionalViewController {
                destinoVC.profissional = profissional1
            }
        case "perfilDestaque2Segue":
            if let destinoVC = segue.destination as? PerfilProfissionalViewController {
                destinoVC.profissional = profissional2
            }
        default:
            break
        }

    }

}
