//
//  CityViewController.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 19.12.22.
//

import UIKit

class CityViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var cityManager: CityManagerProtocol!
    private var cities: [String] = []
    
    // MARK: - Internal Properties
    var countryName: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getCityName()
    }
    
    // MARK: - Functions
    private func registerCell() {
        tableView.register(UINib(nibName: CellIds.city, bundle: nil), forCellReuseIdentifier: CellIds.city)
        tableView.dataSource = self
    }
    
    private func getCityName() {
        cityManager =  CityManager()
        cityManager.fetchCity(with: EndPoint.city, countryName: countryName ?? "") { array in
            DispatchQueue.main.async {
                self.cities = array.data
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.city, for: indexPath) as? CityCell
        cell?.configure(with: cities[indexPath.row])
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: VCIds.weather, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: VCIds.weather) as? WeatherViewController {
            vc.name = cities[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
