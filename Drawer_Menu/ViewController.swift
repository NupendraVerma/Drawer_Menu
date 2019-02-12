//
//  ViewController.swift
//  Drawer_Menu
//
//  Created by PAL-MAC on 12/02/19.
//  Copyright © 2019 PAL-MAC. All rights reserved.
//

 

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 

    @IBOutlet weak var MenuBar: UIView!
    @IBOutlet weak var Lbl_Session: UILabel!
    @IBOutlet weak var Lbl_userMail: UILabel!
    @IBOutlet weak var Img_Profile: UIImageView!
    @IBOutlet weak var MenuTable: UITableView!
    
    @IBOutlet weak var leadingCons: NSLayoutConstraint!

    @IBOutlet weak var Btn_Plus: UIButton!    
    @IBOutlet var Hidden_view: UIView!
    var menu_show = false
    
    var titleArray :[String] = ["Your Place","Timeline","Message","Location"]
    var MapArray :[String] = ["Tips & Tricks","Setting","Help","Feedback",]
    var titleimgArray :[UIImage] = [#imageLiteral(resourceName: "placeholder.png"),#imageLiteral(resourceName: "timeline.png"),#imageLiteral(resourceName: "conversation.png"),#imageLiteral(resourceName: "placeholder.png")]
    var mapimgArray :[UIImage] = [#imageLiteral(resourceName: "magic-wand.png"),#imageLiteral(resourceName: "settings.png"),#imageLiteral(resourceName: "information.png"),#imageLiteral(resourceName: "writing.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Img_Profile.layer.cornerRadius = Img_Profile.frame.width/2

        Lbl_Session.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        Lbl_Session.layer.borderWidth = 1
        Lbl_Session.layer.cornerRadius = 5
        
        Btn_Plus.layer.cornerRadius = Btn_Plus.frame.width/2
        Btn_Plus.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        Btn_Plus.layer.borderWidth = 1
        
        leadingCons.constant = -(MenuBar.frame.size.width)
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(Tap_Ges))
        Hidden_view.addGestureRecognizer(gesture)
        
        let swipe_menu = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        swipe_menu.edges = .left
        
        view.addGestureRecognizer(swipe_menu)
        
        MenuTable.delegate = self
        MenuTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return ""
        case 1:
            return "Map Option"
        default:
            return ""
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return titleArray.count
        case 1:
            return MapArray.count
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Table_data")as! Table_data
        switch (indexPath.section) {
        case 0:
            cell.lbl_title.text = titleArray[indexPath.row]
            cell.Img_icon.image = titleimgArray[indexPath.row]
        case 1:
            cell.lbl_title.text = MapArray[indexPath.row]
            cell.Img_icon.image = mapimgArray[indexPath.row]
        default:
            print("Default")
        }
         return cell
    }
    

    @objc func Tap_Ges(sender : UITapGestureRecognizer) {
        leadingCons.constant = -(MenuBar.frame.size.width)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        menu_show = false
        Hidden_view.alpha = 0
    }
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            leadingCons.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menu_show = true
            Hidden_view.alpha = 1
        }
    }
    
    @IBAction func Btn_ShowMenu(_ sender: Any) {
        MenuShow()
    }
    
    func MenuShow(){
        if menu_show {
            leadingCons.constant = -(MenuBar.frame.size.width)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menu_show = false
            Hidden_view.alpha = 0
        }else{
            leadingCons.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            menu_show = true
            Hidden_view.alpha = 1
        }
    }
}

class Table_data: UITableViewCell {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var Img_icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
