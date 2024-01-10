//
//  PriorityCell.swift
//  To Do List Project
//
//  Created by BS1098 on 9/1/24.
//

import UIKit

class PriorityCellViewController: UICollectionViewCell {
    
    @IBOutlet var priorityLevel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundColor(selected: false)
        
        priorityLevel.alpha = 0.0
    }
    
    func setBackgroundColor(selected: Bool) {
        if selected {
            let whiteView = UIView(frame: bounds)
            whiteView.backgroundColor = .white
            self.backgroundView = whiteView
        } else {
            let grayView = UIView(frame: bounds)
            grayView.backgroundColor = .gray
            self.backgroundView = grayView
        }
    }
    
    func showIcon() {
        self.priorityLevel.alpha = 1.0
    }
    
    func hideIcon() {
        self.priorityLevel.alpha = 0.0
    }
}
