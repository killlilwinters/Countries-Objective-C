//
//  NetworkManager.h
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import <Foundation/Foundation.h>
#import "WorldRegionEnum.h"
#import "NameOnlyCountry.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^FetchCompletionBlock)(NSArray<NameOnlyCountry *> * _Nullable countries, NSError * _Nullable error);

@interface NetworkManager : NSObject

@property (nonatomic, strong, nonnull, retain) NSString * baseAPIEndpoint;

- (void)sendRequestForCountriesForWorldRegion: (enum WorldRegion)region
                            completionHandler: (FetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
