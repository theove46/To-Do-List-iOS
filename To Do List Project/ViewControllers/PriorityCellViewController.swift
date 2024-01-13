//
//  PriorityCell.swift
//  To Do List Project
//
//  Created by BS1098 on 9/1/24.
//

import UIKit

class PriorityCellViewController: UICollectionViewCell {
    
    @IBOutlet var priorityLevel: UIButton!
    
    var state: Bool = false
    
    @IBAction func didTap(_ sender: UIButton) {
        state.toggle()
        setBackgroundColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        
        if state {
            let whiteView = UIView(frame: bounds)
            whiteView.backgroundColor = .white
            self.backgroundView = whiteView
            priorityLevel.setTitleColor(.gray, for: .normal)
        } else {
            let grayView = UIView(frame: bounds)
            grayView.backgroundColor = .gray
            self.backgroundView = grayView
            priorityLevel.setTitleColor(.white, for: .normal)
        }
    }
    
    func showIcon() {
        self.priorityLevel.alpha = 1.0
    }
    
    func hideIcon() {
        self.priorityLevel.alpha = 0.0
    }
    
    override func select(_ sender: Any?) {
        setBackgroundColor()
    }
    
}
