//
//  LightInfo.swift
//  Colorchanging light
//
//  Created by Sam Burrell on 5/3/18.
//  Copyright © 2018 Sam Burrell. All rights reserved.
//

import Foundation
import HomeKit

class LightControl : NSObject, HMHomeManagerDelegate {
    
    var hmManager : HMHomeManager?
    var hmLights : [HMService]?
    
    override init() {
        
        super.init()
        hmManager = HMHomeManager()
        hmManager!.delegate = self
    }
    
    func homeManagerDidUpdateHomes(_ hmManager: HMHomeManager) {
        
        hmLights = hmManager.primaryHome?.servicesWithTypes([HMServiceTypeLightbulb])
    }
    
    func colorLights(_ color: UIColor) {
        
        DispatchQueue.global().async(execute: {
            
            var brightness : CGFloat = 0.0
            var hue : CGFloat = 0.0
            var saturation : CGFloat = 0.0
            var alpha : CGFloat = 0.0
            
            color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            
            let adjustedBrightness : CGFloat = brightness * 100.0
            let adjustedHue : CGFloat = hue * 360
            let adjustedSaturation : CGFloat = saturation * 100.0
            
            
            for hmLight in self.hmLights! {
                
                for characteristic in hmLight.characteristics {
                    
                    switch characteristic.characteristicType {
                        
                    case HMCharacteristicTypePowerState:
                        characteristic.writeValue(true, completionHandler:{_ in })
                    case HMCharacteristicTypeBrightness:
                        characteristic.writeValue(adjustedBrightness, completionHandler:{_ in })
                    case HMCharacteristicTypeHue:
                        characteristic.writeValue(adjustedHue, completionHandler:{_ in })
                    case HMCharacteristicTypeSaturation:
                        characteristic.writeValue(adjustedSaturation, completionHandler:{_ in })
                    default:
                        break
                    }
                }
            }
        })
    }
}


