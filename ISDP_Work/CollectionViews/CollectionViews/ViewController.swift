//
//  ViewController.swift
//  CollectionViews
//
//  Created by Batch - 1 on 03/01/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    static let reuseIdentifier = "countryCell"
    
    @IBOutlet weak var gdpCollectionView: UICollectionView!
    
    let countries: [Country] = [
        Country(countryName: "United States", flag: "usa", gdpValue: 30337),
        Country(countryName: "China", flag: "china", gdpValue: 19535),
        Country(countryName: "India", flag: "india", gdpValue: 4272),
        Country(countryName: "Germany", flag: "germany", gdpValue: 4922),
        Country(countryName: "Japan", flag: "japan", gdpValue: 4389),
        Country(countryName: "United Kingdom", flag: "unitedkingdom", gdpValue: 3730),
        Country(countryName: "France", flag: "france", gdpValue: 3283),
        Country(countryName: "Italy", flag: "italy", gdpValue: 2460),
        Country(countryName: "Canada", flag: "canada", gdpValue: 2330),
        Country(countryName: "Brazil", flag: "brazil", gdpValue: 2307),
        Country(countryName: "Russia", flag: "russia", gdpValue: 2196),
        Country(countryName: "South korea", flag: "southkorea", gdpValue: 1947),
        Country(countryName: "Australia", flag: "australia", gdpValue: 1881),
        Country(countryName: "Spain", flag: "spain", gdpValue: 1828),
        Country(countryName: "Mexico", flag: "mexico", gdpValue: 1818),
        Country(countryName: "Indonesia", flag: "indonesia", gdpValue: 1493),
        Country(countryName: "Turkey", flag: "turkey", gdpValue: 1455),
        Country(countryName: "Netherlands", flag: "netherlands", gdpValue: 1273),
        Country(countryName: "Saudi Arabia", flag: "saudiarabia", gdpValue: 1137),
        Country(countryName: "Switzerland", flag: "switzerland", gdpValue: 1000),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gdpCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        gdpCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 10.0, bottom: 0, trailing: 10.0)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gdpCollectionView.dequeueReusableCell(withReuseIdentifier: ViewController.reuseIdentifier, for: indexPath) as! CountryCollectionViewCell
        
        let country = countries[indexPath.item]
        cell.updateCellData(with: country)
        
        return cell
    }
}


    
    
