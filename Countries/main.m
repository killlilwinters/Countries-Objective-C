//
//  main.m
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//

#import <UIKit/UIKit.h>
#import "SceneDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([SceneDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
