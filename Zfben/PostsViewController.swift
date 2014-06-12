//
//  PostsViewController.swift
//  Zfben
//
//  Created by Ben on 2014-06-11.
//  Copyright (c) 2014 Ben. All rights reserved.
//

import UIKit

class PostsViewController : UITableViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var tblPosts:UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
    return posts.list.count
  }
  
  override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Unkown")
    cell.text = posts.list[indexPath.row].title
    return cell
  }
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
    posts.todayIndex = indexPath.row
    self.navigationController.popViewControllerAnimated(true)
  }
}