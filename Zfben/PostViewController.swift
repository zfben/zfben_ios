//
//  SecondViewController.swift
//  Zfben
//
//  Created by Ben on 2014-06-09.
//  Copyright (c) 2014 Ben. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIWebViewDelegate {
  @IBOutlet var activityPost : UIActivityIndicatorView = nil
  @IBOutlet var webContent : UIWebView = nil
  @IBOutlet var navitemTitle : UINavigationItem = nil
  @IBOutlet var btnMore : UIBarButtonItem = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    self.automaticallyAdjustsScrollViewInsets = false
    let request = NSURLRequest(URL: NSURL.URLWithString("http://zfben.com/feed"))
    let operation = AFHTTPRequestOperation(request: request)
    operation.setCompletionBlockWithSuccess(successBlock, failure: errorBlock)
    operation.start()
    webContent.delegate = self
  }
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
      var frame = webContent.layer.frame
      frame.origin.y = 50
      frame.size.height = 200
      webContent.frame = frame
    }
  }

  override func viewDidAppear(animated: Bool){
    showToday()
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
      didRotateFromInterfaceOrientation(self.interfaceOrientation)
    }
  }

  func showToday(){
    if posts.list.count > posts.todayIndex {
      navitemTitle.title = posts.today().title
      webContent.loadHTMLString("", baseURL: nil)
      webContent.loadHTMLString("<style>body{overflow-x:hidden;margin:0;padding:0;-webkit-text-size-adjust:none;}img{max-width:100%}</style><body>" + posts.today().content + "</body>", baseURL: NSURL(string: "http://zfben.com"))
    }
  }

  func successBlock(request:AFHTTPRequestOperation!, data:AnyObject!) {
    posts.fromXML(request.responseString, encoding: request.responseStringEncoding)
    showToday()
    btnMore.enabled = true
  }

  func errorBlock(request:AFHTTPRequestOperation!, error:NSError!) {
  }
  
  func webViewDidFinishLoad(webView: UIWebView!){
    activityPost.hidden = true
    webView.hidden = false
  }
}