//
//  DataItem.swift
//  expandTableview
//
//  Created by iOS Freak on 03/05/17.
//  Copyright © 2017 iOS Freak. All rights reserved.
//

import Foundation

struct  DataItem: Equatable {
    var isExpand: Bool = false
    var title: String
    var dataList:[String] = []
    
    init(isExpand:Bool = false, title:String, list:[String]) {
        self.isExpand = isExpand
        self.title = title
        self.dataList = list
    }
}

func ==(lhs: DataItem, rhs: DataItem) -> Bool {
    return lhs.title == rhs.title
}

