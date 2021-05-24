//
//  BrandViewController.swift
//  DemoBrand
//
//  Created by Thân Văn Thanh on 24/05/2021.
//

import UIKit

class BrandViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var filteredTableData = [BrandEntity]()
    var indexSelected: Int!

    var data = [BrandEntity](){
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        setupView()
        
    }
    
    private func setupView(){
        title = "Brand"
        tableView.register(UINib(nibName: "BrandTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        searchBar.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        data = creatBrand()
        
    }
    @objc func addTapped() {
        // Hứng closure
        let createVC = CreatBrandViewController()
        
        createVC.brandEdit = {
            [weak self] post in
            guard let strongSelf = self else {
                return
            }
            strongSelf.data.append(post)
            strongSelf.tableView.reloadData()
        }
        
        navigationController?.pushViewController(createVC, animated: true)    }
    func navigateToDetail(_ brand: BrandEntity) {
        let detailVC = DetailViewController()
        detailVC.brand = brand
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
extension BrandViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
extension BrandViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as? BrandTableViewCell else {return BrandTableViewCell()}
        cell.selectionStyle = .none
        cell.brand = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.brand = data[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
        }
    }
}
extension BrandViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

