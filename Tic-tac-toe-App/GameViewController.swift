//
//  GameViewController.swift
//  Tic-tac-toe-App
//
//  Created by Rai Gomes on 2021-11-25.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var playerName1Lbl: UILabel!
    @IBOutlet weak var playerScore1Lbl: UILabel!
    @IBOutlet weak var playerName2Lbl: UILabel!
    @IBOutlet weak var playerScore2Lbl: UILabel!
    
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var player1Name : String!
    var player2Name : String!
    
    
    override func viewDidLoad() {// Funcao para mostrar o nome do jogador
        super.viewDidLoad()
        
        playerName1Lbl.text = player1Name + ":"
        playerName2Lbl.text = player2Name + ":"
    }

}
