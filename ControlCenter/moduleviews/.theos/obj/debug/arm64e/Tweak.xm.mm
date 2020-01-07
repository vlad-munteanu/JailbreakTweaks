#line 1 "Tweak.xm"
@import UIKit;

@interface CCUIModuleCollectionViewController : UIViewController {
    
    
    
    NSDictionary* _moduleContainerViewByIdentifier;
    
}

- (void)viewWillAppear:(BOOL)arg1;
@end

@interface CCUIContentModuleContainerView : UIView
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

@class CCUIModuleCollectionViewController; @class CCUIContentModuleContainerView; 
static void (*_logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL, BOOL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIContentModuleContainerView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIContentModuleContainerView"); } return _klass; }
#line 17 "Tweak.xm"


static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$(self, _cmd, arg1);

    NSLog(@"Hey Vlad Vlad!");
    NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
    for(NSString *key in moduleDictionary) {
        id val = moduleDictionary[key];
        
        if([val isMemberOfClass:[_logos_static_class_lookup$CCUIContentModuleContainerView() class]]) {
            [val setBackgroundColor:[UIColor redColor]];
        }
    }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CCUIModuleCollectionViewController = objc_getClass("CCUIModuleCollectionViewController"); MSHookMessageEx(_logos_class$_ungrouped$CCUIModuleCollectionViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewWillAppear$);} }
#line 35 "Tweak.xm"
