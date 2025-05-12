//
//  ViewController.m
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import "MainViewController.h"

@implementation MainViewController

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
    self.label = [[UILabel alloc] init];
    self.label.text = @"Hello, Objective-C!";
    
    // Button
    self.updateButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.updateButton setTitle: @"Update" forState: UIControlStateNormal];
    [self.updateButton setFrame: CGRectMake(50, 50, 30, 30)];
    [self.updateButton addTarget: self action: @selector(updateLabel) forControlEvents: UIControlEventTouchUpInside];
}

- (void)addSubviews {
    [self.view addSubview: self.label];
    [self.view addSubview: self.updateButton];
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
}

- (void)updateLabel {
    self.label.text = @"Button was pressed!";
    [self.updateButton setEnabled: NO];
}


@end
