//
//  WorldRegionEnum.h
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//
// https://stackoverflow.com/questions/707512/what-is-a-typedef-enum-in-objective-c
//

#ifndef WorldRegionEnum_h
#define WorldRegionEnum_h

#import <Foundation/Foundation.h>

typedef enum WorldRegion: NSUInteger {
    WorldRegionAntarctic,
    WorldRegionAfrica,
    WorldRegionAmericas,
    WorldRegionAsia,
    WorldRegionEurope,
    WorldRegionOceania
} WorldRegion;


static inline NSString * _Nonnull NSStringFromWorldRegion(WorldRegion region) {
    switch (region) {
        case WorldRegionAntarctic:
            return @"antarctic";
        case WorldRegionAfrica:
            return @"africa";
        case WorldRegionAmericas:
            return @"americas";
        case WorldRegionAsia:
            return @"asia";
        case WorldRegionEurope:
            return @"europe";
        case WorldRegionOceania:
            return @"oceania";
    }
    return @"unknown";
}

#endif /* WorldRegionEnum_h */
