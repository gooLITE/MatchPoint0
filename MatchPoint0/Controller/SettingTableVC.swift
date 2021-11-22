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
        leftColorImage.tintColor = hexStringToUIColor(hex: teamData.leftColor)
        leftScoreStepper.value = Double(teamData.leftScore)
        
        rightTeamNameTF.text = teamData.rightTeamName
        rightScoreLabel.text = String(teamData.rightScore)
        rightColorImage.tintColor = hexStringToUIColor(hex: teamData.rightColor)
        rightScoreStepper.value = Double(teamData.rightScore)
        
        scoreToWinLabel.text = "\(teamData.scoreToWin) to win"
        scoreToWinStepper.value = Double(teamData.scoreToWin)

    }
//    override func viewWillAppear(_ animated: Bool) {
//        print("Run")
//        print(teamInfo.leftColor)
//        print(teamInfo.rightColor)
//        tableView.reloadData()
//    }

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
            userDefault.string(forKey: teamData.leftTeamName)
        }
        
        if textField == rightTeamNameTF{
            teamData.rightTeamName = textField.text ?? "Team Right"
            userDefault.string(forKey: teamData.rightTeamName)
        }
    }
}

