//
//  MerchViewController.swift
//  GOW
//
//  Created by Edgar Michael Pérez Valdez on 12/03/25.
//

import UIKit

class MerchViewController: UIViewController {
    
    @IBOutlet weak var tableMerch: UITableView!    
    let merch : [Merch] = [
        Merch(id: 0, name: "Poster", price: 100.00),
        Merch(id: 1, name: "Sweater", price: 200.00),
        Merch(id: 2, name: "Shirt", price: 300.00)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableMerch.delegate = self
        tableMerch.dataSource = self
        // Do any additional setup after loading the view.
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

extension MerchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return merch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "merchCell", for: indexPath) as! MerchandiseTableViewCell
        cell.imageviewMerch.image = UIImage(named: "merch\(merch[indexPath.row].id)")
        cell.labelMerch.text = merch[indexPath.row].name
        return cell
    }
}
