//
//  ViewController.swift
//  expandTableview
//
//  Created by iOS Freak on 03/05/17.
//  Copyright © 2017 iOS Freak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var currentList = [DataItem]()
    var selectedItem: DataItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "Header", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        
        Provider.shared.addDataItem(withTitle: "Apple", list: ["a","a1","a2","a3","a4"])
        Provider.shared.addDataItem(withTitle: "Ball",  list: ["b","b1","b2","b3"])
        Provider.shared.addDataItem(withTitle: "Cat",  list: ["a","a1","a2","a3"])
        Provider.shared.addDataItem(withTitle: "Dog",  list: ["a","a1","a2","a3"])
        Provider.shared.addDataItem(withTitle: "Heart",  list: ["h","h1","h2","h3"])
        Provider.shared.addDataItem(withTitle: "God",  list: ["g","g1","g2","g3","g4","g5","g6"])
        
        self.currentList = Provider.shared.ideaListItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.       
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.currentList[indexPath.section].isExpand
        if item == true {
            return UITableView.automaticDimension
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.currentList[indexPath.section].isExpand
        if item == true {
            return UITableView.automaticDimension
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! CustomHeaderView
        headerView.headerTitle.text = self.currentList[section].title
        headerView.sectionNumber = section
        headerView.delegate = self
        return headerView
    }

}

extension ViewController: CustomeHeaderViewDelegate {
    func headerViewTap(_ section: Int) {
        self.selectedItem = self.currentList[section]
        let output = self.currentList.map({ (item:DataItem) -> DataItem in
            var result:DataItem
            result = item
            if result.title == self.selectedItem?.title && result.isExpand == false {
                result.isExpand = true
            } else {
                result.isExpand = false
            }
            return result
        })
        self.currentList = output
        self.tableView.beginUpdates()
        self.tableView.reloadSections(IndexSet(integer: section), with: UITableView.RowAnimation.automatic)
        self.tableView.endUpdates()
    }
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.currentList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = self.currentList[section] as DataItem
        return item.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.currentList[indexPath.section].dataList[indexPath.row]
        return cell
    }
}
