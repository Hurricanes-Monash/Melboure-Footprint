//
//  VCMapView.swift
//  HonoluluArt
//
//  Created by Audrey M Tam on 17/10/2014.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import MapKit

extension MapViewController: MKMapViewDelegate {
    
    
    
    func mapView(mapView: MKMapView,
                 viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
        if let annotation = annotation as? ArtworkForMap {
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                //print("zai zhe")
                view.image = UIImage(named:"custom_pin.png")
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
                view.leftCalloutAccessoryView = UIButton(type: .InfoDark) as UIView
               // view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "list tab"))
            }
            
           // view.pinColor = annotation.pinColor()

            
            return view
        }
        return nil
    }
    
//    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlViewTapped control: UIControl) {
//
////        if control == view.rightCalloutAccessoryView {
////            self.awork = view.annotation as! ArtworkForMap
////            performSegueWithIdentifier("tothemoon", sender: self)
////
////        }
//        
//            self.awork = view.annotation as! ArtworkForMap
//            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//            awork!.mapItem().openInMapsWithLaunchOptions(launchOptions)
//        
//        
//    }
    
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
 
        if control == view.rightCalloutAccessoryView {
                        self.awork = view.annotation as! ArtworkForMap
                        performSegueWithIdentifier("tothemoon", sender: self)
            
                    }

        if control == view.leftCalloutAccessoryView {
                    self.awork = view.annotation as! ArtworkForMap
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                    awork!.mapItem().openInMapsWithLaunchOptions(launchOptions)
        }
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tothemoon"
        {
          
            let controller: ViewDetailsController = segue.destinationViewController
                as! ViewDetailsController
            for work in reallartworks{
                if awork?.title == work.Name{
                    reallart = work
                }
                
            }
            
             controller.currentArtwork = self.reallart
            controller.hidesBottomBarWhenPushed = true
        }
    }
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "toTheMoon" {
    //            let controller = segue.destinationViewController as! DetailViewController
    //
    //        }
    //    }
    //
    
    
    //  func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    //    let location = view.annotation as! Artwork
    //    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
    //    location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    //  }
    
}
