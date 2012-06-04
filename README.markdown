KPNotificationBanner is a small ribbon banner for displaying notifications that I created to use in an application a while back. To get an idea for its looks, check out the attached sample project.

To show an error banner in your app you should do this:
    KPNotificationBanner *errorBanner = [[KPNotificationBanner alloc] initWithParentView:self.view 
                                                                        notificationType:KPNotificationTypeError 
                                                                                 caption:@"Caption for banner" 
                                                                            andHideAfter:4.0];
    [errorBanner showNotification];
To show a success message the process is very similar:
    KPNotificationBanner *successBanner = [[KPNotificationBanner alloc] initWithParentView:self.view 
                                                                        notificationType:KPNotificationTypeSuccess 
                                                                                 caption:@"Task Successfully Updated" 
                                                                            andHideAfter:2.0];
    [successBanner showNotification];


A sound is played when the banner is shown/hidden. This requires the inclusion of AudioToolbox.framework into the project. The only other dependency is QuartzCore.framework.

Let me know if you have any questions either by email (KiranSinghPanesar@googlemail.com) or by tweeting me (@K_Panesar).

Thanks!