//
//  PlanetViewController.swift
//  SolarSystem
//
//  Created by Nicolas Garaycochea on 11/12/22.
//

import UIKit

class PlanetViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView(<#T##tableView: UITableView##UITableView#>, titleForHeaderInSection: <#T##Int#>)
        print("PlanetViewController loaded successfully!")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return PlanetController.planets.count
  
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //

        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let planet = PlanetController.planets[indexPath.row]
        content.text = planet.name
        content.secondaryText = planet.planetType
        content.image = UIImage(systemName: "circle")

        let backgroundView = UIView()

        backgroundView.backgroundColor = UIColor.systemGray6

        cell.selectedBackgroundView = backgroundView

        content.textProperties.color = .label
                content.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
                content.textToSecondaryTextVerticalPadding = 4

        content.secondaryTextProperties.color = .secondaryLabel
                content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .subheadline)

        content.imageProperties.tintColor = .systemPurple
                content.imageToTextPadding = 16

        cell.contentConfiguration = content

        return cell
        
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
