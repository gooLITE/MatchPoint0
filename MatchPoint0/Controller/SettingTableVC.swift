//
//  SettingTableVC.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 20/11/2021.
//

import UIKit

class SettingTableVC: UITableViewController {
    
    let userDefault = UserDefaults.standard
    var teamData = TeamData()
    
    var leftName: String{
        userDefault.string(forKey: "teamData.leftTeamName")!
    }
    var rightName: String{
        userDefault.string(forKey: "teamData.rightTeamName")!
    }
    
    var color1: String{
        userDefault.string(forKey: "teamData.leftColor")!
    }
    var color2: String{
        userDefault.string(forKey: "teamData.rightColor")!
    }
    
    var leftScore: Int{
        userDefault.integer(forKey: "teamData.rightScore")
    }
    var rightScore: Int{
        userDefault.integer(forKey: "teamData.rightScore")
    }
    var scoreToWin: Int{
        userDefault.integer(forKey: "teamData.scoreToWin")
    }
    
    
    @IBOutlet weak var leftTeamNameTF: UITextField!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var leftScoreStepper: UIStepper!
    @IBOutlet weak var leftColorImage: UIImageView!
    
    @IBOutlet weak var rightTeamNameTF: UITextField!
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var rightScoreStepper: UIStepper!
    @IBOutlet weak var rightColorImage: UIImageView!
    
    @IBOutlet weak var scoreToWinLabel: UILabel!
    @IBOutlet weak var scoreToWinStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in Setting page: ", teamData)
        //self.userDefault.object(forKey: teamData.leftColor)
        
        
        leftTeamNameTF.delegate = self
        rightTeamNameTF.delegate = self
        
        leftTeamNameTF.text = teamData.leftTeamName
        leftScoreLabel.text = String(teamData.leftScore)
        leftColorImage.tintColor = hexStringToUIColor(hex: color1)
        leftScoreStepper.value = Double(teamData.leftScore)
        
        rightTeamNameTF.text = teamData.rightTeamName
        rightScoreLabel.text = String(teamData.rightScore)
        rightColorImage.tintColor = hexStringToUIColor(hex: color2)
        rightScoreStepper.value = Double(teamData.rightScore)
        
        scoreToWinLabel.text = "\(teamData.scoreToWin) to win"
        scoreToWinStepper.value = Double(teamData.scoreToWin)

    }
    override func viewWillAppear(_ animated: Bool) {
        
        leftColorImage.tintColor = hexStringToUIColor(hex: color1)
        rightColorImage.tintColor = hexStringToUIColor(hex: color2)
        
        tableView.reloadData()
    }

    @IBAction func leftStepperPressed(_ sender: UIStepper) {
        leftScoreLabel.text = String(Int(leftScoreStepper.value))
        userDefault.set(Int(leftScoreStepper.value), forKey: "teamData.leftScore")
    }
    
    
    @IBAction func rightStepperPressed(_ sender: UIStepper) {
        rightScoreLabel.text = String(Int(rightScoreStepper.value))
        userDefault.set(Int(rightScoreStepper.value), forKey: "teamData.rightScore")
    }
    
    @IBAction func scoreToWinStepperPressed(_ sender: UIStepper) {
        scoreToWinLabel.text = "\(Int(scoreToWinStepper.value)) to Win"
        print(Int(scoreToWinStepper.value))
        userDefault.set(Int(scoreToWinStepper.value), forKey: "teamData.scoreToWin")
        print(teamData.scoreToWin)
        teamData.scoreToWin = Int(scoreToWinStepper.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ColorListTableVC
        destinationVC.teamData = teamData
    }
    
    
}

//MARK: -UITextFieldDelegate
extension SettingTableVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == leftTeamNameTF{
            teamData.leftTeamName = textField.text ?? "Team Left"
            userDefault.set(teamData.leftTeamName, forKey: "teamData.leftTeamName")
            userDefault.synchronize()
        }
        
        if textField == rightTeamNameTF{
            teamData.rightTeamName = textField.text ?? "Team Right"
            userDefault.set(teamData.rightTeamName, forKey: "teamData.rightTeamName")
            userDefault.synchronize()
        }
    }
}

