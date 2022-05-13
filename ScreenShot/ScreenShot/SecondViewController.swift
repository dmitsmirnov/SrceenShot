//
//  SecondViewController.swift
//  ScreenShot
//
//  Created by Дмитрий Смирнов on 15.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    //@IBOutlet weak var gameTextLabel: UILabel!
    //@IBOutlet weak var screen1ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberTextLabel.text = self.getNumber()
        
        let dateNow = Date()
        let dateF = DateFormatter()
        dateF.dateFormat = "dd.MM.yyyy (HH:mm)"
        //dateF.timeZone = TimeZone(abbreviation: "UTC")
        
        self.dateTextLabel.text = dateF.string(from: dateNow)
        
        //let tab = UITapGestureRecognizer(target: self, action: #selector(test))
        //screen1ImageView.isUserInteractionEnabled = true
        //screen1ImageView.addGestureRecognizer(tab)
        
    }
    
    private func getNumber() -> String {
    
        var dateComponents = DateComponents()
        //dateComponents.timeZone = TimeZone(abbreviation: "UTC")
        dateComponents.hour = 19
        dateComponents.minute = 09
        dateComponents.second = 00
        dateComponents.year = 2022
        dateComponents.month = 04
        dateComponents.day = 14

        let calendar = Calendar.current
        let dateFromDC = calendar.date(from: dateComponents)

        let numberStart: Int = 26223620725
        let numberCount: Int = 319 // in sec

        let dateNow = Date()

        let dateDef = Calendar.current.dateComponents([.second], from: dateFromDC!, to: dateNow)

        return String(dateDef.second! * numberCount + numberStart)
        
    }
    
    @IBOutlet weak var indexTextLabel: UILabel!
    @IBOutlet weak var betTextLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var championatTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var numberTextLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeOfBetLabel: UILabel!
    
    var team1text: String?
    var team2text: String?
    
    var valueBet: String?
    var valueIndex: String?
    var valueResult: String?
    
    var valueChampionat: String?
    
    var valueTime: Int?
    var valueTypeOfBet: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.gameTextLabel.text = team1text! + " - " + team2text!
        //var x: Double? = Double(self.valueBet) * Double(self.valueIndex!)
        let result: Double = Double(self.valueBet!)! * Double(self.valueIndex!)!
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        let formattedResult = numberFormatter.string(from: NSNumber(value: result))
        let formattedBet = numberFormatter.string(from: NSNumber(value: Double(self.valueBet!)!))
        
        self.indexTextLabel.text = self.valueIndex!
        self.betTextLabel.text   = formattedBet!
        self.resultTextLabel.text = formattedResult!
        self.championatTextLabel.text = self.valueChampionat!
        
        //self.typeOfBetLabel.layer.cornerRadius = 12
        self.typeOfBetLabel.text = self.valueTypeOfBet!
        
        self.timeLabel.text = getTime(time: self.valueTime!)
        
        if self.timeLabel.text == "-" {
            self.timeLabel.isHidden = true
            self.typeOfBetLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 230).isActive = true
            //self.gameTextLabel.bottomAnchor.constraint(equalTo: self.typeOfBetLabel.topAnchor, constant: -7).isActive = true
            
           // self.indexTextLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 240).isActive = true
            
           // self.betTextLabel.topAnchor.constraint(equalTo: self.indexTextLabel.bottomAnchor, constant: -20).isActive = true
            
           // self.resultTextLabel.topAnchor.constraint(equalTo: self.indexTextLabel.bottomAnchor, constant: -40).isActive = true
            
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    func getTime(time: Int) -> String {
        if time == 0 {
            return "1-й Тайм"
        } else {
            return "-"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc private func test() {
        print(123)
    }
    
}
