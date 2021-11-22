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
        leftButton.backgroundColor = hexStringToUIColor(hex: teamData.leftColor)
        rightButton.backgroundColor = hexStringToUIColor(hex: teamData.rightColor)
    }

    @IBAction func leftScoreAdded(_ sender: UIButton) {
        teamData.leftScore += 1
        leftTeamScore.text = String(teamData.leftScore)
        userDefault.set(teamData.leftScore, forKey: "teamData.leftScore")
    }
    
    @IBAction func rightScoreAdded(_ sender: Any) {
        teamData.rightScore += 1
        rightTeamScore.text = String(teamData.rightScore)
        userDefault.set(teamData.rightScore, forKey: "teamData.rightScore")
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
    
}

