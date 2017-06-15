//
//  DataProvider.swift
//  expandTableview
//
//  Created by iOS Freak on 03/05/17.
//  Copyright © 2017 iOS Freak. All rights reserved.
//

import Foundation


class Provider {
    
    var currentList: [DataItem] = []
    
    static let shared = Provider()
    
    func addDataItem(withTitle title: String, list:[String]) {
        let item = DataItem(title: title, list: list)
        self.currentList.append(item)
    }
    
    func ideaListItems() -> [DataItem] {
        let result = self.currentList.map({$0})
        return result
    }
}
