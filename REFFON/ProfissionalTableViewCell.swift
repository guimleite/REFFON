//
//  ProfissionalTableViewCell.swift
//  REFFON
//
//  Created by Guilherme on 3/17/24.
//

import UIKit

class ProfissionalTableViewCell: UITableViewCell {

    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var btnCard: UIButton!
    @IBOutlet weak var lbProfissao: UILabel!
    @IBOutlet weak var ivStar1: UIImageView!
    @IBOutlet weak var ivStar2: UIImageView!
    @IBOutlet weak var ivStar3: UIImageView!
    @IBOutlet weak var ivStar4: UIImageView!
    @IBOutlet weak var ivStar5: UIImageView!
    
    weak var delegate: ProfissionalCellDelegate?
    var profissional: Profissional? //
    
    var onButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCard.removeTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btnCard.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        if let profissional = profissional {
            delegate?.didTapButton(profissional: profissional)
        }
    }
    
}

protocol ProfissionalCellDelegate: AnyObject {
    func didTapButton(profissional: Profissional)
}
