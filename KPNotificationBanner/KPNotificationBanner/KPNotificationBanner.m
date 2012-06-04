//
//  KPNotificationBanner.m
//  KPNotificationTest
//
//  Created by Kiran Panesar on 04/06/2012.
//  Copyright (c) 2012 adappt Designs. All rights reserved.
//

#import "KPNotificationBanner.h"

@implementation KPNotificationBanner

-(id)initWithParentView:(UIView *)pView notificationType:(KPNotificationType)type caption:(NSString *)caption andHideAfter:(NSTimeInterval)hideAfter {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 65)];
    if (self) {
        //Initialise model iVars
        notificationType  = type;
        notificationTitle = caption;
        parentView        = pView;
        if (hideAfter)
            hideTime = hideAfter;
        
        //Initialise UI elements
        notificationBannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 65)];
        notificationIconImageView   = [[UIImageView alloc] initWithFrame:CGRectMake(3, 9, 30, 30)];
        notificationCaption         = [[UILabel alloc] initWithFrame:CGRectMake(41, 7, 213, 32)];
        
    }
    return self;
}

-(void)showNotification {
    
    UITapGestureRecognizer *tapNotification = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideNotification)];
    [self addGestureRecognizer:tapNotification];
    
    CGFloat xPos = parentView.frame.origin.x-320;
    CGFloat yPos = parentView.frame.size.height-65;
    
    [self setFrame:CGRectMake(xPos, yPos, 320, 65)];
    
    [notificationCaption setText:notificationTitle];
    [notificationCaption setBackgroundColor:[UIColor clearColor]];
    [notificationCaption setTextColor:[UIColor whiteColor]];
    
    [notificationCaption setFont:[UIFont boldSystemFontOfSize:15.0]];
    [notificationCaption setMinimumFontSize:10.0];
    [notificationCaption setAdjustsFontSizeToFitWidth:YES];
    [notificationCaption setShadowColor:[UIColor blackColor]];
    [notificationCaption setShadowOffset:CGSizeMake(0, -1)];
    
    
    //Set the image of the banner    
    if (notificationType == KPNotificationTypeSuccess) {
        [notificationBannerImageView setImage:[UIImage imageNamed:@"successbanner.png"]];
        [notificationIconImageView   setImage:[UIImage imageNamed:@"successicon.png"]];
    } else {
        [notificationBannerImageView setImage:[UIImage imageNamed:@"errorbanner.png"]];
        [notificationIconImageView   setImage:[UIImage imageNamed:@"erroricon.png"]];
    }
    [self addSubview:notificationBannerImageView];
    [self addSubview:notificationCaption];
    [self addSubview:notificationIconImageView];
    
    [parentView addSubview:self];

    [self playSoundFile:@"show_notification" ofType:@"wav"];

    [UIView animateWithDuration:0.15 animations:^(void) {
        //Slide banner in from left to right
        [self setFrame:CGRectMake(0, yPos, 320, 65)];
        
    }];
    
    //If a hide time has been specified, hide it after this point
    if (hideTime)
        [NSTimer scheduledTimerWithTimeInterval:hideTime target:self selector:@selector(hideNotification) userInfo:nil repeats:NO];

}

-(void)hideNotification {
    NSLog(@"Hiding");
    CGFloat xPos = parentView.frame.origin.x-320;
    CGFloat yPos = parentView.frame.size.height-65;
    
    [self playSoundFile:@"hide_notification" ofType:@"wav"];
    [UIView animateWithDuration:0.2 animations:^(void) {
        [self setFrame:CGRectMake(xPos, yPos, 320, 65)];
    }completion:^(BOOL finished) {
        [self removeFromSuperview]; 
    }];

}

-(void)playSoundFile:(NSString *)file ofType:(NSString *)type {
    SystemSoundID soundID; //Create an ID for the sound
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:file ofType:type]; //Get the  path to the sound file
    
    //Create sound and play sound
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
