//
//  ViewController.swift
//  streamtest
//
//  Created by David Leonard on 8/10/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FlurryAdNativeDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    var tableData: [AnyObject] = [];
    let nativeAd = FlurryAdNative(space: "streamy");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register custom cell
        var nib = UINib(nibName: "vwTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell");
        
        nativeAd.adDelegate = self;
        nativeAd.viewControllerForPresentation = self;
        nativeAd.fetchAd();
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell;
        
        
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
            if(self.tableData.count > 0) {
                for var index = 0; index < self.tableData[0].count; index++ {
                    var newAsset: AnyObject = self.tableData[0][index];
                    
                    if (newAsset.name == "headline") {
                        cell.streamTitleLabel.text = newAsset.value;
                    }
                    
                    if (newAsset.name == "summary") {
                        cell.streamDescriptionLabel.text = newAsset.value;
                    }
                    
                    if(newAsset.name == "secHqImage") {
                        let url: NSURL? = NSURL(string: newAsset.value!!);
                        if let actualURL = url {
                            let imageData = NSData(contentsOfURL: actualURL);
                            if let actualImageData = imageData {
                                cell.streamImageView.image = UIImage(data: actualImageData);
                            }
                        }
                    }
                    
                    if(newAsset.name == "secHqBrandingLogo") {
                        let url: NSURL? = NSURL(string: newAsset.value!!);
                        if let actualURL = url {
                            let imageData = NSData(contentsOfURL: actualURL);
                            if let actualImageData = imageData {
                                cell.sponsoredImageView.image = UIImage(data: actualImageData);
                            }
                        }
                    }
                    
                    if (newAsset.name == "source") {
                        cell.streamSourceLabel.text = newAsset.value;
                    }
                    
                    cell.sponsoredText.text = "sponsored";
                }
            }
        }
        
        if(indexPath.row == 2) {
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
    }
    
    func adNativeDidFetchAd(nativeAd: FlurryAdNative!) {
        var asset = nativeAd.assetList;
        self.tableData.append(asset);
        self.tableView.reloadData();
    }
}

