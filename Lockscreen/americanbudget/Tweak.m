@import UIKit;

@interface SBLockScreenViewControllerBase : UIViewController
@end

%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
    %orig;
    
    // Our Code
    CGRect labelFrame = CGRectMake(10,10,200,44);
    UILabel *budgetLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
    budgetLabel.backgroundColor = [UIColor clearColor];
    budgetLabel.textColor = [UIColor blackColor];
    
    // TODO: Change to adjusting font size
    budgetLabel.font = [UIFont systemFontOfSize:16];
    
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
