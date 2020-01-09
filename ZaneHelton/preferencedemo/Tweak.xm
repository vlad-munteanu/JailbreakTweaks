@import UIKit;
@import Foundation;

@interface SBLockScreenViewController : UIViewController
@end

%hook SBLockScreenViewController

- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0,0,250,250)];
    [statusView setBackgroundColor:[UIColor blackColor]];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:statusView.frame]; 
    [statusLabel setTextColor:[UIColor whiteColor]];
    
    
    // Getting Preference Bundle switch value
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.lesgarcons.pregerencedemopreferences"];
    
    id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];
    
    if([isEnabled isEqual:@0]) {
        statusLabel.text = @"OFF";
    } else {
        statusLabel.text = @"ON";
    }
    
    [statusView addSubview:statusLabel];
    [self.view addSubview:statusView];
}

%end;

