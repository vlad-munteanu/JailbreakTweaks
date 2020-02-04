//
//  myTweak.m
//  test
//
//  Created by Vlad Munteanu on 1/5/20.
//  Copyright © 2020 Vlad Munteanu. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>
#import "myTweakAutoHook.h"

@interface HOOKSpringBoard : NSObject <AutoHook>
@end

@implementation HOOKSpringBoard

+ (NSArray *)targetClasses {
    return @[@"SpringBoard"];
}

- (void)hook_applicationDidFinishLaunching:(id)fp8 {
    [self original_applicationDidFinishLaunching:fp8];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello!" message:@"I'm an alert that was shown on the SpringBoard by hooking without logos!" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
    
}

- (void)original_applicationDidFinishLaunching:(id)fp8 { }

@end
