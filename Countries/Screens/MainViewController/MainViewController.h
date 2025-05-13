//
//  ViewController.h
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import <UIKit/UIKit.h>
#import "Countries-Swift.h"

@interface MainViewController : UIViewController

//@property (strong, nonnull) NetworkManager * networkManager;
@property (strong, nonnull) NewNetworkManager * networkManager;
@property (nonnull) UILabel * label;
@property (nonnull) UIButton * updateButton;

@property (nonnull) UIButton * pushEuropeButton;
@property (nonnull) UIButton * pushAmericasButton;

@end

