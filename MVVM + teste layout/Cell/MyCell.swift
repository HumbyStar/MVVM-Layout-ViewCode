//
//  MyCell.swift
//  MVVM + teste layout
//
//  Created by Humberto Rodrigues on 21/01/23.
//

import UIKit

class MyCell: UITableViewCell {
    
    var viewModel: CustomCellViewModel? // Ele recebe uma ViewModel secundária
    
    private weak var delegate: CustomTableViewCellDelegate?
    
    public func delegate(delegate: CustomTableViewCellDelegate?) {
        self.delegate = delegate
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [horizontalStack, lbProfession, lbSalary, lbAge])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lbName, hearthButton])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    let lbName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let lbProfession: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let lbSalary: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let lbAge: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let hearthButton: UIButton = {
        let button = UIButton()
        button.setTitle("♡", for: .normal)
        //button.setImage(UIImage(systemName:"hearth.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .leading
        button.addTarget(self, action: #selector(tappedHearthButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedHearthButton(_ sender: UIButton){
        
        guard let vm = viewModel else {return}
        
        if vm.getIsEnableHearth { //IsEnableHearth é true ?
             
            self.hearthButton.setTitleColor(.red, for: .normal)
            self.viewModel?.changeHearthState(value: false) //apos cair em true, recebe false
            print("fez o switch p/ false")
        } else {
            self.hearthButton.setTitleColor(.blue, for: .normal)
            self.viewModel?.changeHearthState(value: true) // ""
            print("fez o switch p/ true")
        }
        
        self.delegate?.tappedButton(vm.getHuman)
        
        
        //MARK: nesse ponto poderia criar no Struct "Human" um ID justamente para reconhecer qual é o Human que estará recebendo a mudança de propriedade de isEnableHearth, porém optamos trabalhar com uma public func na viewmodel da celula.
    }
    
    func configure(human: Human) {
        self.viewModel = CustomCellViewModel(data: human) // Construo o objeto aqui, pois é através dessa função que iremos receber o humano em específico.
        self.bannerImageView.image = viewModel?.getUserImage ?? UIImage()
        self.lbSalary.text = viewModel?.getSalary
        self.lbName.text = viewModel?.getName
        self.lbProfession.text = viewModel?.getProfession
        self.lbAge.text = viewModel?.getAge
        
        if self.viewModel?.getIsEnableHearth ?? false { //IsEnableHearth é true ?
            self.hearthButton.setTitleColor(.red, for: .normal)
        } else {
            self.hearthButton.setTitleColor(.blue, for: .normal)
        }
    }
}

extension MyCell: ViewCode {
    func buildHierarquic() {
        contentView.addSubview(bannerImageView)
        contentView.addSubview(verticalStack)
    }
    func setupConstraint() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            bannerImageView.widthAnchor.constraint(equalToConstant: 130),
            
            verticalStack.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStack.centerYAnchor.constraint(equalTo: bannerImageView.centerYAnchor),
        

        ])
    }
    func extrasFeatures() {
        print("")
    }
}

