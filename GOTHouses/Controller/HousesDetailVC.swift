//
//  HousesDetailVC.swift
//  GOTHouses
//
//  Created by Bruna Fernanda Drago on 06/10/20.
//

import UIKit

class HousesDetailVC: UIViewController {
    
    @IBOutlet weak var houseNameLbl: UILabel!
    
    @IBOutlet weak var regionLbl: UILabel!
    
    @IBOutlet weak var wordsLbl: UILabel!
    
    
    var house : HousesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        houseNameLbl.text = house?.name
        regionLbl.text = house?.region
        wordsLbl.text = house?.words
        
    }


}
