#include "XXXRootListController.h"

@implementation XXXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

 //   [[XXXCustomCell appearanceWhenContainedInInstancesOfClasses:
   //        @[[XXXRootListController class]]] setBackgroundColor:[UIColor blackColor]];
	return _specifiers;
}

-(void)openGithub {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"http://github.com/theos"]
     options:@{}
     completionHandler:nil];
    
}
@end
