//
//  CustomAVDelegate.m
//  PostingNotification
//
//  Created by FMCAdmin on 3/5/14.
//  Copyright (c) 2014 FMCAdmin. All rights reserved.
//

#import "CustomAVDelegate.h"

@implementation CustomAVDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex [%i]", buttonIndex);

    // 1. We must create an NSDictionary
    //  - Dictionary has keys and values
    //      Our Key will be called "ButtonUserClickedOn" (@"ButtonUserClickedOn")
    //      The value for this key will be call the buttonIndex #  ([NSString stringWithFormat:@"%i", buttonIndex])
    // 2. Create Notification
    //  - Notifications deliver PayLoads
    //  - The Payloads are in the format of an NSDictionary
    // 3. Post Noficication
    
    NSDictionary *payloadDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%i", buttonIndex], @"ButtonUserClickedOn", nil];
    
    NSNotification *notif = [[NSNotification alloc] initWithName:@"AlertBoxWasClicked" object:nil userInfo:payloadDict];
    
    [[NSNotificationCenter defaultCenter] postNotification:notif];
}

@end
