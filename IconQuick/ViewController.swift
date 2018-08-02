//
//  ViewController.swift
//  IconQuick
//
//  Created by Jater on 2018/8/1.
//  Copyright © 2018年 Jater. All rights reserved.
//

import Cocoa
import Gzip

private let folderName = "folderOfIconFont";

class ViewController: NSViewController, URLSessionDownloadDelegate, URLSessionTaskDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchIconfontRequest();
        
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        
    }
    
    private func fetchIconfontRequest() {
        let urlString = URL(string: "http://www.iconfont.cn/api/project/download.zip?pid=510310&ctoken=MoSIYET3Yr9LnmoSvbSBicon-font")
        
        var request = URLRequest(url: urlString!)
        request.setValue("l=Aj09yrdI4Aop9A0125UwXUXBzZMib3Es; cna=B4hBELtR7WMCAWVRT9nZ6uk1; EGG_SESS=ntQ3oqO_GjlWwY_q2fFoFH8dcCacU2-YrDHrIfcCZuzHp3FTjqiS1bxegG9CxYHHFyhkBgv1LEC7j6MLRAt-Jdlhz8t_jkGuVgm7P7n6IlQmx7fjqOR_Y8KT1Us8XPoJs_AVNwyBxi49FlRq75bdOdGDp9q0E0w47OvRMn9aJ6bLcw4kfjP7zePE4-M15A2CowKOMgQC2O7ns3ioySogAnQbQLuKkTV2hsTpBhWta_ty58QIHcfUGlBbxSpwYGryr9Q3bXgx4fr3_WWuwlsbUySTIcKeUjmDySl9jgJEv6JaBbPfXPDUfCVliyE2nULekmkAuEkTC0icF-JXo8OqQ29rj-oyejl-HY3qiCXQXrwIWDK5F0fmdPXgQkO99U7PWlNJTe3EYYeu7WZb0cQu_cGrDYCuuEEtJX4oYCPPPhg6uwci8uo5ZEErAklVZLZeqk5pDO59x0QjE2_0xfCK2tc3lFtiA_T7H9Blm8VLLyRXX2r42t1qdE5JLbvb89thz8ahMIOXbOBUz4V-3Dq_Hm7Bx44rg58keK4I3ViHUV32c5jzgd9mYLzlNgTvf1tlm8oaLccbS-g6IFzgH8sLw40pVqCxAxuyW3taRpOKwr7lpRmbXcbT5uvSFYypLqxhTLE5NT7He3AMjCrDfI-JW5WkcUWWxftq7LjPJNhtcbcs1hDcwVXUxKnI7PDFanWpxSKJLuJdHSINig7ik2M6W9HWKNBk_w_Rs0AvFaOfnW-S7Igi4tX873UpZ4WcWo5ugWj-TE5LNI9qWkuZl0YyEpA9wHi10aq8i3j3cIBY0b57eptb-cvbPfIk6OZU0RQxk3LMwMc5wLMIQwISrmjMnDrt8nusncDxhyNX-SOKmw9NpSAmc7LdLsO_T8aRFftJa4KzTo1i-21rFIt09TIAVoLAiVUE5I76ZbTvlTx49uBy2MgadkpAI0Usrs094vR7xSEs_TX9fMvU_4H7SL2CIrgW_t-tavhSjzraO1ma2MRyVXZaVavCOFohzt3b2Bw5-RmwgNY6h-nmSFswR5Z80uEfSSIuJMkmFZ54qu6CDo3ba5jwZz0GJBn4Sg6kR7PISk7JvsN0SQrq2xoB_tYegzFwwJk0b266RJNr-M_dXGqdRxZLjKAOOqsCI09-ryh7tCkLgDT1ZcYfiZyAH9dcoKcC1PFuR2Dd01TpqxgpcGxz0cwGcq-tnA8TAWNbKz5E7j5caXqK22_DUHqLkPlHJQ==; UM_distinctid=1635e1665b410e1-0734223e6ed5d3-33677f06-384000-1635e1665b589f; CNZZDATA1000158776=114763835-1530169864-null%7C1530169864; trace=AQAAAF0Na3nefwkAHX1bcl2nQ5TKrLaK; ctoken=MoSIYET3Yr9LnmoSvbSBicon-font; EGG_SESS_ICONFONT=VLQuTuk75bH4bnn7K88Mnyu1P4aGul9wyts4SDjHEoOkwqdrDjBYi1curwm8rIecBhp_RVfrsrPANYcDP2dNPJ8sWxo0UTS9RFXqdgFqzobuHbkZhq_MfpWhHx4TvV1aHvpHvxeJH5gJ2sYcFjaxVVmYc9jOTgHQ-HAg8gZ0XLmZIlUy3HN17nt1kPeHHVuJREbK1MfiyENDmvNW9On1DvD09rnEfoD5IY_GQ_Y0_i4GNW1S8_CfYOJTMK5RdodfIeDFU0Jy3HCoRXriyQf-j1oZCvzrm8eZW3BG87aKLJXoVmJQYKY2heBcnkPOh3Mr5E40-_EHhDfpifze-fx3ueLtcnZUJmJaSF5W7774or8QU2fSdpA9GZAs4jUixkkul_zKn8zOVW0LBx5B-lwAnx9u0Fn3Ce8-0gGFkylhiEVyKBKBynCPesbZfhFV57V1Lp_mR8v_Xj_XkNkcIAXoHq4DHOfCfhdiex7_UWUOymlF9KK0-gDQzRs7pi1Iic8NZFHAbgMgRZ8BZWbM71VbkCvivt36bDwMhtKObrmDoSL3s-I2U1zA7mWlFcUxXE8IW9qDYYVdEZGlawoeI8QxSUzE4-BgMgDBo_DcmbAUWFiq2mmjkHmWWNFwxeyNTKxJ-DXS2pfTTEVvtc7J_EEshu1dMUeXjS_D4Ae4LkRdNPSyDRwofDgyGKPogNJl1Q_wihiPBi-mB1xjLdetcG3JTV2Idta6_anP7zdT1HgjIdEqCnz_t0kmKjEwMdAvM7XtlCtUQ7fhG7TjvtK2NJ7p9FMKPJWuC5qOK7BaFEUiWIishG_mfJUB_bOrVeKZFQBJjig9A9FBbnoAznz9ehHLDDjUesqFPMrRfiLK5CnJDf2hvNyllVq9R5Uqq-olGoje1xcq9JnmQRGgBOseGLAX6BM1Rn6Ca4-CdHm6G4dzxpTs3B3-T7pfPXSeHrFssOW4XEj1EPTXxb5BH4Y2MG2fCqgp5H1anjSaRYmO_qzkZjy6QUTl3dJVw0H5oRysj0eUB0d-Ka3QWlJpaGgTxL1OJs75Wg8TkyRps3D5T6BjghndacyXf53cW6rv6GPPqArfwc6HkYn_7B61Np1bDbfDnvnWE__sPOnsG49pcnaErGbTbAIoBleK9eESMGG4UyhYiM_RvbRXZiP1pJtNPGpFoXw2x0ePryQbOMg06KhaWqSt_DQ8QHnGKRBSNI3BHjfwF_GaDHWEnXjBFhPKOAKnWw==; u=623597; CNZZDATA1260547936=115375548-1494402681-%7C1533203059; isg=BMHBP-9cfnIpVpA2XTHnL8ZR0AsbRj7T-qfONyMW-EgnCuDcazzTsXuI6D7pAs0Y", forHTTPHeaderField: "Cookie")
        request.setValue("text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8", forHTTPHeaderField: "Accept")
        request.setValue("http://www.iconfont.cn/manage/index?spm=a313x.7781069.1998910419.11&manage_type=myprojects&projectId=213859&keyword=", forHTTPHeaderField: "Referer")
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.setValue("1", forHTTPHeaderField: "Upgrade-Insecure-Requests")
        
        let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main);
        
        let downloadTask = session.downloadTask(with: request)
        
        
        //    let downloadTask = session.downloadTask(with: request, completionHandler: { (location : URL?, urlResponse : URLResponse?, error: Error?) -> Void in
        //        if (error != nil) {
        //            print("error:/(error)")
        //            return
        //        }
        //        //输出原来的文件目录
        //        print("location:%@",location ?? "nil")
        //
        //
        //        let locationPath = location!.path
        //
        //        let fileManager = FileManager.default
        //
        //        let iconPath = getIconPath()
        //
        //        //如果没有此文件夹就创建一个
        //        try! fileManager.createDirectory(atPath: iconPath, withIntermediateDirectories: true, attributes: nil)
        //
        //        let toPath = getIconPath() + "/iconfont.tmp"
        
        //        let file = Bundle.main.path(forSoundResource: <#T##NSSound.Name#>)
        
        
        //        try! fileManager.moveItem(atPath: locationPath, toPath: toPath)
        //
        //        let origationData = try! NSData.init(contentsOfFile: toPath) as Data;
        //
        //
        //        let compressedData: Data = try! origationData.gunzipped()
        
        
        
        
        
        //    })
        
        //启动下载任务
        downloadTask.resume();
    }


    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
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
