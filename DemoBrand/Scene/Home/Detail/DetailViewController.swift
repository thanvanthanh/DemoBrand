//
//  DetailViewController.swift
//  DemoBrand
//
//  Created by Thân Văn Thanh on 24/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameBrand: UILabel!
    @IBOutlet weak var founderYear: UILabel!
    @IBOutlet weak var founderLBL: UILabel!
    @IBOutlet weak var ceoLBL: UILabel!
    @IBOutlet weak var introduceLBL: UILabel!
    
    var brand : BrandEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    private func setupView() {
        title = "Detail"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    func fillData(){
        if (brand != nil) {
            self.logoImage.image = brand?.logo
            self.nameBrand.text = brand?.name
            self.founderYear.text = "\(brand?.foundedYear ?? 2000)"
            self.founderLBL.text = brand?.founder
            self.ceoLBL.text = brand?.ceo
            self.introduceLBL.text = brand?.introduce
        }
    }

}
