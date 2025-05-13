//
//  ViewController.h
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"

@interface MainViewController : UIViewController

@property (strong, nonnull) NetworkManager * networkManager;
@property (nonnull) UILabel * label;
@property (nonnull) UIButton * updateButton;

@end

