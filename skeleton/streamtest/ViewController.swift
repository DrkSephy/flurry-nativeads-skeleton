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
        return 2;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell;
        if(indexPath.row == 0) {
            cell.streamTitleLabel.text = "Creature -- Angel";
            cell.streamDescriptionLabel.font = UIFont.italicSystemFontOfSize(16);
            cell.streamDescriptionLabel.text = "Even the most battle-hardened soldiers pause in her presence for a moment of introspection.";
            cell.sponsoredImageView.image = nil;
            cell.streamImageView.image = UIImage(named: "card1")!;
            cell.streamSourceLabel.text = "Stoic Angel";
            cell.sponsoredText.text = "";
        }
        
        if(indexPath.row == 1) {
            cell.streamTitleLabel.text = "Artifact";
            cell.streamDescriptionLabel.font = UIFont.italicSystemFontOfSize(16);
            cell.streamDescriptionLabel.text = "Adds 3 mana of any single color of your choice to your mana pool, then is discarded. Tapping this artifact can be played as an interrupt.";
            cell.sponsoredImageView.image = nil;
            cell.streamImageView.image = UIImage(named: "card2")!;
            cell.streamSourceLabel.text = "Black Lotus";
            cell.sponsoredText.text = "";
        }
        
        return cell;
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

