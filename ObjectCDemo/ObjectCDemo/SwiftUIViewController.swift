//
//  SwiftUIViewController.swift
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/13/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

import UIKit

class SwiftUIViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var mainTableView: UITableView!
    var items       : NSArray?
    override func viewDidLoad() {
        self.title = "swift"
        self.view.backgroundColor = UIColor.whiteColor();
         self.items = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView", "UICollectionView"]
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("swiftUIcell", forIndexPath: indexPath);
        cell.textLabel?.text = self.items?.objectAtIndex(indexPath.row) as?String;
        return cell;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(self.items?.objectAtIndex(indexPath.row));
    }
    
}
