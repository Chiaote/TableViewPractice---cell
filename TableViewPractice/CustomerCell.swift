//
//  CustomerCell.swift
//  TableViewPractice
//
//  Created by 倪僑德 on 2017/4/10.
//  Copyright © 2017年 Chiao. All rights reserved.
//

import Foundation
import UIKit

public class CustomerCell : UITableViewCell {
    @IBOutlet weak var numberOfRankingList: UILabel!
    @IBOutlet weak var nameOfRankingList: UILabel!
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    //繼承table壹定要override的function
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
