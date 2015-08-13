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
    var otherData = ["David", "Leonard"];
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
        return self.tableData.count + self.otherData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell;
        println(indexPath.row);
        
        if(indexPath.row % 2 == 0) {
            cell.streamTitleLabel.text = "even";
        }
        
        if(indexPath.row % 2 == 1) {
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
                }
            }
        }
        return cell;
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adNativeDidFetchAd(nativeAd: FlurryAdNative!) {
        var asset = nativeAd.assetList;
        self.tableData.append(asset);
        self.tableView.reloadData();
    }
    
}

