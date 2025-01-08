//
//  CountryCollectionViewCell.swift
//  CollectionViews
//
//  Created by Batch - 1 on 03/01/25.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var countryName: UILabel!
    @IBOutlet weak var countryGdp: UILabel!
    @IBOutlet weak var countryflag: UIImageView!
    
    
    func updateCellData(with country: Country) {
        countryName.text = country.countryName
        countryGdp.text = (String)(country.gdpValue)
        countryflag.image = UIImage(named: country.flag)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateCellUi()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateCellUi()
    }
    
    func updateCellUi() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemRed.withAlphaComponent(0.5)
    }
}
