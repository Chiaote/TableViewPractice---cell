//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 倪僑德 on 2017/4/10.
//  Copyright © 2017年 Chiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var testTableView: UITableView!
    
    var testListArray = ["1","2","3","4","5","6"]
    var testNameArray = ["a","b","c","d","e","f"]
    var cellIsExpandableSetting = [false,true,false,true,false,true]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定一個長壓啟動的手勢識別, 簽署delegate, 並且設定長壓讓其啟動的秒數為至少1秒
        var longPress = UILongPressGestureRecognizer(target: self, action: #selector(cellEditTypeChange(gestureRecognizer:)))
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        longPress.delegate = self
        
        //將手勢識別加入到Table中
        testTableView.addGestureRecognizer(longPress)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //設定tableView的section內的row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testListArray.count
    }
    
    //產生cell畫面
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CustomerCell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath) as! CustomerCell
        cell.nameOfRankingList.text = testNameArray[indexPath.row]
        cell.numberOfRankingList.text = testListArray[indexPath.row]
        
        return cell
    }
    
    //設定方手勢觸發的動作, 該func要帶入觸發的物件作為參數
    func cellEditTypeChange (gestureRecognizer:UILongPressGestureRecognizer) {
        //如果長壓的動作結束, 改變cell現在編輯狀態
        if gestureRecognizer.state == UIGestureRecognizerState.ended {
            
            if (testTableView.isEditing != true) {
                testTableView.setEditing(true, animated: true)
            } else {
                testTableView.setEditing(false, animated: true)
            }
        }
    }
    
    //設定哪些列可以被移動
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        //如果希望固定特定列, 請於這邊設定
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        if sourceIndexPath != destinationIndexPath {
//            var
//        }
    }
    
    
    
    
    
    
    
    
}
