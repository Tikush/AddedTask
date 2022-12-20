//
//  ViewController.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 17.12.22.
//

import UIKit

class CountryViewController: UIViewController {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var manager: CountryManagerProtocol!
    private var countries = [Country.Data]()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getCountry()
    }
    
    // MARK: - Functions
    private func registerCell() {
        tableView.register(UINib(nibName: CellIds.country, bundle: nil), forCellReuseIdentifier: CellIds.country)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getCountry() {
        manager = CountryManager()
        
        manager.fetchCountry(with: EndPoint.country) { country in
            DispatchQueue.main.async {
                self.countries = country.data
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.country, for: indexPath) as? CountryCell
        cell?.configure(with: countries[indexPath.row])
        return cell!
    }
}

extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: VCIds.city, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: VCIds.city) as? CityViewController {
            vc.countryName = countries[indexPath.row].name
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


