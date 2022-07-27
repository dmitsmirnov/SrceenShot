//
//  SrceensViewController.swift
//  ScreenShot
//
//  Created by Дмитрий Смирнов on 21.04.2022.
//

import UIKit
import AudioToolbox

class ScreensViewController: UIViewController {

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 44
        
        table.delegate = self
        table.dataSource = self
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        table.register(ScreenTableViewCell.self, forCellReuseIdentifier: "ScreenTableViewCell")
        
        return table
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(hexString: "263033")
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "353F41")
        self.navigationController?.navigationBar.barTintColor = .white
        //self.view.backgroundColor = .green
        self.view.addSubview(self.tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.navigationItem.title = "История ставок"
        
        let imageView = UIImageView(image: UIImage(named: "stacks.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let imageView2 = UIImageView(image: UIImage(named: "filter.png"))
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let imageView3 = UIImageView(image: UIImage(named: "iconsBar-2.png"))
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.widthAnchor.constraint(equalToConstant: 83).isActive = true
        imageView3.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        let buttonItem3 = UIBarButtonItem(customView: imageView3)
        
        //buttonItem2.customView?.leadingAnchor.constraint(equalTo: buttonItem.customView!.trailingAnchor, constant: 50).isActive = true
        //self.navigationItem.rightBarButtonItems = [buttonItem, buttonItem2]
        self.navigationItem.setRightBarButtonItems([buttonItem3], animated: false)
        
    }
    
    var dataSource: [ScreenTableViewCell.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //var isExpanded: Bool = false
}

extension ScreensViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScreenTableViewCell", for: indexPath) as? ScreenTableViewCell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
            
        let article = self.dataSource[indexPath.row]
//        let viewModel = PostTableViewCell.ViewModel(author: article.author,
//                                                    description: article.description,
//                                                    image: article.image,
//                                                    likes: article.likes,
//                                                    views: article.views)
        
        
        cell.setupValue(viewModel: article)
        
        //self.tableView.reloadRows(at: [indexPath], with: .automatic)
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCell(sender:)))
        
        longPress.minimumPressDuration = 0.5
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc private func longPressCell(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            AudioServicesPlaySystemSound(1519)
        }
        print(sender.location(in: self.tableView))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.dataSource.remove(at: indexPath.row)
            //self.tableView.reloadRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AudioServicesPlaySystemSound(1519)
        
        let cell = tableView.cellForRow(at: indexPath) as? ScreenTableViewCell

        if dataSource[indexPath.row].typeOfWin == ScreenTableViewCell.TypeOfWin.win {
            dataSource[indexPath.row].typeOfWin = ScreenTableViewCell.TypeOfWin.lost
            cell?.getStatusLost()
        } else {
            dataSource[indexPath.row].typeOfWin = ScreenTableViewCell.TypeOfWin.win
            cell?.getStatusWin()
        }
    
        //self.isExpanded = !self.isExpanded
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

//        return UITableView.automaticDimension
        if dataSource[indexPath.row].typeOfWin == ScreenTableViewCell.TypeOfWin.win {
            return 253
        } else {
            return 225
        }
        
//        if isExpanded {
//            return 200
//        } else {
//            return 250
//        }

    }
    
}

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.currentIndex = scanner.string.startIndex
        }
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
}
