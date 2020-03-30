//
//  FormViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/10.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    let collectionView: UICollectionView
    
    private let layout: UICollectionViewFlowLayout
    
    let formTitleAr = ["編號", "最大震度", "詳細資訊"]
    
    var EarthquakeAr: [RecentData] = []
    
    var numberAr: [String] = []
    
    var checkForm = true
    var checkColors = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        collectionView.isScrollEnabled = false
        
        setupFormApi()
        
    }
    
    //init layout
    init() {
        self.layout = UICollectionViewFlowLayout()
        
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.layer.borderWidth = 2
        
        let nib = UINib(nibName: "FormViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "FormCell")
        
        view.addSubview(collectionView)
    }
    
}

extension FormViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return (numberAr.count * 3) + 3
        return numberAr.count
        //        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FormCell", for: indexPath) as! FormViewCell
        
        cell.dataLabel.text = numberAr[indexPath.row]

        let num = Double(numberAr[indexPath.row])
        
        if let colorNum = num {
            if colorNum > 5 {
                if colorNum < 10 {
                    checkColors = true
                }
            }
        }
        
        if indexPath.item > 1 {
            if indexPath.item % 3 == 0 {
                if checkColors {
                    cell.backgroundColor = .yellow
                } else {
                    cell.backgroundColor = .green
                }
                
            }
        }
        
        return cell
    }
}

extension FormViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: collectionView.frame.width / 3, height: self.collectionView.frame.height / 11)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension FormViewController {
    
    func setupFormApi() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://www.ktrade.io/fangzai//common/getEqEventList") else {
            fatalError("url error")
        }
        
        do  {
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { (data, response, err) in
                
                //EarthquakeModels
                if let err = err {
                    print("error: ", err)
                } else {
                    if let data = data {
                        do {
                            let returnData = try JSONDecoder().decode(EarthquakeModels.self, from: data)
//                            print(returnData)
                            for json in returnData.datas {
                                self.EarthquakeAr.append(json)
                            }
                            
                            for j in self.EarthquakeAr {
                                if self.checkForm {
                                    let numbers = "編號"
                                    let bigEarthquake = "最大震度"
                                    let details = "詳細資訊"
                                    
                                    self.numberAr.append(numbers)
                                    self.numberAr.append(bigEarthquake)
                                    self.numberAr.append(details)
                                    self.checkForm = false
                                }
                                
                                let values = String(j.value)
                                let earthquakeNos = j.earthquakeNo
                                let locations = j.location
                                
                                self.numberAr.append(earthquakeNos)
                                self.numberAr.append(values)
                                self.numberAr.append(locations)
                            }
                            
                        } catch {
                            print("err",err ?? error)
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
                
            }
            task.resume()
        } catch {
            print("err")
        }
        
        
    }
    
    
    
    
}
