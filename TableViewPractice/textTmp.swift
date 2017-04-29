//
//  textTmp.swift
//  TableViewPractice
//
//  Created by 倪僑德 on 2017/4/21.
//  Copyright © 2017年 Chiao. All rights reserved.
//

import Foundation


/*
 
 筆記：

//  1)
//  viewDidLoad:
    // 綁定對長按的響應
    var longPress =   UILongPressGestureRecognizer(target:self,
                                                   action:Selector( " tableviewCellLongPressed: " ))
        
//      |
//      v
    //說明： 當長按時執行以下動作
    //1.如果未編輯, setEditing = true
    //1.如果在編輯, setEditing = false
    func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.ended) {
            print( " UIGestureRecognizerStateEnded " );
        
            //在正常狀態和編輯狀態之間切換
            if (self.tableView!.isEditing == false ) {
                self.tableView!.setEditing( true , animated: true )
            }
            else {
                self.tableView!.setEditing ( false , animated: true )
            }
        }
    }
 
//      |
//      v
 
    // 1. 簽delegate:
            longPress.delegate = self

    // 2. 設定長壓啟動時間：
            longPress.minimumPressDuration = 1.0
 
    // 3. 將長按手勢加到畫面中：
            self.tableView! .addGestureRecognizer(longPress)
 
------------------------------------------------------
//2)
// 撰寫canMoveRowAtIndexPath與moveRowAtIndexPath

// 在編輯狀態，可以拖動設置cell位置
func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return  true
}
 
// 移動cell事件
func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath,
               toIndexPath: NSIndexPath) {
    if fromIndexPath != toIndexPath{
        // 獲取移動行對應的值並刪除移動的值
        var itemValue:String = ctrlnames.remove(at: fromIndexPath.row)
        // 如果移動區域大於現有行數，直接在最後添加移動的值
        if toIndexPath.row > ctrlnames.count{
            ctrlnames.append(itemValue)
        } else {
            // 沒有超過最大行數，則在目標位置添加剛才刪除的值
            ctrlnames.insert(itemValue, at:toIndexPath.row)
        }
    }
}
//其中ctrlnames是一個設定的字串陣列, 用於顯示在各個cell上

------------------------------------------------------


*/





 
