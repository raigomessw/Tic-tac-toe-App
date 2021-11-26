//
//  ViewController.swift
//  Tic-tac-toe-App
//
//  Created by Rai Gomes on 2021-11-23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField1: UITextField!
    @IBOutlet weak var nameField2: UITextField!
    @IBOutlet weak var playerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //turnPlayerName = playerName1 playerName2
    }
    @IBAction func startBtnClicked(_ sender: UIButton) {
        guard !nameField1.text!.trimmingCharacters(in: .whitespaces).isEmpty
                && !nameField2.text!.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        
        let controller = storyboard?.instantiateViewController(identifier: "gameScene") as! GameViewController
        controller.player1Name = nameField1.text
        controller.player2Name = nameField2.text
        controller.modalTransitionStyle = .flipHorizontal // Efeito de flip para entrar na tela do jogo apos clikar em jogar
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Ler o nome que for colocar na caixa de texto
        if let controller = segue.destination as? GameViewController{
            controller.player1Name = nameField1.text
            controller.player2Name = nameField2.text
        }
    }
    
   /* override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goToGameVc"{
            if nameField1.text!.trimmingCharacters(in: .whitespaces).isEmpty && nameField2.text!.trimmingCharacters(in: .whitespaces).isEmpty{
                return false
            }
            
        }
        
        return true
    }*/
    
    
    
   
    
}

