//
//  ViewController.swift
//  IconQuick
//
//  Created by Jater on 2018/8/1.
//  Copyright © 2018年 Jater. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchIconfontRequest();
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

private func fetchIconfontRequest() {
    let urlString = URL(string: "http://www.iconfont.cn/api/project/download.zip?pid=510310&ctoken=MoSIYET3Yr9LnmoSvbSBicon-font");
    
    let request = URLRequest(url: urlString!);
    
    let session = URLSession.shared;
    
    let downloadTask = session.downloadTask(with: request, completionHandler: {(location : URL?, urlResponse : URLResponse?, error: Error?) -> Void in
        if (error != nil) {
            print("error:/(error)");
            return;
        }
        //输出原来的文件目录
        print("location:%@",location!);
        
        
        let locationPath = location!.path;
        
        //在桌面上创建一个文件夹存放文件
        let fileManager = FileManager.default;
        
        //获取mac 桌面路径
        let resourcePath = Bundle.main.resourcePath;
        
        
        
        
        
        
    });
    
    //启动下载任务
    downloadTask.resume();
    
    
    
    
    
    
    
}

