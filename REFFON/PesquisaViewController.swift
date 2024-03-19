//
//  PesquisaViewController.swift
//  REFFON
//
//  Created by user250954 on 3/11/24.
//

import UIKit
import CoreData

class PesquisaViewController: UIViewController {
            
    @IBOutlet var profissionalTable: UITableView!
    
    var profissionais: [Profissional] = []
    var profissionalSelecionado: Profissional?
    var pesquisa: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfissionais()
        profissionalTable.delegate = self
        profissionalTable.dataSource = self
        
        profissionalTable.estimatedRowHeight = 100
        profissionalTable.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for perfilSegue: UIStoryboardSegue, sender: Any?) {
        if perfilSegue.identifier == "perfilSegue" {
            if let destinoVC = perfilSegue.destination as? PerfilProfissionalViewController {
                destinoVC.profissional = profissionalSelecionado
            }
        }

    }
    
    func loadProfissionais(){
        guard let fileURL = Bundle.main.url(forResource: "profissionais", withExtension: "json") else{return}
                
        do{
            let data = try Data(contentsOf: fileURL)
            
            profissionais = try JSONDecoder().decode([Profissional].self, from: data)
            print(pesquisa ?? "Empty")
            
            profissionais = profissionais.filter { $0.tipoServico == pesquisa }
            
        }catch{
            print("Erro ao carregar profissionais")
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

extension PesquisaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        profissionalSelecionado = profissionais[indexPath.row]
        
        performSegue(withIdentifier: "perfilSegue", sender: self)
    }
}

extension PesquisaViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ profissionalTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profissionais.count
    }
    
    func tableView(_ profissionalTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profissionalTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfissionalTableViewCell
        
        let profissional = profissionais[indexPath.row]
        
        cell.lbNome.text = profissional.nome
        cell.lbProfissao.text = profissional.tipoServico
        
        let avaliacao = profissional.avaliacao
            let estrelas = [cell.ivStar1, cell.ivStar2, cell.ivStar3, cell.ivStar4, cell.ivStar5]
            
            for (index, estrela) in estrelas.enumerated() {
                if index < avaliacao {
                    estrela?.image = UIImage(named: "StarOn")
                } else {
                    estrela?.image = UIImage(named: "StarOff")
                }
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
