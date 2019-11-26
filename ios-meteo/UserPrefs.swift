import Foundation

class UserPrefs {
    static var instance: UserPrefs?
    let preferences = UserDefaults.standard
    
    static let PREFIX_KEY = "com.weather.KEY"
    static let CITIES_KEY = "\(PREFIX_KEY)_CITIES"
    
    public static func getInstance() -> UserPrefs {
        if(instance == nil) {
            instance = UserPrefs()
        }
        
        return instance!
    }
    
    public func addCity(_ city: String) {
        var cities:[String] = getCities()
        for registeredCity in cities {
            if(registeredCity.lowercased() == city.lowercased()) {
                return;
            }
        }
        cities.append(city)
        setCities(cities)
    }
    
    public func setCities(_ cities: [String]) {
        preferences.set(cities, forKey: UserPrefs.CITIES_KEY)
        preferences.synchronize()
    }
    
    public func getCities() -> [String] {
        if(preferences.array(forKey: UserPrefs.CITIES_KEY) as? [String] == nil) {
            return []
        }
        
        return preferences.array(forKey: UserPrefs.CITIES_KEY) as! [String]
    }
}
