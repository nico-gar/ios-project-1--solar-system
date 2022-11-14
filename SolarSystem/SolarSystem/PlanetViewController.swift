//
//  PlanetViewController.swift
//  SolarSystem
//
//  Created by Nicolas Garaycochea on 11/12/22.
//

import UIKit

class PlanetViewController: UITableViewController {
    let backgroundView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Solar System"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.white
        print("load successful")
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            tableView.reloadData()
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return PlanetController.shared.planets.count
  
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath)
        // new defaultContentConfiguration() format start
        
        let planet = PlanetController.shared.planets[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        
        content.text = planet.name
        content.secondaryText = planet.planetType
        content.image = UIImage(systemName: (planet.favorite) ? "circle.fill": "circle")
      
        content.textProperties.color = .label
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        content.textToSecondaryTextVerticalPadding = 4

        content.secondaryTextProperties.color = .secondaryLabel
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .subheadline)

        content.imageProperties.tintColor = .systemPurple
        content.imageToTextPadding = 16
        
        backgroundView.backgroundColor = UIColor.systemGray6
        cell.selectedBackgroundView = backgroundView


        cell.contentConfiguration = content
//
        return cell
        
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlanetDetailSegue"{
            
            guard let destinationVC = segue.destination as? PlanetDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let planet = PlanetController.shared.planets[indexPath.row]
            
            destinationVC.planet = planet
        }
    }
}
