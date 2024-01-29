//
//  WeatherViewModel.swift
//  Brief
//
//  Created by Apple on 29/01/24.
//

import Foundation
import Alamofire

class WeatherViewModel {
    
    private var weather:Weather?
    
    func fetchWeather(city:String,completion:@escaping(Result<Weather,Error>) -> Void){
        
        let api = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=YOUR_API_KEY&units=metric"

        
    
        
        AF.request(api).responseDecodable(of:Weather.self) { response in
            
            
            switch response.result{
            case .success(let decodedWeather):
                self.weather = decodedWeather
                completion(.success(decodedWeather))

            case .failure(let error):
                completion(.failure(error))
                
            }
        }
        
    
        
    }
    
    
}
