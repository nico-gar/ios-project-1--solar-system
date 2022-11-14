//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Nicolas Garaycochea on 11/13/22.
//

import UIKit

class PlanetDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet var planetImageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var planetDescription: UILabel!
    @IBOutlet var orderNumber: UILabel!
    @IBOutlet var orderSuffix: UILabel!
    @IBOutlet var detailCollectionViewCell: UICollectionView!
    @IBOutlet var favoriteButton: UIBarButtonItem!
    
    var planet : Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        detailCollectionViewCell.delegate = self
        detailCollectionViewCell.dataSource = self
        favoriteButton.tintColor = .systemPurple

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell()}

        cell.imageView.alpha = 0.5
        cell.imageView.image = UIImage(systemName: "globe")


        //
        guard let planet = planet else { return UICollectionViewCell() }

                switch indexPath.item {
                case 0:
                    cell.titleLabel.text = "Day Length"
                    cell.detailLabel.text = "\(planet.dayLengthInDays) days"

                case 1:
                    cell.titleLabel.text = "Year Length"
                    cell.detailLabel.text = "\(planet.yearLengthInDays) days"

                case 2:
                    cell.titleLabel.text = "Radius"
                    cell.detailLabel.text = "\(planet.radiusInMiles) miles"

                case 3:
                    cell.titleLabel.text = "Moon Count"
                    cell.detailLabel.text = "\(planet.moonCount)"

                case 4:
                    cell.titleLabel.text = "Ring Count"
                    cell.detailLabel.text = "\(planet.ringCount)"

                case 5:
                    cell.titleLabel.text = "Plant Type"
                    cell.detailLabel.text = "\(planet.planetType)"

                case 6:
                    cell.titleLabel.text = "Distance from Sun"
                    cell.detailLabel.text = "\(planet.distanceFromSun) AU"

                case 7:
                    cell.titleLabel.text = "Galaxy"
                    cell.detailLabel.text = "Milky Way"

                default:
                    break
                }
        return cell
    }
    
    func updateViews() {
        
        guard let planet = planet else {return}
        
        name.text = planet.name
        orderNumber.text = "\(planet.orderNumber)"
        orderSuffix.text = orderSuffix(order: planet.orderNumber)
        planetImageView.image = UIImage(named: planet.imageName)
        planetDescription.text = planet.planetDescription
        }
    
    func orderSuffix(order: Int) -> String {
        switch  order {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        case 4, 5, 6, 7, 8:
            return "th"
        default:
            return ""
        }
    }
    
    func updateFavoriteStatus() {
        guard let planet = planet else {
            return
        }
        favoriteButton.image = UIImage(systemName: planet.favorite ? "star.circle.fill" : "star.circle")
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let planet = planet else {
            return
        }
        PlanetController.shared.updateFavorite(planet: planet)
        updateFavoriteStatus()
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
