//
//  MainViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/4.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit
import GoogleMaps

//protocol WeatherDataDelegate {
//    func weatherModels(models: [NextWeather])
//}

class MainViewController: UIViewController,CityViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellId = "cellId"
    var models = [NextWeather]()
    
    var airApi: Int = 0
    var requestStr: String = "基隆市"
    var cityNameCheck: Bool = false
    var maxT: String? = ""
    var minT: String? = ""
    var poP12h: String? = ""
    var uvi: Int = 0
    
    let citysViewController = CitysViewController()
    let loadingViewController = LoadingViewController()
    var weatherCountryNum = 1
    var smallCollectionViewControllers = [
        WeatherViewController()
    ]
    
    var formCollecionViewControllers = [
        FormViewController()
    ]
    
    var arS = ["基隆市": 0,"沒": 1,"我": 2,"他": 3,"好": 4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(googleApiKey)
        loadingViewController.showView()
        setupTableView()
        setupNavLeftButton()
        //選取城市的天氣，判斷城市 -> countryId
        setupWeatherApi(countryId: weatherCountryNum)
        //選取城市的空氣品質，判斷城市 -> countryId
        setupAirApi(countryId: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        let nib = UINib(nibName: "MainViewCell", bundle: nil)
        let nib2 = UINib(nibName: "AirViewCell", bundle: nil)
        let nib3 = UINib(nibName: "UltravioletViewCell", bundle: nil)
        let nib4 = UINib(nibName: "MapViewCell", bundle: nil)
        let nib5 = UINib(nibName: "FormTableViewCell", bundle: nil)
        
        self.tableView.register(nib, forCellReuseIdentifier: "MainCell")
        self.tableView.register(nib2, forCellReuseIdentifier: "AirCell")
        self.tableView.register(nib3, forCellReuseIdentifier: "UVCell")
        self.tableView.register(nib4, forCellReuseIdentifier: "MapCell")
        self.tableView.register(nib5, forCellReuseIdentifier: "FormTableCell")
    }

    fileprivate func setupNavLeftButton() {
        let settingBarItem = UIBarButtonItem(image: UIImage(named: "icSettings"), style: .plain, target: self, action: #selector(settingAction))
        settingBarItem.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem =  settingBarItem
    }

    //go to next controoler
    @objc func settingAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "AccountVC") as! AccountViewController
        self.navigationController?.pushViewController(controller, animated: true)
        UIWindow.key?.makeKeyAndVisible()
    }
    
    let selectCountryBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "icMenu").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let headersLabel: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.black
        lab.font = UIFont.boldSystemFont(ofSize: 40)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    @objc func buttonClicked(sender:UIButton) {
        
        citysViewController.delegate = self
        citysViewController.showCity()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainViewCell
            tableView.rowHeight = view.frame.height * 0.4
            cell.tempureLabel.text = minT! + "°~" + maxT! + "°"
            cell.rainLabel.text = poP12h! + "%"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AirCell", for: indexPath) as! AirViewCell
            tableView.rowHeight = view.frame.height * 0.13
            
            if airApi > 100 {
                cell.views.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                cell.airTextLabel.text = "對敏感族群不健康"
            } else if airApi < 50 {
                cell.views.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                cell.airTextLabel.text = "良好"
            } else {
                cell.views.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                cell.airTextLabel.text = "普通"
            }
            
            
            cell.airDataLabel.text = String(airApi)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UVCell", for: indexPath) as! UltravioletViewCell
            cell.uviNumLabel.text = String(uvi)
            
            if uvi > 8 {
                cell.views.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
                cell.uviLevelLabel.text = "高量級"
            } else if uvi < 3 {
                cell.views.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                cell.uviLevelLabel.text = "輕量級"
            } else {
                cell.views.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
                cell.uviLevelLabel.text = "中量級"
            }
            
            tableView.rowHeight = view.frame.height * 0.15
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapViewCell
            //            cell.backgroundColor = .black
            tableView.rowHeight = view.frame.height * 0.75
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FormTableCell", for: indexPath) as! FormTableViewCell
            if indexPath.row == 0 {
                tableView.rowHeight = view.frame.height * 0.75
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 100
        case 1:
            return 30
        case 2:
            return 30
        case 3:
            return 30
        default:
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        // code for adding centered title
        headerView.backgroundColor = UIColor.white
        let headerLabel = UILabel(frame: CGRect(x: 20, y: -5, width:
            tableView.bounds.size.width, height: 30))
        headerLabel.textColor = UIColor.black
        headerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        switch section {
        case 0:
            headersLabel.text = requestStr
        case 1:
            headerLabel.text = "空氣品質"
        case 2:
            headerLabel.text = "紫外線"
        case 3:
            headerLabel.text = "最近顯著有感地震"
        default: break
            
        }
        
        headerLabel.textAlignment = .left
        headerView.addSubview(headerLabel)
        
        
        if section == 0 {
            // code for adding button to right corner of section header
            headerView.addSubview(selectCountryBtn)
            headerView.addSubview(headersLabel)
            
            selectCountryBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 40).isActive = true
            selectCountryBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0).isActive = true
            selectCountryBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
            selectCountryBtn.heightAnchor.constraint(equalToConstant: 28).isActive = true
            
            headersLabel.setAnchor(top: headerView.topAnchor, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
            
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 顯示 collectionView
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let weatherTableViewCell = cell as! MainViewCell
            
            self.smallCollectionViewControllers[indexPath.row].collectionView.frame = weatherTableViewCell.bounds
            
            self.addChild(self.smallCollectionViewControllers[indexPath.row])
            self.smallCollectionViewControllers[indexPath.row].didMove(toParent: self)
            
            weatherTableViewCell.addSubview(smallCollectionViewControllers[indexPath.row].view)
        } else if indexPath.section == 4 {
            let formTableViewController = cell as! FormTableViewCell
            
            self.formCollecionViewControllers[indexPath.row].collectionView.frame = formTableViewController.bounds
            self.addChild(self.formCollecionViewControllers[indexPath.row])
            self.formCollecionViewControllers[indexPath.row].didMove(toParent: self)
            formTableViewController.addSubview(formCollecionViewControllers[indexPath.row].view)
        }
    }
    
    func selectCityStr(str: String, index: Int) {
        self.requestStr = str
        headersLabel.text = str
        airApi = (index + 1)
        setupAirApi(countryId: airApi)
        if index == 0 {
            setupWeatherApi(countryId: 1)
        } else if index == 1 {
            setupWeatherApi(countryId: 2)
        } else if str == "新北市" {
            setupWeatherApi(countryId: 3)
        } else if str == "桃園市" {
            setupWeatherApi(countryId: 4)
        } else if str == "新竹市" {
            setupWeatherApi(countryId: 5)
        } else if str == "新竹縣" {
            setupWeatherApi(countryId: 6)
        } else if str == "苗栗縣" {
            setupWeatherApi(countryId: 7)
        } else if str == "台中市" {
            setupWeatherApi(countryId: 8)
        } else if str == "彰化縣" {
            setupWeatherApi(countryId: 9)
        } else if str == "南投縣" {
            setupWeatherApi(countryId: 10)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension MainViewController {
    
    //天氣API
    private func setupWeatherApi(countryId: Int) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://www.ktrade.io/fangzai//common/getWeatherForecastByCountry") else {
            fatalError("url error")
        }
        
        var json = [String: Any]()
        json["countryId"] = countryId
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            //            print(data)
            
            //建立 API 連線要求
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { (data, response, err) in
                
                if let err = err {
                    //發生錯誤
                    print("Failed to get data.", err)
                } else {
                    if let data = data {
                        do {
                            let jsonData = try JSONDecoder().decode(WeatherModels.self, from: data)
                            
                            self.maxT = jsonData.datas.MaxT
                            self.minT = jsonData.datas.MinT
                            self.poP12h = jsonData.datas.PoP12h
                            self.uvi = Int(jsonData.datas.UVI)!
                            for i in jsonData.datas.forecast {
                                self.models.append(i)
                            }
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            
                        }
                    }
                }
            }
            task.resume()
            
        } catch {
            print("error")
        }
    }
}


extension MainViewController {
    
    //空氣API
    fileprivate func setupAirApi(countryId: Int) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://www.ktrade.io/fangzai//common/getAirQualityByCountry") else {
            fatalError("url error")
        }
        //回傳的格式
        var json = [String: Any]()
        json["countryId"] = countryId
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            //            print(data)
            
            //建立 API 連線要求
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { (data, response, err) in
                
                if let err = err {
                    //發生錯誤
                    print("Failed to get data.", err)
                } else {
                    if let data = data {
                        do {
                            let jsonData = try JSONDecoder().decode(AirModels.self, from: data)
                            self.airApi = jsonData.datas.aqi
                            
                            //加載數值後，要更新畫面
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("err",err ?? error)
                        }
                    }
                }
            }
            task.resume()
            
        } catch {
            print("error")
        }
    }
    
}

