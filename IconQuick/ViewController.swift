//
//  ViewController.swift
//  IconQuick
//
//  Created by Jater on 2018/8/1.
//  Copyright © 2018年 Jater. All rights reserved.
//

import Cocoa
import zlib
import Gzip

private let folderName = "folderOfIconFont";

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
    let urlString = URL(string: "http://www.iconfont.cn/api/project/download.zip?pid=510310&ctoken=MoSIYET3Yr9LnmoSvbSBicon-font")
    
    let request = URLRequest(url: urlString!)
    
    let session = URLSession.shared
    
    let downloadTask = session.downloadTask(with: request, completionHandler: { (location : URL?, urlResponse : URLResponse?, error: Error?) -> Void in
        if (error != nil) {
            print("error:/(error)")
            return
        }
        //输出原来的文件目录
        print("location:%@",location ?? "nil")
        
        
        let locationPath = location!.path
        
        let fileManager = FileManager.default

        let iconPath = getIconPath()
        
        //如果没有此文件夹就创建一个
        try! fileManager.createDirectory(atPath: iconPath, withIntermediateDirectories: true, attributes: nil)
        
        let toPath = getIconPath() + "/iconfont.tmp"
        try! fileManager.moveItem(atPath: locationPath, toPath: toPath)
        
        
        
    })
    
    //启动下载任务
    downloadTask.resume();
}

//获取用户桌面路径
func getIconPath() -> String {
    //找到mac 桌面路径
    let deskPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first;
    print("deskPath:", deskPath ?? "nil")
    
    //return icon path
    return (deskPath?.appending("/".appending(folderName)))!
}

//检查桌面是否存在iconfont folder
func checkFontFolder() -> Bool {
    let fileManager = FileManager.default
    var isDir : ObjCBool = false;
    let isExist = fileManager.fileExists(atPath: getIconPath(), isDirectory: &isDir)
    return isExist && isDir.boolValue;
}

func uncompressZippedData(compressedData: NSData) -> NSData {
    if (compressedData.length == 0) {
        return compressedData;
    }
    
    let full_length = compressedData.length;
    
    let half_length = compressedData.length / 2;
    var decompressed = NSMutableData.init(length: full_length + half_length)
    let done = false
    let status = 0
    var strm = z_stream.init()
    strm.next_in = compressedData.bytes;
    strm.avail_in = compressedData.length;
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    if (inflateInit2(&strm, (15+32)) != Z_OK) {
        return nil;
    }
    while (!done) {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= decompressed.length) {
            decompressed?.increaseLength(by: half_length)
        }
        // chadeltu 加了(Bytef *)
        strm.next_out = decompressed?.mutableBytes + strm.total_out;
        strm.avail_out = decompressed.length - strm.total_out;
        // Inflate another chunk.
        status = inflate (&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END) {
            done = true;
        } else if (status != Z_OK) {
            break;
        }
        
    }
    if (inflateEnd (&strm) != Z_OK) {
        return nil;
    }
    // Set real length.
    if (done) {
        decompressed?.length = strm.total_out
        return NSData.mutableCopy(decompressed)
    } else {
        return nil;
    }

}
