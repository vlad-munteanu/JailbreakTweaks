//
//  main.m
//  TweakTesting
//
//  Created by Vlad Munteanu on 4/26/20.
//  Copyright © 2020 Vlad Munteanu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://vlad-munteanu.appspot.com/dayCount/vlad-munteanu/2020-04-27"]];
        
        NSError *error = nil;
        id object = [NSJSONSerialization
                          JSONObjectWithData:JSONData
                          options:0
                          error:&error];

        if(error) { /* JSON was malformed, act appropriately here */ }

        // the originating poster wants to deal with dictionaries;
        // assuming you do too then something like this is the first
        // validation step:
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *results = object;
            
            for(NSString *key in results) {
                NSLog(@"\n%@: %@",key,[results objectForKey:key]);
            }
            /* proceed with results as you like; the assignment to
            an explicit NSDictionary * is artificial step to get
            compile-time checking from here on down (and better autocompletion
            when editing). You could have just made object an NSDictionary *
            in the first place but stylistically you might prefer to keep
            the question of type open until it's confirmed */
        }
        else
        {
            /* there's no guarantee that the outermost object in a JSON
            packet will be a dictionary; if we get here then it wasn't,
            so 'object' shouldn't be treated as an NSDictionary; probably
            you need to report a suitable error condition */
        }
        
        
        
//        NSError *error = nil;
//        NSURLResponse *res = nil;
//        NSData *json = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&error];
//        NSInteger statusCode = ((NSHTTPURLResponse *) res).statusCode;
//        // if success
//        if (json && statusCode == 200) {
//            NSArray* data = [[NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil] objectForKey:@"data"];
//            for(int i = 0; i < data.count; i++)
//                printf("%s\n", data[1]);
//            // if failure
//        } else {
//            printf("failure");
//        }
    }
    return 0;
}

BOOL connected()
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

