//
//  CountriesTableViewController.h
//  Countries
//
//  Created by Maksym Horobets on 13.05.2025.
//

#import <UIKit/UIKit.h>
#import "NameOnlyCountry.h"
#import "NetworkManager.h"
#import "WorldRegionEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountriesTableViewController : UITableViewController

@property (strong, nonnull) NetworkManager * networkManager;
@property (strong, nonatomic) NSArray<NameOnlyCountry *> * countries;
@property WorldRegion region;

- (instancetype)initWithNetworkManager:(NetworkManager *)networkManager
                      countiesInRegion:(WorldRegion) region;

@end

NS_ASSUME_NONNULL_END
