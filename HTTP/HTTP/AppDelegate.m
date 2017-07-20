//
//  AppDelegate.m
//  HTTP
//
//  Created by  tianlei on 2017/7/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "NBNetwork.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //
    NBRespFilter *successFilter = [[NBRespFilter alloc] init];
    successFilter.key =  @"errorCode";
    successFilter.value =  @"0";
    
    //
    NBRespFilter *abnormalFilter = [[NBRespFilter alloc] init];
    abnormalFilter.key = @"errorInfo";
    abnormalFilter.filterMsgKey = @"errorInfo";
    
    [abnormalFilter setFilterAction:^(NBRespFilter *filter, id responseObj){
        
        
        if ([filter.value isEqual:@"4"]) {
            
            NSLog(@"需要重新登录");
            
        } else {
            
            NSLog(@"%@",filter.filterMsg);
        
        }
        //通知用户重新登录
        
    }];

    //
    NBNetworkConfig *config = [NBNetworkConfig config];
    
    config.successFilter = successFilter;
    config.abnormalRespFilter = abnormalFilter;
    
//    [config.abnormalRespFilter addObjectsFromArray:@[tokenOutOfTimeFilter]];
    
    
    //
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
