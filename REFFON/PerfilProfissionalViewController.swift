//
//  PerfilProfissionalViewController.swift
//  REFFON
//
//  Created by user250954 on 3/11/24.
//

import UIKit

class PerfilProfissionalViewController: UIViewController {
    
    var profissional: Profissional?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(profissional?.nome)
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
