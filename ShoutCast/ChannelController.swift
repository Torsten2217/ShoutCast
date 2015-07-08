//
//  ChannelController.swift
//  ShoutCast
//
//  Created by Dieter Kohl on 4/10/15.
//  Copyright (c) 2015 Dieter Kohl. All rights reserved.
//

import UIKit

protocol ChannelProtocol{
    func onChangeChannel(channel_id:String)
}

class ChannelController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView : UITableView!, numberOfRowsInSection section:Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell!{
    
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "StationList")
        let index = indexPath.row
        cell.textLabel!.text = "Test \(index)"
        
        return cell
        
    }
    
    //cell的点击事件
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ChannelList") as! ChannelListController
        self.presentViewController(secondViewController, animated: true,  completion: nil)
    }
    

    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
