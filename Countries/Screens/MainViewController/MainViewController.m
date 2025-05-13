//
//  ViewController.m
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import "MainViewController.h"
#import "WorldRegionEnum.h"
#import "CountriesTableViewController.h"

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    // Network
    self.networkManager = [[NewNetworkManager alloc] init];
    // UI
    self.label = [[UILabel alloc] init];
    self.updateButton = [UIButton buttonWithType: UIButtonTypeSystem];
    self.pushEuropeButton = [UIButton buttonWithType: UIButtonTypeSystem];
    self.pushAmericasButton = [UIButton buttonWithType: UIButtonTypeSystem];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self setupViews];
    [self addSubviews];
    [self constraintLayout];
}

- (void)setupViews {
    // Label
    self.label.text = @"Hello, Objective-C!";
    
    // Update Label Button
    [self.updateButton setTitle: @"Update" forState: UIControlStateNormal];
    [self.updateButton setFrame: CGRectMake(50, 50, 30, 30)];
    [self.updateButton addTarget: self action: @selector(updateLabel) forControlEvents: UIControlEventTouchUpInside];
    
    // Push Europe Button
    [self.pushEuropeButton setTitle: @"Europe" forState: UIControlStateNormal];
    [self.pushEuropeButton setFrame: CGRectMake(50, 50, 30, 30)];
    [self.pushEuropeButton addTarget: self action: @selector(pushCountryList:) forControlEvents: UIControlEventTouchUpInside];
    self.pushEuropeButton.tag = WorldRegionEurope;
    
    // Push Americas Button
    [self.pushAmericasButton setTitle: @"Americas" forState: UIControlStateNormal];
    [self.pushAmericasButton setFrame: CGRectMake(50, 50, 30, 30)];
    [self.pushAmericasButton addTarget: self action: @selector(pushCountryList:) forControlEvents: UIControlEventTouchUpInside];
    self.pushAmericasButton.tag = WorldRegionAmericas;
}

- (void)addSubviews {
    [self.view addSubview: self.label];
    [self.view addSubview: self.updateButton];
    [self.view addSubview: self.pushEuropeButton];
    [self.view addSubview: self.pushAmericasButton];
}

- (void)constraintLayout {
    // Label
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [_label.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [_label.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor]
    ]];
    
    // Update Button
    self.updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [_updateButton.topAnchor constraintEqualToAnchor: self.label.bottomAnchor constant: 10],
        [_updateButton.centerXAnchor constraintEqualToAnchor: self.label.centerXAnchor]
    ]];
    
    // Push Europe Button
    self.pushEuropeButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [_pushEuropeButton.topAnchor constraintEqualToAnchor: self.updateButton.bottomAnchor constant: 10],
        [_pushEuropeButton.centerXAnchor constraintEqualToAnchor: self.updateButton.centerXAnchor]
    ]];
    
    // Push Americas Button
    self.pushAmericasButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [_pushAmericasButton.topAnchor constraintEqualToAnchor: self.pushEuropeButton.bottomAnchor constant: 10],
        [_pushAmericasButton.centerXAnchor constraintEqualToAnchor: self.pushEuropeButton.centerXAnchor]
    ]];
}

- (void)updateLabel {
    self.label.text = @"Button was pressed!";
    [self.updateButton setEnabled: NO];
}

- (void)pushCountryList:(UIButton *)sender {
    CountriesTableViewController * countriesScreen = [[CountriesTableViewController alloc] initWithNetworkManager: self.networkManager countiesInRegion: sender.tag];
    
    [self.navigationController pushViewController: countriesScreen animated: YES];
    
    return;
}

@end
