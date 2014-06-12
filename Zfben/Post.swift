//
//  Post.swift
//  Zfben
//
//  Created by Ben on 2014-06-11.
//  Copyright (c) 2014 Ben. All rights reserved.
//

import Foundation

struct Post{
  var title = ""
  var content = ""
  var link = ""
}

class PostData:NSObject{
  var list = Post[]()
  var data = ONOXMLDocument()
  var todayIndex = 0
  
  func fromXML(xml:NSString, encoding:NSStringEncoding){
    self.list = Post[]()
    self.data = ONOXMLDocument.XMLDocumentWithString(xml, encoding: encoding, error: nil)
    self.data.enumerateElementsWithXPath("//item", usingBlock: appendFromXML)
  }

  func appendFromXML(element:ONOXMLElement!, idx:Int, stop:CMutablePointer<ObjCBool>!){
    self.append(element.firstChildWithTag("title").stringValue(), content: element.firstChildWithTag("description").stringValue(), link: element.firstChildWithTag("link").stringValue())
  }

  func append(title:NSString, content:NSString, link:NSString){
    self.list.append(Post(title: title, content: content, link: link))
  }
  
  func today() -> Post {
    return self[self.todayIndex]
  }

  subscript(index:Int) -> Post {
    if(list.count > index){
      return self.list[index]
    }else{
      return Post()
    }
  }
}

var posts = PostData()