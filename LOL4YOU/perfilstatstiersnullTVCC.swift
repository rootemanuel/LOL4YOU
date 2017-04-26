//
//  perfilstatstiersnullTVCC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 26/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class perfilstatstiersnullTVCC: UITableViewCell, UIScrollViewDelegate {
    
    var tiers = Array<perfilstatusV>()

    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!

    let const_page_y = 0
    let const_page_x = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.scrollview.isPagingEnabled = true
        self.scrollview.showsVerticalScrollIndicator = false
        self.scrollview.showsHorizontalScrollIndicator = false
        self.scrollview.delegate = self
    }
    
    func updatescrollview() {
        let width:Int = Int(self.contentView.frame.width)
        let height:Int = Int(self.contentView.frame.height)
        
        for i in 0 ..< tiers.count {
            tiers[i].frame = CGRect(x: width * i, y: const_page_y, width: width, height: height)
            self.scrollview.addSubview(tiers[i])
        }
        
        self.scrollview.frame = CGRect(x: const_page_x, y: const_page_y, width: width, height: height)
        self.scrollview.contentSize = CGSize(width: width * tiers.count, height: height)
        
        self.pagecontrol.numberOfPages = tiers.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollview.contentOffset.x / scrollview.frame.size.width
        self.pagecontrol.currentPage = Int(page)
    }
}
