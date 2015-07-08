//
//  ViewController.swift
//  ShoutCast
//
//  Created by Dieter Kohl on 4/10/15.
//  Copyright (c) 2015 Dieter Kohl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HttpProtocol {

    @IBOutlet weak var iv: UIImageView!
    
 
    @IBOutlet weak var volToolbar: UIToolbar!
  
    
    @IBOutlet weak var volumeSlader: UISlider!
    
    @IBOutlet weak var playPause: UIBarButtonItem!
    
    var streamController:FSAudioController?
    
    var newBotton : UIBarButtonItem?
    
 
    @IBAction func playAndPause(sender: AnyObject) {
        
        if streamController!.isPlaying() {
            streamController!.stop()
            
            newBotton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playAndPause:")
        }
        else
        {
            
            self.streamController?.url = NSURL(string:"http://8723.live.streamtheworld.com:443/KXNTAM_SC")
            self.streamController?.play()
            newBotton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "playAndPause:")
        }
        
        var items = self.volToolbar.items
        items?[3] = newBotton!
        self.volToolbar.setItems(items, animated: true)
    }
    
    
    @IBAction func volumeChanged(sender: AnyObject) {
        
        streamController?.volume = self.volumeSlader.value
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(streamController == nil)
        {
            streamController = FSAudioController()
            volumeSlader.value = 0.5
            streamController!.stop()
            
            newBotton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playAndPause:")
        }
 
    }
    
    override func viewDidDisappear(animated: Bool){
        super.viewDidDisappear(animated)
        if(streamController != nil)
        {
            streamController!.stop()
            streamController = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Implemete HttpProtocol protocol method
    
    func didRecieveResults(results:NSDictionary){
        
    
    }
    
    func initListData(){
    
    
    }
    
    
    
    
}

