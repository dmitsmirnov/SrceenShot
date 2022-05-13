//
//  ScreenTableViewCell.swift
//  ScreenShot
//
//  Created by Дмитрий Смирнов on 21.04.2022.
//

import UIKit

class ScreenTableViewCell: UITableViewCell {
    
    struct ViewModel {
        var bet: String
        var result: String
        var match: String
        var championShip: String
        var index: String
        var typeOfTime: Int
        var typeOfBet: String
        var numberScreen: String
        var dateScreen: String
        
        //var image: String
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.photoImage.image = nil
        self.betLabel.text = nil
        self.typeOfBetLabel.text = nil
        self.dateLabel.text = nil
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        //view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ScreenEmpty_2.png")
        
        //imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var betLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "4CB66A")
        
        return label
    }()
    
    private lazy var numberScreenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        //label.text = getNumber()
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "8E95A2")
        
//        let dateNow = Date()
//        let dateF = DateFormatter()
//        dateF.dateFormat = "dd.MM.yyyy (HH:mm)"
//        //dateF.timeZone = TimeZone(abbreviation: "UTC")
        
        //label.text = dateF.string(from: dateNow)
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    private lazy var championShipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "8E95A2")
        
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var matchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.5)
        
        return label
    }()
    
    private lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    private lazy var firstTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "8E95A2")
        label.font = .systemFont(ofSize: 12)
        label.text = "1-й Тайм"
        
        return label
    }()
    
    private lazy var typeOfBetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "8E95A2")
        label.numberOfLines = 2
        
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private func setupView() {
        self.contentView.addSubview(self.backView)
        
        self.backView.addSubview(self.photoImage)
        self.backView.addSubview(self.betLabel)
        self.backView.addSubview(self.resultLabel)
        self.backView.addSubview(self.numberScreenLabel)
        self.backView.addSubview(self.dateLabel)
        self.backView.addSubview(self.championShipLabel)
        self.backView.addSubview(self.matchLabel)
        self.backView.addSubview(self.indexLabel)
        self.backView.addSubview(self.firstTimeLabel)
        self.backView.addSubview(self.typeOfBetLabel)
        
        self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        self.photoImage.topAnchor.constraint(equalTo: self.backView.topAnchor).isActive = true
        self.photoImage.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor).isActive = true
        self.photoImage.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor).isActive = true
        self.photoImage.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor).isActive = true
       
        self.backView.heightAnchor.constraint(equalToConstant: 253).isActive = true
        
        
        self.indexLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 135).isActive = true
        self.indexLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -15).isActive = true
        
        self.betLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 165).isActive = true
        self.betLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -28).isActive = true
        
        self.resultLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 194).isActive = true
        self.resultLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -28).isActive = true
        
        self.numberScreenLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 42).isActive = true
        self.numberScreenLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 90).isActive = true
        
        self.dateLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 9).isActive = true
        self.dateLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 69).isActive = true
        
        self.championShipLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 75).isActive = true
        self.championShipLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 15).isActive = true
        
        self.matchLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 95).isActive = true
        self.matchLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 15).isActive = true
        
        self.firstTimeLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 118).isActive = true
        self.firstTimeLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 15).isActive = true
        
        //self.typeOfBetLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 138).isActive = true
        self.typeOfBetLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 15).isActive = true
        
        
    }
    
    func setupValue(viewModel: ViewModel) {
        
        self.betLabel.text = viewModel.bet
        self.resultLabel.text = viewModel.result
        self.numberScreenLabel.text = viewModel.numberScreen
        self.championShipLabel.text = viewModel.championShip
        self.matchLabel.text = viewModel.match
        self.indexLabel.text = viewModel.index
        self.typeOfBetLabel.text = viewModel.typeOfBet
        self.dateLabel.text = viewModel.dateScreen
        
        //imageView.image = UIImage(named: "ScreenEmpty_2.png")
        //self.photoImage.image = UIImage(named: viewModel.image)
        
        var constant = 0
        if viewModel.typeOfTime == 0 {
            self.firstTimeLabel.isHidden = false
            constant = 138
        } else {
            self.firstTimeLabel.isHidden = true
            
            if viewModel.typeOfBet != "Тотал (0.5) Б" {
                constant = 122
            } else {
                constant = 130
            }
        }
        
        self.typeOfBetLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: CGFloat(constant)).isActive = true
        
    }
    
    func changeImage(name: String) {
        self.photoImage.image = UIImage(named: name)
    }
    
}
