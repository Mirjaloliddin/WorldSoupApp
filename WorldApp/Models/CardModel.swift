//
//  CardModel.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit

class CardModel{
    
    var cardArr = [Card]()
    
    init() {
        pars()
    }
    func pars(){
        guard let path = Bundle.main.path(forResource: "breads", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url){
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:AnyObject]]{
                    for item in json {
                        let obj = Card(item)
                        cardArr.append(obj)
                    }
                }
            } catch {
                print("Error on parsing!")
            }
        }
    }
}

class Card{
    var name: String?
    var type: String?
    var img: String?
    var locImg: String?
    
    init(_ dict: [String: AnyObject]) {
        self.name = dict["name"] as! String?
        self.type = dict["type"] as! String?
        self.img = dict["img"] as! String?
        self.locImg = dict["locImg"] as! String?
    }
}
