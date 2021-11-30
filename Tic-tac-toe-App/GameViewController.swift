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
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var turnLabel2: UILabel!
    
    enum Turn{
        
        case Nought //O
        case Cross //x
        
    }
    
    
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
    
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "X"
    var CROSS =  "O"
    

    
    var board = [UIButton]()
    
    
    override func viewDidLoad() {// Funcao para mostrar o nome do jogador
        super.viewDidLoad()
        
        
        
        initBoard()
        
        playerName1Lbl.text = player1Name + ":"
        playerName2Lbl.text = player2Name + ":"
       
        
    
    }
    func initBoard(){// Fucao para iniciar o board
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            playerScore1Lbl.text = String((Int(playerScore1Lbl.text ?? "0") ?? 0) + 1)
            resultAlert(title: "Nought Win!")
        
        }
        
        
        if checkForVictory(NOUGHT){
            playerScore2Lbl.text = String((Int(playerScore2Lbl.text ?? "0") ?? 0) + 1)
            resultAlert(title: "Cross Win!")
            
            
        }
        
        if(fullBoard()){
            resultAlert(title: "Draw")
            
        }
        
    }
    @IBAction func closeBottonClicked(_ sender: UIButton) {//Funcao para voltar a tela principal de player
        dismiss(animated: true, completion: nil)
    }
    

    
    func checkForVictory(_ s :String) -> Bool {
        
        //Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        
        //Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        
        //Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool{
        
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String){// Funcao para mostrar o vencedor e o final do programa
        
        let message = "\nNoughts:" + String(Int(playerScore1Lbl.text ?? "0") ?? 0) + "\n\nCrosses:" + String(Int(playerScore2Lbl.text ?? "0") ?? 0)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in
            self.resetBoard()}))
        self.present(ac, animated: true)
    }
    

    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
            turnLabel.text = player1Name
            turnLabel2.text = CROSS
            
        }
        
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
            turnLabel.text = player2Name
            turnLabel2.text = NOUGHT
        }
        
        currentTurn = firstTurn
    }
    
    
    func fullBoard()->Bool{ // Fucao para verificar se e Enpaty o espaco do Board
        
        for button in board{
            if button.title(for: .normal) == nil{ //Se e empaty vai retornal false
                return false
            }
        }
        
        return true
    }
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            
            if(currentTurn == Turn.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = player1Name + ":"
                turnLabel2.text = CROSS
                
            }else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = player2Name + ":"
                turnLabel2.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
    
}
