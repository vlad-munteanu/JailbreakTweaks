@import UIKit;

@interface SBLockScreenViewControllerBase : UIViewController
@end
// testing
%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
    %orig;
    // Our Code

    // Get color of date and font size and set the same for our label
    CGRect labelFrame = CGRectMake((self.view.frame.size.width/2) - 100,self.view.frame.size.height * 0.5,200,44);
    UILabel *budgetLabel = [[UILabel alloc] initWithFrame:labelFrame];

    budgetLabel.backgroundColor = [UIColor clearColor];
    budgetLabel.textColor = [UIColor whiteColor];

    // TODO: Change to adjusting font size
    budgetLabel.font = [UIFont systemFontOfSize:30];

    // TODO: Text from function
    // budgetLabel.text = currentBudget
    budgetLabel.text = @"1,234,567,891";

    // Figure out how to center this, kind of like snapkit for Obj C   
    [self.view addSubview:budgetLabel];
    // [budgetLabel release];
    
}

%new
- (NSString *)currentBudget {
    
    return @"1,234,567,891";
}

%end
