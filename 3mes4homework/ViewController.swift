//
//  ViewController.swift
//  3mes4homework
//
//  Created by Нуридин Сафаралиев on 29/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    
    
    var adress: [String] = []
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var price: Int = 0 {
        didSet {
            priceLabel.text = "\(price)"
            priceView.backgroundColor = .lightGray
            adressLabel.text = "Адреса:"
            priceTitleLabel.text = "Цена:"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 50
        buttonView.layer.cornerRadius = 50
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
        tableView.backgroundColor = UIColor.clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
        
        priceView.layer.cornerRadius = 15
        priceView.backgroundColor = UIColor.clear
        
    }

    @IBAction func addAdress(_ sender: Any) {
        
        var alertTextfield = UITextField()
        
        let alert = UIAlertController(title: "Новый адрес", message: "Напишите", preferredStyle: .alert)
        alert.addTextField { textfield in
            alertTextfield = textfield
        }
        
        let otmena = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        let ok = UIAlertAction(title: "Добавить", style: .cancel) { [self] okAction in
            self.adress.append(alertTextfield.text ?? ".")
            if self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex) == "Эконом"{
                let randomPrice = Int.random(in: 100...200)
                price += randomPrice
            } else {
                let randomPrice = Int.random(in: 200...400)
                price += randomPrice
            }
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(ok)
        alert.addAction(otmena)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adress.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        cell.textLabel?.text = adress[indexPath.row]
        cell.layer.cornerRadius = 100
        cell.contentView.backgroundColor = UIColor.lightGray
            return cell
    }

}
