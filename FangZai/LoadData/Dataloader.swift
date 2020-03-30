//
//  Dataloader.swift
//  FangZai
//
//  Created by ktrade on 2020/3/17.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation

import Foundation

public class DataLoader {
    
     var userData = [UserData]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort() {
        self.userData = self.userData.sorted(by: { $0.customer_id < $1.customer_id })
    }
}
