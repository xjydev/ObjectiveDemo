//
//  SwiftUIViewController.swift
//  ObjectCDemo
//
//  Created by XiaoJingYuan on 7/13/16.
//  Copyright © 2016 XiaoJingYuan. All rights reserved.
//

import UIKit
//?代表声明的是Optional类型，而不是特定的值。执行的时候如果是Optional.None，会跳过后面的操作不执行，如果有值，就是Optional.Some，可能就会拆包(unwrap)，然后对拆包后的值执行后面的操作，来保证执行这个操作的安全性
//！声明的时候数据必须是特定类型。执行的时候强拆包，并执行后面的操作，如果是Optional.None就crash。
class SwiftUIViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var mainTableView: UITableView!
    var items       : NSArray?
    override func viewDidLoad() {
        self.title = "swift"
        mainTableView.backgroundColor = UIColor.red;
        self.view.backgroundColor = UIColor.white;
         self.items = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView", "UICollectionView"]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "swiftUIcell", for: indexPath);
        cell.textLabel?.text = self.items?.object(at: (indexPath as NSIndexPath).row) as?String;
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.items?.object(at: (indexPath as NSIndexPath).row));
    }
    
}
