//
//  ProfissionalTableViewCell.swift
//  REFFON
//
//  Created by user250954 on 3/17/24.
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
