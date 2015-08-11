//
//  ViewController.swift
//  streamtest
//
//  Created by David Leonard on 8/10/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    var tableData: [AnyObject] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register custom cell
        var nib = UINib(nibName: "vwTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell;
        
        return cell;
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

