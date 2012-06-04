//
//  KPNotificationBanner.h
//  KPNotificationTest
//
//  Created by Kiran Panesar on 04/06/2012.
//  Copyright (c) 2012 adappt Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

typedef enum
{
    KPNotificationTypeError = 0,
    KPNotificationTypeSuccess = 1,
} KPNotificationType;

@interface KPNotificationBanner : UIView {
    UIImageView *notificationBannerImageView;
    UIImageView *notificationIconImageView;
    
    UILabel *notificationCaption;
    
    UIView *parentView;
    
    NSTimeInterval hideTime;
    NSString *notificationTitle;
    KPNotificationType notificationType;
}

-(void)showNotification;
-(void)hideNotification;
-(void)playSoundFile:(NSString *)file ofType:(NSString *)type;

-(id)initWithParentView:(UIView *)pView notificationType:(KPNotificationType)type caption:(NSString *)caption andHideAfter:(NSTimeInterval)hideAfter;

@end
