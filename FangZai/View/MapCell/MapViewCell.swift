//
//  MapViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/9.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let formViewController = FormViewController()
    var locations: [Double: Double] = [:]
    var EarValue: [Double] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //                backgroundColor = .yellow
        
        // 設置右下角，我的位置
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        loadData()
        loadView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 23.850888, longitude: 120.922486, zoom: 7)
        //        let mapViews = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera

        //                let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: 23.850888, longitude: 120.922486))
        //                marker.title = "震央"
        //                marker.snippet = "震央強度：" + "5"
        //                marker.map = mapView
    }
    
    func loadData() {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://www.ktrade.io/fangzai//common/getEqEventList") else { return }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { (data, response, err) in
                
                if let err = err {
                    print("error: ", err)
                } else {
                    if let data = data {
                        do {
                            let returnData = try JSONDecoder().decode(EarthquakeModels.self, from: data)
                            
                            for json in returnData.datas {
                                self.locations[json.latitude] = json.longitude
                            }
                            for values in returnData.datas {
                                self.EarValue.append(values.value)
                                
                            }
                            
                            DispatchQueue.main.async {
                                for (lat,lng) in self.locations {
                                    let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat, longitude: lng))
                                    marker.title = "震央"
                                    marker.map = self.mapView
                                }

                            }
                            
                        } catch {
                            
                        }
                    }
                }
            }
            task.resume()
        } catch {
            print(error)
        }
        
        
        
        
        
    }
    
    
}
