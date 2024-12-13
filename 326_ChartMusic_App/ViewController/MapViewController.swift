import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    struct Location {
        var latitude: CLLocationDegrees
        var longitude: CLLocationDegrees
    }
    
    var locationIndex: Int = 0
    
    let locations = [
        Location(latitude: 37.7749, longitude: -122.4194),
        Location(latitude: 40.7128, longitude: -74.0060),
        Location(latitude: 34.0195, longitude: -118.4912),
        Location(latitude: 40.7128, longitude: -74.0060),
        Location(latitude: 34.0522, longitude: -118.2437),
        Location(latitude: 40.7128, longitude: -74.0060),
        Location(latitude: 40.7128, longitude: -74.0060),
        Location(latitude: 34.0522, longitude: -118.2437),
        Location(latitude: 36.1627, longitude: -86.7816),
        Location(latitude: 40.7128, longitude: -74.0060)
    ]
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .standard
        
        // Show a specific location based on the index
        showLocation(at: locationIndex)
    }
    
    func showLocation(at index: Int) {
        guard index >= 0 && index < locations.count else {
            print("Invalid location index")
            return
        }
        
        let location = locations[index]
        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        // Add an annotation for the selected location
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Location \(index + 1)"
        mapView.addAnnotation(annotation)
        
        // Focus the map on the selected location
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
}
