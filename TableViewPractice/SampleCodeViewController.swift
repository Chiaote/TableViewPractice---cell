//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 倪僑德 on 2017/4/10.
//  Copyright © 2017年 Chiao. All rights reserved.
//

import UIKit

class SampleCodeViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource,UIGestureRecognizerDelegate {
    
    var tableView:UITableView?
    
    var ctrlnames:[String] = [ " UILabel標籤" , " UIButton按鈕" , " UIDatePiker日期選擇器" ,
                               " UITableView表格視圖" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 創建表視圖
        self.tableView = UITableView(frame:UIScreen.main.applicationFrame,
                                     style:UITableViewStyle .plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        // 創建一個重用的單元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: " SwiftCell " )
        self.view.addSubview(self.tableView! )
        
        // 綁定對長按的響應
        let longPress =   UILongPressGestureRecognizer(target:self,
                                                       action:Selector( " tableviewCellLongPressed: " ))
        // 代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        // 將長按手勢添加到需 實現長按操作的視圖裡
        self.tableView! .addGestureRecognizer(longPress)
    }
    
    // 在本例中，只有一個分區
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return  1 ;
    }
    
    // 返回表格行數（也就是返回控件數）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    // 創建各單元顯示內容(創建參數indexPath指定的單元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        // 為了提供表格顯示性能，已創建完成的單元需重複使用
        let identify:String = " SwiftCell "
        // 同一形式的單元格重複使用，在聲明時已註冊
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath as IndexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.ctrlnames[ indexPath.row]
        return cell
    }
    
    // 長按表格
    func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerState.ended)
        {
            print( " UIGestureRecognizerStateEnded " );
            //在正常狀態和編輯狀態之間切換
            if (self.tableView!.isEditing == false ){
                self.tableView!.setEditing( true , animated: true )
            }
            else {
                self.tableView!.setEditing ( false , animated: true )
            }
        }
    }
    
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
}
