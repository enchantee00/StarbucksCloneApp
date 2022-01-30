//
//  ViewController.swift
//  Clone<week2>
//
//  Created by 정지윤 on 2021/12/02.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    var locationManager: CLLocationManager?
    var currentLocation: CLLocationCoordinate2D!
    
    func requestAuthorization() {
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.requestWhenInUseAuthorization()
            locationManager!.delegate = self
            locationManagerDidChangeAuthorization(locationManager!)
        } else{
            locationManager!.startMonitoringSignificantLocationChanges() // 사용자의 위치가 바뀌는지 모니터링 해주는 메소드
        }
    }
    
    override func viewDidLoad() {
        print("1stviewDidLoad")
        super.viewDidLoad()
        self.backBarButtonItem.tintColor = .gray
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        let authorization = self.storyboard?.instantiateViewController(withIdentifier: "authorization") as! PopUpPrivacyViewController
        let popupAd = self.storyboard?.instantiateViewController(withIdentifier: "initialreservation") as! PopUpReservationViewController
        
        let checkAuth = UserDefaults.standard.bool(forKey: "Auth")
        let checkPopUpAd = UserDefaults.standard.bool(forKey: "check")
        
        if !checkAuth {
            authorization.modalPresentationStyle = .overCurrentContext
            authorization.modalTransitionStyle = .crossDissolve
            self.present(authorization, animated: true, completion: nil)
        }
        if !checkPopUpAd {
            popupAd.modalPresentationStyle = .overFullScreen
            popupAd.modalTransitionStyle = .crossDissolve
            self.present(popupAd, animated: true, completion: nil)
        }
    
    }
    
}

class LocationService {
    
    static var shared = LocationService()
    var longitude:Double!
    var latitude:Double!
  
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locationManager!.location?.coordinate
            LocationService.shared.longitude = currentLocation.longitude
            LocationService.shared.latitude = currentLocation.latitude
        }
    }
}


