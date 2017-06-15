//
//  CustomHeaderView.swift
//  expandTableview
//
//  Created by iOS Freak on 04/05/17.
//  Copyright © 2017 iOS Freak. All rights reserved.
//

import Foundation
import UIKit

protocol CustomeHeaderViewDelegate: class {
    func headerViewTap(_ section: Int)
}

class CustomHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var button:UIButton!
    
    weak var delegate: CustomeHeaderViewDelegate?
    
    var sectionNumber: Int!  // you don't have to do this, but it can be useful to have reference back to the section number so that when you tap on a button, you know which section you came from

     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CustomHeaderView.tableViewSectionTapped(_:)))
        self.addGestureRecognizer(gesture)
        let backgroundView = UIView(frame: self.bounds)
        backgroundView.backgroundColor = UIColor.red
        self.backgroundView = backgroundView
    }

    func tableViewSectionTapped(_ gesture: UIGestureRecognizer) {
        delegate?.headerViewTap(self.sectionNumber)
    }
}
