//
//  HomeModel.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 23/02/23.
//

import UIKit

class HomeModel{
    
    var homeArr = [Home]()
    
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
                        let obj = Home(item)
                        homeArr.append(obj)
                    }
                }
            } catch {
                print("Error on parsing!")
            }
        }
    }
    
}
class Home{
    var name: String?
    var rank: String?
    var img: String?
    var type: String?
    var loc: String?
    var desc: String?
    var flag: String?
    var locImg: String?
    var rating: String?
    
    init(_ dict: [String: AnyObject]) {
        self.name = dict["name"] as! String?
        self.rank = dict["rank"] as! String?
        self.img = dict["img"] as! String?
        self.type = dict["type"] as! String?
        self.loc = dict["loc"] as! String?
        self.desc = dict["desc"] as! String?
        self.flag = dict["flag"] as! String?
        self.locImg = dict["locImg"] as! String?
        self.rating = dict["rating"] as! String?
    }
}


