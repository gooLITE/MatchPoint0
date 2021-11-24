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
    var win: Bool{
        userDefault.bool(forKey: "teamData.win")
    }
    var winningTeam: String{
        userDefault.string(forKey: "teamData.winningTeam") ?? "no"
    }
        
    @IBOutlet weak var leftTeamName: UILabel!
    @IBOutlet weak var rightTeamName: UILabel!
    @IBOutlet weak var leftTeamScore: UILabel!
    @IBOutlet weak var rightTeamScore: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamData.leftScore = userDefault.integer(forKey: "teamData.leftScore")
        teamData.rightScore = userDefault.integer(forKey: "teamData.rightScore")
        
        print(teamData.leftScore, teamData.rightScore)
        print(leftScore, rightScore)

        // Do any additional setup after loading the view.
        leftTeamName.text = teamData.leftTeamName
        rightTeamName.text = teamData.rightTeamName
        
        leftTeamScore.text = String(teamData.leftScore)
        rightTeamScore.text = String(teamData.rightScore)
        
        leftButton.backgroundColor = hexStringToUIColor(hex: teamData.leftColor)
        rightButton.backgroundColor = hexStringToUIColor(hex: teamData.rightColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        teamData.leftScore = userDefault.integer(forKey: "teamData.leftScore")
        teamData.rightScore = userDefault.integer(forKey: "teamData.rightScore")
        
        leftTeamName.text = leftName
        rightTeamName.text = rightName
        
        leftTeamScore.text = String(teamData.leftScore)
        rightTeamScore.text = String(teamData.rightScore)
        
        leftButton.backgroundColor = hexStringToUIColor(hex: color1)
        rightButton.backgroundColor = hexStringToUIColor(hex: color2)
    }
    
    
    @IBAction func leftScoreAdded(_ sender: UIButton) {
        teamData.leftScore = userDefault.integer(forKey: "teamData.leftScore")
        teamData.leftScore += 1
        
        
        if win == false{
            leftTeamScore.text = String(teamData.leftScore)
            
            if checkWining(side: "left", score: teamData.leftScore) == false{
                userDefault.set(teamData.leftScore, forKey: "teamData.leftScore")
                userDefault.synchronize()
            }
        }
        else{
            if winningTeam == "left"{
                let alert = UIAlertController(title: "Congratulation!!", message: "\(leftName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "Another game!!", message: "\(rightName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func rightScoreAdded(_ sender: Any) {
        teamData.rightScore = userDefault.integer(forKey: "teamData.rightScore")
        teamData.rightScore += 1
        
        
        if win == false{
            rightTeamScore.text = String(teamData.rightScore)
            
            if checkWining(side: "right", score: teamData.rightScore) == false{
                userDefault.set(teamData.rightScore, forKey: "teamData.rightScore")
                userDefault.synchronize()
            }
        }
        else{
            if winningTeam == "right"{
                let alert = UIAlertController(title: "Congratulation!!", message: "\(rightName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "Another game!!", message: "\(leftName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        teamData.leftScore = 0
        teamData.rightScore = 0
        leftTeamScore.text = String(teamData.leftScore)
        rightTeamScore.text = String(teamData.rightScore)
        userDefault.set(teamData.leftScore, forKey: "teamData.leftScore")
        userDefault.set(teamData.rightScore, forKey: "teamData.rightScore")
        userDefault.set(false, forKey: "teamData.win")
        userDefault.set("no", forKey: "teamData.winningTeam")
    }
    
    @IBAction func navToSetting(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SettingTableVC
        destinationVC?.teamData = teamData
    }
    
    func checkWining(side: String, score: Int) -> Bool{
        print("in checkWinning: \(teamData.leftScore), \(teamData.rightScore)")
        if side == "left"{
            if teamData.leftScore >= scoreToWin && (teamData.leftScore-teamData.rightScore >= 2) {
                print("checking left")
                let alert = UIAlertController(title: "Congratulation!!", message: "\(leftName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
                
                userDefault.set(true, forKey: "teamData.win")
                userDefault.set("left", forKey: "teamData.winningTeam")
                userDefault.synchronize()
                
                print(win, winningTeam)
                
                return true
            }
        }
        else if side == "right"{
            if teamData.rightScore >= scoreToWin && (teamData.rightScore-teamData.leftScore >= 2) {
                let alert = UIAlertController(title: "Congratulation!!", message: "\(rightName) wins!!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(confirmAction)
                present(alert, animated: true, completion: nil)
                
                userDefault.set(true, forKey: "teamData.win")
                userDefault.set("right", forKey: "teamData.winningTeam")
                userDefault.synchronize()
                
                print(win, winningTeam)
                
                return true
            }
        }
        return false
    }
        

    
}

