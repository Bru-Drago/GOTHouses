//
//  ServiceManager.swift
//  GOTHouses
//
//  Created by Bruna Fernanda Drago on 05/10/20.
//

import Foundation

class ServiceManager {
    
    static let shared = ServiceManager()
    let baseURL = "https://www.anapioficeandfire.com/api/houses"
    private init () {}
    
    func getHouses(page:Int ,completion: @escaping ([HousesData]?,String?)->Void){
        
        guard let url = URL(string: baseURL)else {
            completion(nil,"Erro URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(nil,"Erro encontrado")
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completion(nil,"Erro na resposta")
                return
            }
            guard let data = data else {
                completion(nil,"erro nos dados")
                return
            }
            do {
                let decoder = JSONDecoder()
                let houses = try decoder.decode([HousesData].self, from: data)
                print(houses)
                completion(houses,nil)
            }catch{
                completion(nil,"Erro no json")
            }
        }
        task.resume()
        
    }
    
}
