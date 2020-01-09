@import UIKit;

@interface CCUIModuleCollectionViewController : UIViewController {
    // Declares Variable
    // Doesn't do anything for Theos but helps us see where it belongs
    
    NSDictionary* _moduleContainerViewByIdentifier;
    // Testing
}
// Doesn't do anything, just showing it exists
- (void)viewWillAppear:(BOOL)arg1;
 
// %new
- (UIColor *)randomColor;
@end

@interface CCUIContentModuleContainerView : UIView
@end

// Global Variables in Tweak
UIView *newView;
%hook CCUIModuleCollectionViewController

- (void)viewDidAppear:(BOOL)arg1 {

    %orig;

    NSLog(@"Hey Vlad Vlad!");
    NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
    for(NSString *key in moduleDictionary) {
        id val = moduleDictionary[key];
        // checks if val is of type CCUIContentModuleContainerView
        if([val isMemberOfClass:[%c(CCUIContentModuleContainerView) class]]) {
            [val setBackgroundColor:[self randomColor]];
        }
    }
    
    // New UIView
    // This exists in memory but not on screen yet
    if (!newView) {
        newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        [newView setBackgroundColor:[self randomColor]];
    }
    
    // New Button
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [newButton setTitle:@"Press Me!" forState: UIControlStateNormal];
    [newButton setFrame:newView.frame];
    // Selector essentially
    [newButton addTarget:self action:@selector(didPressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // Control Center acts more like a scroll view
    // So we use this custom way
    [newView addSubview:newButton];
    [[[UIApplication sharedApplication] keyWindow] addSubview:newView];
    
    // Image
    UIImage *bobImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/ModuleViews.bundle/mia.png"];
    UIImageView *bobImageView = [[UIImageView alloc] initWithImage:bobImage];
    [bobImageView setFrame:CGRectMake(0, 250, 250, 250)];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:bobImageView];
}

%new
- (void)didPressButton:(UIButton *)arg1 {
    [newView setBackgroundColor:[self randomColor]];
    
}

%new
- (UIColor *)randomColor {
    // 0 - 255
    int r = arc4random_uniform(256);
    int g = arc4random_uniform(256);
    int b = arc4random_uniform(256);
    
    // f implies float divison
    return [UIColor colorWithRed: r/255.0f green: g/255.0f blue: b/255.0f alpha:1.0f];
    
    
}

%end
