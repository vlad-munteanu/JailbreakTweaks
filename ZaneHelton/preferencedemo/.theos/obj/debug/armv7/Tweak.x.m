#line 1 "Tweak.x"
@import UIKit;
@import Foundation;

@interface SBLockScreenViewController : UIViewController
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBLockScreenViewController; 
static void (*_logos_orig$_ungrouped$SBLockScreenViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBLockScreenViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewController* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 7 "Tweak.x"


static void _logos_method$_ungrouped$SBLockScreenViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    _logos_orig$_ungrouped$SBLockScreenViewController$viewWillAppear$(self, _cmd, arg1);
    
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0,0,250,250)];
    [statusView setBackgroundColor:[UIColor blackColor]];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:statusView.frame]; 
    [statusLabel setTextColor:[UIColor whiteColor]];
    
    
    
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

;

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBLockScreenViewController = objc_getClass("SBLockScreenViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$SBLockScreenViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewController$viewWillAppear$);} }
#line 36 "Tweak.x"
