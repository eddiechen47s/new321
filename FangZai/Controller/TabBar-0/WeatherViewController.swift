//
//  WeatherViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/6.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

// 撈資料在這個controller，你可以設一個新的list，撈完後再根據自己的list去設定長度
class WeatherViewController: UIViewController {

    func selectCityIndex(index: Int) {
        self.num = index
        print(index)
    }
    
    
    let collectionView: UICollectionView
    private let layout: UICollectionViewFlowLayout
    var dateStr: Int = 0
    var subtraction: Int = 1
    
    
    // WeatherAPI property
    var weatherModels: [NextWeather] = []
    var maxT: String? = ""
    var minT: String? = ""
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        //        setupLayout()
        // 抓取日期
        currentDate()
        
        
    }
    
    init() {
        
        self.layout = UICollectionViewFlowLayout()
        
        self.layout.scrollDirection = .horizontal
        
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
        //        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        
        let nib = UINib(nibName: "WeathersViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "WeatherCell")
        
        view.addSubview(collectionView)
    }
    
    //不知道為啥設定不出來，整個 collectionView 會消失
    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -20).isActive =  true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeathersViewCell
        
        let itemCount = dateStr + indexPath.item
        print(dateStr)
        // 待改
        if indexPath.item == 0 {
            if dateStr == 1 {
                cell.dateLabel.text = "MON"
            } else if dateStr == 2 {
                cell.dateLabel.text = "TUE"
            } else if dateStr == 3 {
                cell.dateLabel.text = "WED"
            } else if dateStr == 4 {
                cell.dateLabel.text = "THU"
            } else if dateStr == 5 {
                cell.dateLabel.text = "FRI"
            } else if dateStr == 6 {
                cell.dateLabel.text = "SAT"
            } else if dateStr == 7 {
                cell.dateLabel.text = "SUN"
            }
        } else {
            if itemCount > 7 {
                let dateCount = subtraction
                if dateCount == 1 {
                    cell.dateLabel.text = "MON"
                } else if dateCount == 2 {
                    cell.dateLabel.text = "TUE"
                } else if dateCount == 3 {
                    cell.dateLabel.text = "WED"
                } else if dateCount == 4 {
                    cell.dateLabel.text = "THU"
                } else if dateCount == 5 {
                    cell.dateLabel.text = "FRI"
                } else if dateCount == 6 {
                    cell.dateLabel.text = "SAT"
                } else if dateCount == 7 {
                    cell.dateLabel.text = "SUN"
                }
                subtraction += 1
            } else {
                let dateCount = dateStr + indexPath.item
//                print(dateCount)
                if dateCount == 1 {
                    cell.dateLabel.text = "MON"
                } else if dateCount == 2 {
                    cell.dateLabel.text = "TUE"
                } else if dateCount == 3 {
                    cell.dateLabel.text = "WED"
                } else if dateCount == 4 {
                    cell.dateLabel.text = "THU"
                } else if dateCount == 5 {
                    cell.dateLabel.text = "FRI"
                } else if dateCount == 6 {
                    cell.dateLabel.text = "SAT"
                } else if dateCount == 7 {
                    cell.dateLabel.text = "SUN"
                }
            }
            
        }
//        print(weatherModels)

        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize = CGSize(width: view.frame.width / 5, height: self.collectionView.frame.height / 4)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: collectionView.frame.height / 2, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
}

extension WeatherViewController {
    
    func currentDate() -> Int {
        let currentDate = Date()
        let dataFormatter = DateFormatter()
        dataFormatter.locale = Locale(identifier: "zh_Hant_TW")
        dataFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
//        let stringDate = dataFormatter.string(from: currentDate)
//        print(stringDate)
        
        let calender = Calendar(identifier:Calendar.Identifier.gregorian)
        let comps = (calender as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: currentDate)
        
        guard let weekday = comps?.weekday else {
            fatalError("weekday Error")
        }
        dateStr = weekday
        return weekday
    }
}


extension WeatherViewController {
    
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

//                            self.maxT = jsonData.datas.MaxT
//                            self.minT = jsonData.datas.MinT
                            for i in jsonData.datas.forecast {
                                self.weatherModels.append(i)
                            }
                            print(self.weatherModels[0])
                            
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
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

