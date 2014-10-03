//
//  ViewController.swift
//  SwiftSideMenu
//
//  Created by Evgeny on 03.08.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, SingletonDelegate {
    
    // IBOutlets/IBActions
    @IBOutlet var NewsTableView : UITableView?
    
    
    // Variables
    var tableData: NSMutableArray = Singleton.sharedInstance.bears

    
    override func viewDidLoad() {
        
        // Set singleton delegate to self
        Singleton.sharedInstance.delegate = self
        ConnectionManager.getBears()

        
        super.viewDidLoad()
        var menuButton: UIBarButtonItem = UIBarButtonItem(title: "Add Element", style: UIBarButtonItemStyle.Plain, target: self, action:Selector("addElement"))
        self.parentViewController?.navigationItem.rightBarButtonItem = menuButton

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "protoCell")
        var rowData: Bear = self.tableData[indexPath.row] as Bear

        cell.textLabel?.text = rowData.name
        cell.detailTextLabel?.text = rowData._id! + "\(rowData.__v)"
        return cell;

    }
    
    // Protocol Functions
    
    func didGetBears() {
        var bearsArray:NSMutableArray = Singleton.sharedInstance.bears
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = bearsArray
            
            self.NewsTableView?.reloadData()
        })

    }
    
    // Display a UIAlert
    
    func addElement() {
        
        var alert = UIAlertController(title: "Add Element", message: "Please", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Bear Name:"
        })
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { action in
            var textField:UITextField = alert.textFields?.first! as UITextField
            ConnectionManager.addBear(textField.text)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
            switch action.style{
            case .Default:
                println("default")
                
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
}
    
    
    
 
    
    
    deinit {
        NSLog("ViewController1 deinits")
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }

}

