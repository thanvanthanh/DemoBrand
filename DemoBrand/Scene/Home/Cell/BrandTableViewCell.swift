
//
//  BrandTableViewCell.swift
//  DemoBrand
//
//  Created by Thân Văn Thanh on 24/05/2021.
//

import UIKit

class BrandTableViewCell: UITableViewCell {
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var nameBrand: UILabel!
    @IBOutlet weak var founderBrand: UILabel!
    @IBOutlet weak var founderYear: UILabel!
    
    var brand : BrandEntity? {
        didSet{
            if let brand = brand{
                logoImage.image = brand.logo
                nameBrand.text = brand.name
                founderYear.text = "\(brand.foundedYear ?? 2000)"
                founderBrand.text = brand.founder
            }
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func updateData(brand: BrandEntity) {
//        logoImage.image = brand.logo
//        nameBrand.text = brand.name
//        founderYear.text = "\(brand.foundedYear ?? 2000)"
//        founderBrand.text = brand.founder
//    }
}
