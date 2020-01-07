#line 1 "Tweak.xm"
#include <IOKit>

@interface BCBatteryDeviceController : NSObject {
    NSArray *_sortedDevices;
}

+(id)sharedInstance;
@end

@interface BCBatteryDevice : NSObject {
    long long _percentCharge;
    NSString *_identifier;
}
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

@class UIViewController; @class BCBatteryDeviceController; 
static void (*_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^)(void)); static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^)(void)); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$BCBatteryDeviceController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("BCBatteryDeviceController"); } return _klass; }
#line 16 "Tweak.xm"



static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * viewControllerToPresent, BOOL flag, void (^completion)(void)) {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *ac = (UIAlertController *)viewControllerToPresent;
        
        BCBatteryDeviceController *bcb = [_logos_static_class_lookup$BCBatteryDeviceController() sharedInstance];
        NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");
        
        NSMutableString *newMessage = [NSMutableString new];
        NSLog(@"Hey Vlad Vlad!");        
        IOLog(@"we out here 0x7D1");
        for (BCBatteryDevice *device in devices) {
            
            NSString *deviceName = [device valueForKey:@"_name"];
            
            
            long long deviceCharge = MSHookIvar<long long>(device, "_percentCharge");
            
            
            [newMessage appendString:[NSString stringWithFormat:@"%@ : %lld%%\n", deviceName, deviceCharge]];
            [ac setMessage:newMessage];
            return _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, ac, flag, completion);
            
        }
        
    } else {
        return _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, viewControllerToPresent, flag, completion);
    }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIViewController = objc_getClass("UIViewController"); MSHookMessageEx(_logos_class$_ungrouped$UIViewController, @selector(presentViewController:animated:completion:), (IMP)&_logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$, (IMP*)&_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$);} }
#line 48 "Tweak.xm"
