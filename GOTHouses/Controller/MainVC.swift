//
//  ViewController.swift
//  GOTHouses
//
//  Created by Bruna Fernanda Drago on 05/10/20.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var gotView: UIView!
    @IBOutlet weak var gotTableView: UITableView!
    
    var houses : [HousesData] = []
    var page   : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gotTableView.delegate   = self
        gotTableView.dataSource = self
        
        callGetHouses(page: page)
        
    }
    func callGetHouses(page:Int){
        ServiceManager.shared.getHouses(page: page) { (houses, erroMsg) in
            guard let houses = houses else {
                print("erro VC")
                return
            }
            self.houses = houses
            DispatchQueue.main.async{
                self.gotTableView.reloadData()
            }
        }
    }

}
extension MainVC : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = gotTableView.dequeueReusableCell(withIdentifier: "GotCell", for: indexPath) as! GotCell
        cell.houseLbl.text = houses[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = houses[indexPath.row]
        performSegue(withIdentifier: "goToHouses", sender: house)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HousesDetailVC{
            destination.house = sender as? HousesData
        }
    }
    
    
}
