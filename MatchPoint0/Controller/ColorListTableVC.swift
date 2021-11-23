//
//  ColorListTableVC.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 20/11/2021.
//

import UIKit

class ColorListTableVC: UITableViewController{

    let userDefault = UserDefaults.standard
    var teamData = TeamData()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("in colorListTableVC: ", teamData)

//        self.navigationItem.hidesBackButton = true
//        let newBack = UIBarButtonItem(title: "Back", style: .plain, target: self, action: "back:")
//        self.navigationItem.leftBarButtonItem = newBack
        
//        navigationController?.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themeColor.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorListTableViewCell
        
//        cell.delegate = self
        cell.colorName.text = themeColor[indexPath.row][0]
        cell.color1.tintColor = hexStringToUIColor(hex: themeColor[indexPath.row][1])
        cell.color2.tintColor = hexStringToUIColor(hex: themeColor[indexPath.row][2])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(themeColor[indexPath.row][1]), \(themeColor[indexPath.row][2])")
        
        print("before userDefault: \(teamData.leftColor), \(teamData.rightColor)")
        
        userDefault.set(themeColor[indexPath.row][1], forKey: "teamData.leftColor")
        userDefault.set(themeColor[indexPath.row][2], forKey: "teamData.rightColor")
        userDefault.synchronize()
        
        teamData.leftColor = themeColor[indexPath.row][1]
        teamData.rightColor = themeColor[indexPath.row][1]
        
        print("after saved: \(teamData.leftColor), \(teamData.rightColor)")
        
        self.navigationController?.popViewController(animated: true)
        
        //find plist path: /Users/nicole/Library/Developer/CoreSimulator/Devices/22B31B22-7925-491A-81A8-54005E3011A1/data/Containers/Data/Application/EC6EE646-37ED-4961-A1B0-348DECACA0E6/Library/Preferences
//        var path: [AnyObject] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) as [AnyObject]
//        let folder: String = path[0] as! String
//        NSLog("Your NSUserDefaults are stored in this folder: %@/Preferences", folder)

        
        //prepare(for: UIStoryboardSegue, sender: Any?)
        
        //self.navigationController?.popViewController(animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationNC = segue.destination as! UINavigationController
//        let destinationVC = destinationNC.topViewController as? SettingTableVC
//
//        //let destinationVC = segue.destination as! SettingTableVC
//
//        destinationVC?.teamInfo = teamInfo
//        destinationVC?.teamInfo.rightColor = selectedColor2
//
//    }

}


//extension ColorListTableVC: UINavigationControllerDelegate{
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        print("pressed back: \(teamData)")
//        (viewController as? SettingTableVC)?.teamData = teamData
//    }
//}


//extension ColorListTableVC: ColorListTableViewCellDelegate{
//    func didClickButton(cell: ColorListTableViewCell){
//        let color1 = cell.color1.tintColor
//        let color2 = cell.color2.tintColor
//        userDefault.set(color1, forKey: teamData.leftColor)
//        userDefault.set(color2, forKey: teamData.rightColor)
//    }
//}
