//
//  WeaponsViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class WeaponsViewController: UIViewController {
    
    @IBOutlet weak var wTable: UITableView!
    
    var arrayWeapons : [Weapon] = []
    //    CGO Weapons
    let cgoWeapons : [Weapon] = [
        Weapon(
            id: 1, name: "weapon.name.lancer",
            description: "weapon.description.lancer",
            poster: "Mark1LancerAssaultRifle"
        ),
        Weapon(
            id: 2, name: "weapon.name.lancer2",
            description: "weapon.description.lancer2",
            poster: "LancerMk2"
        ),
        Weapon(
            id: 3, name: "weapon.name.sniper",
            description: "weapon.description.sniper",
            poster: "LongshotSniperRifle"
            
        ),
        Weapon(
            id: 4, name: "weapon.name.hammer_of_dawn",
            description: "weapon.description.hammer_of_dawn",
            poster: "HammerOfDawn"
        ),
        Weapon(
            id: 5, name: "weapon.name.mx8",
            description: "weapon.description.mx8",
            poster: "SnubPistol"
        )
    ]
    
    //    Locus Weapons
    let locusWeapons : [Weapon] = [
        Weapon(
            id: 1, name: "weapon.name.boomshot",
            description: "weapon.description.boomshot",
            poster: "BoomshotGrenadeLauncher"
        ),
        Weapon(
            id: 2, name: "weapon.name.hammerburstii",
            description: "weapon.description.hammerburstii",
            poster: "HammerburstII"
        ),
        Weapon(
            id: 3, name: "weapon.name.mulcher",
            description: "weapon.description.mulcher",
            poster: "Mulcher"
        ),
        Weapon(
            id: 4, name: "weapon.name.bolo_grenade",
            description: "weapon.description.bolo_grenade",
            poster: "BoloGrenade"
        ),
        Weapon(
            id: 5, name: "weapon.name.boltok",
            description: "weapon.description.boltok",
            poster: "BoltokPistol"
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wTable.dataSource = self
        wTable.delegate = self
        
        let tabItem = self.tabBarItem.tag
        if tabItem == Constants.tagCGO {
            arrayWeapons = cgoWeapons
        } else if tabItem == Constants.tagLocus {
            arrayWeapons = locusWeapons
        } else {
            print("Error")
        }
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

extension WeaponsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWeapons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWeapons", for: indexPath) as! WeaponsCell
        let weapons = arrayWeapons[indexPath.row]
        cell.wName.text = NSLocalizedString(weapons.name, comment: "")
        cell.wImage.image = UIImage(named: weapons.poster)
        cell.wDesc.text = weapons.description.localized
        
        return cell
    }
}
