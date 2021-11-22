//
//  TeamData.swift
//  MatchPoint0
//
//  Created by Yu Sum Yung on 20/11/2021.
//

import Foundation

struct TeamData{
    var leftScore: Int
    var rightScore: Int
    var leftTeamName: String
    var rightTeamName: String
    var leftColor: String
    var rightColor: String
    var scoreToWin: Int
    
    init(){
        leftScore = 0
        rightScore = 0
        leftTeamName = "Team Left"
        rightTeamName = "Team Right"
        leftColor = "#3478F6"
        rightColor = "#EB445A"
        scoreToWin = 25
    }
}

//struct TeamInfo{
//    var leftTeamName: String
//    var rightTeamName: String
//    var leftColor: String
//    var rightColor: String
//    var scoreToWin: Int
//
//    init(){
//        leftTeamName = "Team Left"
//        rightTeamName = "Team Right"
//        leftColor = "#3478F6"
//        rightColor = "#EB445A"
//        scoreToWin = 25
//    }
//}
