@import UIKit;

@interface CCUIModuleCollectionViewController : UIViewController {
    // Declares Variable
    // Doesn't do anything for Theos but helps us see where it belongs
    
    NSDictionary* _moduleContainerViewByIdentifier;
    // Testing
}
// Doesn't do anything, just showing it exists
- (void)viewWillAppear:(BOOL)arg1;
@end

@interface CCUIContentModuleContainerView : UIView
@end

%hook CCUIModuleCollectionViewController

- (void)viewWillAppear:(BOOL)arg1 {

    %orig;

    NSLog(@"Hey Vlad Vlad!");
    NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
    for(NSString *key in moduleDictionary) {
        id val = moduleDictionary[key];
        // checks if val is of type CCUIContentModuleContainerView
        if([val isMemberOfClass:[%c(CCUIContentModuleContainerView) class]]) {
            [val setBackgroundColor:[UIColor redColor]];
        }
    }
}

%end
