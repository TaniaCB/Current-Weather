//
//  ViewController.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentRainLabel: UILabel!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var currentCloudCoverLabel: UILabel!
    @IBOutlet weak var currentRainIntensityLabel: UILabel!
    @IBOutlet weak var currentWindSpeedLabel: UILabel!
    @IBOutlet weak var currentWindBearingLabel: UILabel!
    @IBOutlet weak var currentVisibilityLabel: UILabel!
    @IBOutlet weak var currentUVIndexLabel: UILabel!
    @IBOutlet weak var currentWindGustLabel: UILabel!
    @IBOutlet weak var currentDewPointLabel: UILabel!
    @IBOutlet weak var searchAddressTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var currentAddressLabel: UILabel!
    
    let client = DarkSkyClient()
    let location = LocationAddress()
    var currentAddress:String = "Madrid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.hideKeyboard()
        
        NotificationCenter.default.addObserver(self, selector:#selector(refreshCurrentWeather), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        getCurrentWeather(address: currentAddress)
    }
  
    @objc func refreshCurrentWeather(){
        getCurrentWeather(address: currentAddress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textEntering = textField.text
        
        if let textEntering = textEntering{
            if(!textEntering.isEmpty){
                getCurrentWeather(address: textEntering)
            }
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    func displayWeather(myCurrentWeatherViewModel: CurrentWeatherViewModel){
        currentWeatherIcon.image = myCurrentWeatherViewModel.icon
        currentTemperatureLabel.text = myCurrentWeatherViewModel.temperature
        currentHumidityLabel.text = myCurrentWeatherViewModel.humidity
        currentRainLabel.text = myCurrentWeatherViewModel.precipProbability
        currentSummaryLabel.text = myCurrentWeatherViewModel.summary
        currentWindSpeedLabel.text = myCurrentWeatherViewModel.windSpeed
        currentWindBearingLabel.text = myCurrentWeatherViewModel.windBearing
        currentRainIntensityLabel.text = myCurrentWeatherViewModel.precipIntensity
        currentCloudCoverLabel.text = myCurrentWeatherViewModel.cloudCover
        currentAddressLabel.text = currentAddress
        currentVisibilityLabel.text = myCurrentWeatherViewModel.visibility
        currentUVIndexLabel.text = myCurrentWeatherViewModel.uvIndex
        currentWindGustLabel.text = myCurrentWeatherViewModel.windGust
        currentDewPointLabel.text = myCurrentWeatherViewModel.dewPoint
    }

    func getCurrentWeatherByCoordinate(coordinate:Coordinate) {
        refreshAnimation(on: true)
        
        client.getCurrentWeather(coordinate: coordinate) { [unowned self] (currentWeather, error) in
            if let currentWeather = currentWeather{
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(myCurrentWeatherViewModel: viewModel)
                
                self.refreshAnimation(on: false)
            }
        }
    }
    
    func getCurrentWeather(address:String){
        currentAddress = address
        location.getCoordinate(addressString: address) { (currentLocation, error) in
            let currentCoordinate = Coordinate(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            self.getCurrentWeatherByCoordinate(coordinate: currentCoordinate)
        }
    }
    
    func refreshAnimation(on: Bool)->Void{
        if on{
            activityIndicator.startAnimating()
        }else{
            activityIndicator.stopAnimating()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
