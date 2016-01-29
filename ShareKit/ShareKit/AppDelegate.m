//
//  AppDelegate.m
//  ShareKit
//
//  Created by gideon on 1/28/16.
//  Copyright © 2016 gideon. All rights reserved.
//

#import "AppDelegate.h"
#import <TencentOpenAPI/TencentOAuth.h>


@interface AppDelegate () <TencentSessionDelegate>
@property (nonatomic, retain)TencentOAuth *oauth;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *appid = @"222222";
    _oauth = [[TencentOAuth alloc] initWithAppId:appid
                                     andDelegate:nil];
//    NSArray *_permissions =  [NSArray arrayWithObjects:kOPEN_PERMISSION_ADD_SHARE, nil];
//    [_oauth authorize:_permissions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{

}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{

}

@end
