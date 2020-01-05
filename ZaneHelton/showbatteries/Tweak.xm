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

%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent
animated:(BOOL)flag
completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *ac = (UIAlertController *)viewControllerToPresent;
        
        BCBatteryDeviceController *bcb = [%c(BCBatteryDeviceController) sharedInstance];
        NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");
        
        NSMutableString *newMessage = [NSMutableString new];
        
        for (BCBatteryDevice *device in devices) {
            //NSString *deviceName = MSHookIvar<NSString *>(device, "_name");
            NSString *deviceName = [device valueForKey:@"_name"];
            // no "*" for type because deviceCharge's type is primitive
            // and does not belong to an object
            long long deviceCharge = MSHookIvar<long long>(device, "_percentCharge");
            
            // This is formatting string
            [newMessage appendString:[NSString stringWithFormat:@"%@ : %lld%%\n", deviceName, deviceCharge]];
            [ac setMessage:newMessage];
            return %orig(ac, flag, completion);
            
        }
        
    } else {
        return %orig;
    }
}
%end
