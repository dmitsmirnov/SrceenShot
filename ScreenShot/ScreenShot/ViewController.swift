//
//  ViewController.swift
//  ScreenShot
//
//  Created by Дмитрий Смирнов on 15.02.2022.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerDataTime: [String] = [String]()
    
    private lazy var team1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "команда 1:"
        
        return label
    }()
    
    private lazy var team1TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.tintColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.indent(size: 10)
        textField.autocorrectionType = .no
        //textField.backgroundColor = .red
        
        return textField
    }()
    
    private lazy var team2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "команда 2:"
        
        return label
    }()
    
    private lazy var championShipTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.tintColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.indent(size: 10)
        textField.autocorrectionType = .no
        //textField.backgroundColor = .red
        
        return textField
    }()
    
    private lazy var championShipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "чемпионат:"
        
        return label
    }()
    
    private lazy var team2TextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.tintColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.indent(size: 10)
        textField.autocorrectionType = .no
        //textField.backgroundColor = .red
        
        return textField
    }()
    
    private lazy var valuesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "параметры:"
        
        return label
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var stackBet: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var stackIndex: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var betLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "сумма:"
        
        return label
    }()
    
    private lazy var valueBetTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.tintColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.indent(size: 10)
        //textField.backgroundColor = .red
        textField.keyboardType = .numbersAndPunctuation
        
        return textField
    }()
    
    private lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "коэф:"
        
        return label
    }()
    
    private lazy var indexTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.tintColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.layer.borderWidth = 1
        textField.indent(size: 10)
        //textField.backgroundColor = .red
        //textField.keyboardType = .decimalPad
        textField.keyboardType = .numbersAndPunctuation
        
        return textField
    }()
    
    private lazy var showScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("показать", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(presentSecondView), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var createScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("создать", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(addScreenShot), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var cleanScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("очистить", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(cleanScreenShot), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        
        return scrollView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    private lazy var typeOfBetControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .clear
        control.insertSegment(with: nil, at: 0, animated: true)
        control.insertSegment(with: nil, at: 1, animated: true)
        control.setTitle("1-ый Тайм", forSegmentAt: 0)
        control.setTitle("2-ой Тайм", forSegmentAt: 1)
        
        control.selectedSegmentTintColor = .systemGray3
        
        control.selectedSegmentIndex = 0
        
        return control
    }()
    
    private lazy var typeBetPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        //picker.backgroundColor = .red
        picker.tintColor = .red
        
        picker.layer.cornerRadius = 12
        picker.setValue(UIColor.black, forKey: "textColor")
        //picker.backgroundColor = .systemGray
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.layer.borderWidth = 1
        picker.layer.borderColor = UIColor.systemGray5.cgColor
        
        return picker
    }()
    
    private lazy var typeOfScreen: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .clear
        control.insertSegment(with: nil, at: 0, animated: true)
        control.insertSegment(with: nil, at: 1, animated: true)
        control.setTitle("выплачена", forSegmentAt: 0)
        control.setTitle("принята", forSegmentAt: 1)
        
        control.selectedSegmentIndex = 0
        
        control.selectedSegmentTintColor = .systemGreen
        
        control.addTarget(self, action: #selector(changeColorControl), for: .valueChanged)
        
        return control
    }()
    
    var screenController = ScreensViewController()
    
    @objc private func changeColorControl() {
        if self.typeOfScreen.selectedSegmentIndex == 0 {
            self.typeOfScreen.selectedSegmentTintColor = .systemGreen
        } else {
            self.typeOfScreen.selectedSegmentTintColor = .systemOrange
        }
        //print("I ❤️ Swift".utf8.count)
    }
    
    @objc private func presentSecondView() {
        
        self.screenController.tableView.reloadData()
        //screenController.tableView.beginUpdates()
        //screenController.tableView.endUpdates()
        //screenController.tableView.reloadRows(at: <#T##[IndexPath]#>, with: .automatic)
        
        self.navigationController?.pushViewController(self.screenController, animated: true)
        self.createScreenButton.setTitle("создать", for: .normal)
        self.numberScreen = 0
    }
    
    private var numberScreen: Int = 0
    
    func getNumber() -> String {
    
        var dateComponents = DateComponents()
        dateComponents.hour = 22
        dateComponents.minute = 19
        dateComponents.second = 00
        dateComponents.year = 2022
        dateComponents.month = 05
        dateComponents.day = 26

        let calendar = Calendar.current
        let dateFromDC = calendar.date(from: dateComponents)

        let numberStart: Int = 27281096863
        let numberCount: Int = 319 // in sec

        let dateNow = Date()
        let dateDef = Calendar.current.dateComponents([.second], from: dateFromDC!, to: dateNow)

        return String(dateDef.second! * numberCount + numberStart)
        
    }
    
    @objc private func addScreenShot() {
        
        let result: Double = Double(self.valueBetTextField.text!)! * Double(self.indexTextField.text!)!
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        let formattedResult = numberFormatter.string(from: NSNumber(value: result))
        let formattedBet = numberFormatter.string(from: NSNumber(value: Double(self.valueBetTextField.text!)!))
        
        
        let selectTypeOfBet = getBet(bet: self.typeBetPickerView.selectedRow(inComponent: 0))
        let selectTypeOfTime = self.typeOfBetControl.selectedSegmentIndex
        
        let dateNow = Date()
        let dateF = DateFormatter()
        dateF.dateFormat = "dd.MM.yyyy (HH:mm)"
        //dateF.timeZone = TimeZone(abbreviation: "UTC")
        
        let model = ScreenTableViewCell.ViewModel(bet: formattedBet!,
                                                  result: formattedResult!,
                                                  match: self.team1TextField.text! + " - " + self.team2TextField.text!,
                                                  championShip: self.championShipTextField.text!,
                                                  index: self.indexTextField.text!,
                                                  typeOfTime: selectTypeOfTime,
                                                  typeOfBet: selectTypeOfBet,
                                                  numberScreen: getNumber(),
                                                  dateScreen: dateF.string(from: dateNow),
                                                  
                                                  typeOfWin: ScreenTableViewCell.TypeOfWin.win,
                                                  typeOfImage: self.typeOfScreen.selectedSegmentIndex)
       
        self.screenController.dataSource.insert(model, at: 0)
        self.numberScreen += 1
        self.createScreenButton.setTitle("создать (\(self.numberScreen))", for: .normal)
        
        AudioServicesPlaySystemSound(1519)
        
    }
    
    @objc private func cleanScreenShot() {
        self.screenController.dataSource.removeAll()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray3
        self.navigationItem.title = "Настройки"
        
        championShipTextField.text = "Футбол. Чемпионат "
        valueBetTextField.text = "1000"
        indexTextField.text = "1.8"
        
        
        pickerDataTime = ["Тотал (0.5) Б",
                          "до 60 мин",
                          "до 75 мин"]
        
        self.setupView_2()
        
        // hidden keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hideKB)))
        
        //self.valueBetTextField.keyboardType = .decimalPad
        //self.indexTextField.keyboardType = .decimalPad
        
        
        //self.team2TextField.autocapitalizationType = UITextAutocapitalizationType.words
        self.championShipTextField.autocapitalizationType = UITextAutocapitalizationType.words
        self.championShipTextField.tintColor = .black
        
    }

    @objc func hideKB() {
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupNavigationBar() {
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Настройки"
        self.navigationItem.backButtonTitle = ""
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(hexString: "8E95A2")]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hexString: "8E95A2")]
        
        navBarAppearance.backgroundColor = UIColor(hexString: "353F41")
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        
        self.navigationController?.navigationBar.tintColor = UIColor(hexString: "8E95A2")
        //self.navigationController?.navigationBar.barTintColor = .white
        
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        //self.navigationController?.navigationBar.barStyle = .blackOpaque
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationItem.backButtonTitle = ""
        
        self.setupNavigationBar()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentInset.bottom = kbdSize.height
            self.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentInset.bottom = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupView_2() {
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.mainView)
        
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.mainView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.mainView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.mainView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.mainView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.mainView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.mainView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor).isActive = true
        
        self.mainView.addSubview(self.team1Label)
        self.team1Label.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 25).isActive = true
        self.team1Label.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 10).isActive = true
        self.team1Label.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -10).isActive = true
        
        self.mainView.addSubview(self.team1TextField)
        self.team1TextField.topAnchor.constraint(equalTo: self.team1Label.bottomAnchor, constant: 15).isActive = true
        self.team1TextField.leadingAnchor.constraint(equalTo: self.team1Label.leadingAnchor).isActive = true
        self.team1TextField.trailingAnchor.constraint(equalTo: self.team1Label.trailingAnchor).isActive = true
        self.team1TextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.mainView.addSubview(self.team2Label)
        self.team2Label.topAnchor.constraint(equalTo: self.team1TextField.bottomAnchor, constant: 20).isActive = true
        self.team2Label.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 10).isActive = true
        self.team2Label.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -10).isActive = true
        
        self.mainView.addSubview(self.team2TextField)
        self.team2TextField.topAnchor.constraint(equalTo: self.team2Label.bottomAnchor, constant: 15).isActive = true
        self.team2TextField.leadingAnchor.constraint(equalTo: self.team2Label.leadingAnchor).isActive = true
        self.team2TextField.trailingAnchor.constraint(equalTo: self.team2Label.trailingAnchor).isActive = true
        self.team2TextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.mainView.addSubview(self.championShipLabel)
        self.championShipLabel.topAnchor.constraint(equalTo: self.team2TextField.bottomAnchor, constant: 20).isActive = true
        self.championShipLabel.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 10).isActive = true
        self.championShipLabel.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -10).isActive = true
        
        self.mainView.addSubview(self.championShipTextField)
        self.championShipTextField.topAnchor.constraint(equalTo: self.championShipLabel.bottomAnchor, constant: 15).isActive = true
        self.championShipTextField.leadingAnchor.constraint(equalTo: self.championShipLabel.leadingAnchor).isActive = true
        self.championShipTextField.trailingAnchor.constraint(equalTo: self.championShipLabel.trailingAnchor).isActive = true
        self.championShipTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.mainView.addSubview(self.valuesLabel)
        self.valuesLabel.topAnchor.constraint(equalTo: self.championShipTextField.bottomAnchor, constant: 20).isActive = true
        self.valuesLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
       
        self.mainView.addSubview(self.stackBet)
        self.stackBet.addArrangedSubview(self.betLabel)
        self.stackBet.addArrangedSubview(self.valueBetTextField)
        
        self.stackBet.topAnchor.constraint(equalTo: self.valuesLabel.bottomAnchor, constant: 15).isActive = true
        self.stackBet.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15).isActive = true
        self.stackBet.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -15).isActive = true
        self.stackBet.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.mainView.addSubview(self.stackIndex)
        self.stackIndex.addArrangedSubview(self.indexLabel)
        self.stackIndex.addArrangedSubview(self.indexTextField)
        
        self.stackIndex.topAnchor.constraint(equalTo: self.stackBet.bottomAnchor, constant: 10).isActive = true
        self.stackIndex.leadingAnchor.constraint(equalTo: self.stackBet.leadingAnchor).isActive = true
        self.stackIndex.trailingAnchor.constraint(equalTo: self.stackBet.trailingAnchor).isActive = true
        self.stackIndex.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
       
        self.mainView.addSubview(self.typeOfBetControl)
        self.typeOfBetControl.topAnchor.constraint(equalTo: self.stackIndex.bottomAnchor, constant: 25).isActive = true
        self.typeOfBetControl.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15).isActive = true
        self.typeOfBetControl.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -15).isActive = true
        
        
        self.mainView.addSubview(self.typeBetPickerView)
        self.typeBetPickerView.topAnchor.constraint(equalTo: self.typeOfBetControl.bottomAnchor, constant: 15).isActive = true
        self.typeBetPickerView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15).isActive = true
        self.typeBetPickerView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -15).isActive = true
        self.typeBetPickerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.mainView.addSubview(self.typeOfScreen)
        self.typeOfScreen.topAnchor.constraint(equalTo: self.typeBetPickerView.bottomAnchor, constant: 25).isActive = true
        self.typeOfScreen.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15).isActive = true
        self.typeOfScreen.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -15).isActive = true
        
        self.mainView.addSubview(self.stack)
        self.stack.addArrangedSubview(self.createScreenButton)
        self.stack.addArrangedSubview(self.showScreenButton)
        self.stack.addArrangedSubview(self.cleanScreenButton)
        
        self.stack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        self.stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        self.stack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataTime.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return pickerData[component][row]
        return pickerDataTime[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(pickerDataTime[row])
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let myTitle = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        return myTitle
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: sender)
        guard segue.identifier == "showSecondViewController",
                let secondViewController = segue.destination as? SecondViewController
        else { return }
        
        //secondViewController.self.team1Label.text = self.team1TextField.text!
        secondViewController.team1text = self.team1TextField.text!
        secondViewController.team2text = self.team2TextField.text!
        
        secondViewController.valueBet = self.valueBetTextField.text!
        secondViewController.valueIndex = self.indexTextField.text!
        secondViewController.valueChampionat = self.championShipTextField.text!
        
        secondViewController.valueTypeOfBet = getBet(bet: self.typeBetPickerView.selectedRow(inComponent: 0))
        secondViewController.valueTime = self.typeOfBetControl.selectedSegmentIndex
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //self.view.endEditing(true)
        //self.mainScrollView.endEditing(true)
    }
    
    func getBet(bet: Int) -> String {
        if bet == 0 {
            return "Тотал (0.5) Б"
        } else if bet == 1 {
            return """
                Гол номер 1 будет забит
                до 60 минут - Да:
                """
        } else {
            return """
            Гол номер 1 будет забит
            до 75 минут - Да:
            """
        }
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension String {
      var capitalizeFirstLetter:String {
          return self.prefix(1).capitalized + dropFirst()
      }
 }
