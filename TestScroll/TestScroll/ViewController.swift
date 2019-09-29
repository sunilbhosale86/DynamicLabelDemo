//
//  ViewController.swift
//  TestScroll
//
//  Created by Sunil Bhosale on 9/27/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView : UITableView? = nil
    @IBOutlet weak var headerView : UIView? = nil
    @IBOutlet weak var headerLabel : UILabel? = nil
    @IBOutlet weak var headerHeightConstraint : NSLayoutConstraint? = nil
    @IBOutlet weak var labelLeadingConstraint : NSLayoutConstraint? = nil
    @IBOutlet weak var labelBottomConstraint : NSLayoutConstraint? = nil
    private var headerHeight : CGFloat = 100
    private var labelLeading : CGFloat = 16
    private var labelBottom: CGFloat = 0
    private var topInset : CGFloat = 100 // TopInset == headerHeight
    private var maxFontSize : CGFloat = 32 // TopInset == headerHeight
    
    var emailTextField: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "email";
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        return tf
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // TopInset == headerHeight
        tableView?.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let y = scrollView.contentOffset.y + topInset
        headerHeightConstraint?.constant = headerHeight - y
        labelLeadingConstraint?.constant = labelLeading + y
        labelBottomConstraint?.constant = labelBottom + y
        let fontSize = (maxFontSize * (headerView?.frame.height ?? 0))/(headerHeight)
        headerLabel?.font = UIFont.systemFont(ofSize: fontSize)
    }
}

