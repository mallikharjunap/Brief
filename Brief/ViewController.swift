//
//  ViewController.swift
//  Brief
//
//  Created by Apple on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherLabel: UILabel!
    
    private var weatherModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeatherButtonTapped(_ sender: UIButton) {
        guard let cityName = cityTextField.text, !cityName.isEmpty else {
            showAlert(message: "Please enter a city name")
            return
        }
        
        weatherModel.fetchWeather(city: cityName) { [weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let weather):
                            self?.updateUI(with: weather)

                        case .failure(let error):
                            self?.showAlert(message: "Error fetching weather data: \(error.localizedDescription)")
                            
                            print("Added branch")
                        }
                    }
                }
            }
    
        private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
        }
       private func updateUI(with weather: Weather) {
            let temperature = weather.main.temp
            let description = weather.weather.first?.description ?? "N/A"

            let weatherInfo = "Current Temperature: \(temperature)°C\nCondition: \(description)"
            weatherLabel.text = weatherInfo
        }

}

