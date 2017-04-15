//
//  ViewController.swift
//  Lacalization
//
//  Created by Наталья on 15.04.17.
//  Copyright © 2017 IOSLab. All rights reserved.
//

import UIKit

struct UserInfo {
    var title: String
    var description: String
}

class ViewController: UIViewController {
    
    lazy var usersInfo: [[UserInfo]] = {
        var userInfoArr = [[UserInfo]]()
        var sectionOne = [UserInfo]()
        var userInfo = UserInfo(title: NSLocalizedString("Status", comment: ""), description: NSLocalizedString("Americano", comment: ""))
        sectionOne.append(userInfo)
        
        userInfoArr.append(sectionOne)
        
        var sectionTwo = [UserInfo]()
        var userCity = UserInfo(title: NSLocalizedString("City", comment: ""), description:
            NSLocalizedString("Washington DC", comment: ""))
        sectionTwo.append(userCity)
        
        userInfoArr.append(sectionTwo)
        
        return userInfoArr
    }()
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: NSLayoutConstraint!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersInfo[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return usersInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let userInfo = usersInfo[indexPath.section][indexPath.row] 
        
        cell.placeholderLabel.text = userInfo.title
        cell.infoLabel.text = userInfo.description
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}
