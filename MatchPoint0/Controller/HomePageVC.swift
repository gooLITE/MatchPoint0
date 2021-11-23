//
//  ViewController.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 19/11/2021.
//

import UIKit



class HomePageVC: UIViewController {
    
    let userDefault = UserDefaults.standard
    var teamData = TeamData()
    
    var color1: String{
        userDefault.string(forKey: "teamData.leftColor") ?? "#3478F6"
    }
    var color2: String{
        userDefault.string(forKey: "teamData.rightColor") ?? "#EB445A"
    }
    var leftName: String{
        userDefault.string(forKey: "teamData.leftTeamName") ?? "Team Left"
    }
    var rightName: String{
        userDefault.string(forKey: "teamData.rightTeamName") ?? "Team Right"
    }
    var leftScore: Int{
        userDefault.integer(forKey: "teamData.leftScore")
    }
    var rightScore: Int{
        userDefault.integer(forKey: "teamData.rightScore")
    }
    var scoreToWin: Int{
        userDefault.integer(forKey: "teamData.scoreToWin")
    }
    
    @IBOutlet weak var leftTeamName: UILabel!
    @IBOutlet weak var rightTeamName: UILabel!
    @IBOutlet weak var leftTeamScore: UILabel!
    @IBOutlet weak var rightTeamScore: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leftTeamName.text = teamData.leftTeamName
        rightTeamName.text = teamData.rightTeamName
        
        leftTeamScore.text = String(teamData.leftScore)
        rightTeamScore.text = String(teamData.rightScore)
        
        leftButton.backgroundColor = hexStringToUIColor(hex: teamData.leftColor)
        rightButton.backgroundColor = hexStringToUIColor(hex: teamData.rightColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leftTeamName.text = leftName
        rightTeamName.text = rightName
        
        leftTeamScore.text = String(leftScore)
        rightTeamScore.text = String(rightScore)
        
        leftButton.backgroundColor = hexStringToUIColor(hex: color1)
        rightButton.backgroundColor = hexStringToUIColor(hex: color2)
    }
    
    
    @IBAction func leftScoreAdded(_ sender: UIButton) {
        teamData.leftScore += 1
        
        if checkWining(side: "left", score: teamData.leftScore) == false{
            leftTeamScore.text = String(teamData.leftScore)
            userDefault.set(teamData.leftScore, forKey: "teamData.leftScore")
            userDefault.synchronize()
        }
    }
    
    @IBAction func rightScoreAdded(_ sender: Any) {
        teamData.rightScore += 1
        
        if checkWining(side: "right", score: teamData.rightScore) == false{
            rightTeamScore.text = String(teamData.rightScore)
            userDefault.set(teamData.rightScore, forKey: "teamData.rightScore")
            userDefault.synchronize()
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        teamData.leftScore = 0
        teamData.rightScore = 0
        leftTeamScore.text = String(teamData.leftScore)
        rightTeamScore.text = String(teamData.rightScore)
        userDefault.set(teamData.leftScore, forKey: "teamData.leftScore")
        userDefault.set(teamData.rightScore, forKey: "teamData.rightScore")
    }
    
    @IBAction func navToSetting(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SettingTableVC
        destinationVC?.teamData = teamData
    }
    
    func checkWining(side: String, score: Int) -> Bool{
        print("in checkWinning: \(leftScore), \(rightScore)")
        
        if side == "left"{
            if leftScore >= scoreToWin && (leftScore-rightScore >= 2) {
                print("checking left")
                let alert = UIAlertController(title: "Congratulation!!", message: "\(leftName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
                return true
            }
        }
        else if side == "right"{
            if rightScore >= scoreToWin && (rightScore-leftScore >= 2) {
                let alert = UIAlertController(title: "Congratulation!!", message: "\(rightName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
                return true
            }
        }
        return false
    }
        

    
}

