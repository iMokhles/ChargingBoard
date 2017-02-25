
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <substrate.h>
#import <iMoMacros.h>
#import "ChargingBoardHeader.h"
#import "GDLoadingIndicator.h"


@interface SpringBoard : UIApplication
@property(nonatomic, getter=isBatterySaverModeActive) _Bool batterySaverModeActive;
@end


@interface SBUIController
+ (id)sharedInstanceIfExists;
+ (id)sharedInstance;
- (BOOL)isBatteryCharging;
- (BOOL)isOnAC;
- (float)batteryCapacity;
@end


@interface SBDashBoardMainPageViewController ()
- (void)cb_AddNewBattery;
- (void)cb_update;
@end

#define kCBOnACNotificationChanged @"CBOnACNotificationChanged"
#define kCBSaveStatusNotificationChanged @"CBSaveStatusNotificationChanged"

static SpringBoard *cb_sb_application() {
    
    return (SpringBoard *)[UIApplication sharedApplication];
}

static GDLoadingIndicator *cb_new_batteryView() {
    
    GDLoadingIndicator *cb_batteryView = [[GDLoadingIndicator alloc] initWithFrame:CGRectMake(0, 0, 200, 200) circleType:GDCircleTypeProgressWithBorder circleAnimationType:GDCircleAnimationTypeRunning fillerAnimationType:GDFillerAnimationTypeWavesForward];
    
    cb_batteryView.center = CGPointMake([UIScreen mainScreen].bounds.size.width  / 2,
                                     [UIScreen mainScreen].bounds.size.height / 2);
    
    return cb_batteryView;
}

GDLoadingIndicator *cb_batteryView = cb_new_batteryView();

%hook SpringBoard
-(void)_batterySaverModeChanged:(int)arg1 {
    %orig(arg1);
    
    BOOL isBatterySaverActive = [self isBatterySaverModeActive];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCBSaveStatusNotificationChanged object:nil userInfo:@{@"isBatterySaverActive": [NSNumber numberWithBool:isBatterySaverActive]}];
}
%end
%hook SBUIController
- (void)ACPowerChanged {
    %orig();
    BOOL isPlugged = [self isOnAC];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCBOnACNotificationChanged object:nil userInfo:@{@"isPlugged": [NSNumber numberWithBool:isPlugged]}];
}
%end
%hook SBDashBoardMainPageView
- (id)callToActionLabel {
    if ([[%c(SBUIController) sharedInstance] isOnAC]) {
        return nil;
    }
    return %orig();
}
%end

%hook SBDashBoardMainPageViewController
- (void)viewWillAppear:(BOOL)arg1 {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBatteryViewWithStatusInfo:) name:kCBOnACNotificationChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBatteryViewWithSaverStatus:) name:kCBSaveStatusNotificationChanged object:nil];
    %orig();
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig();
    
    if ([[%c(SBUIController) sharedInstance] isOnAC]) {
        [self cb_update];
    }
}
- (void)aggregateAppearance:(SBDashBoardAppearance *)arg1 {
    
    if ([[%c(SBUIController) sharedInstance] isOnAC]) {
        SBDashBoardComponent *dateView = [%c(SBDashBoardComponent) dateView];
        [dateView setHidden:YES];
        [arg1 addComponent:dateView];
        
        SBDashBoardComponent *pageControl = [%c(SBDashBoardComponent) pageControl];
        [pageControl setHidden:YES];
        [arg1 addComponent:pageControl];
        
        // iOS 10.0 ( ONLY )
//        SBDashBoardComponent *callToActionLabel = [%c(SBDashBoardComponent) callToActionLabel];
//        [callToActionLabel setString:@"Loka"];
//        [arg1 addComponent:callToActionLabel];
    }
    %orig(arg1);
}
- (long long)backgroundStyle {
    if ([[%c(SBUIController) sharedInstance] isOnAC]) {
        return 5;
    }
    return %orig();
}

%new
- (void)cb_AddNewBattery {
    
    if ([[%c(SBUIController) sharedInstance] isOnAC]) {
        
        BOOL isBatterySaverActive = [cb_sb_application() isBatterySaverModeActive];
        
        if (isBatterySaverActive) {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor orangeColor]]];
        } else {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor greenColor]]];
        }
        [cb_batteryView setProgress:[[%c(SBUIController) sharedInstance] batteryCapacity]];
        
        if ([cb_batteryView superview] != self.view) {
            [self.view addSubview:cb_batteryView];
        }
    } else {
        if ([cb_batteryView superview] == self.view) {
            [cb_batteryView removeFromSuperview];
        }
    }
    
}
%new
- (void)updateBatteryViewWithSaverStatus:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    if ([userInfo valueForKey:@"isBatterySaverActive"]) {
        BOOL isBatterySaverActive = [[userInfo valueForKey:@"isBatterySaverActive"] boolValue];
        if (isBatterySaverActive) {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor orangeColor]]];
        } else {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor greenColor]]];
        }
    }
}

%new
- (void)updateBatteryViewWithStatusInfo:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    if ([userInfo valueForKey:@"isPlugged"]) {
        BOOL isPlugged = [[userInfo valueForKey:@"isPlugged"] boolValue];
        if (isPlugged == YES) { // in case i need to add more option while charging ( only )
            [self cb_update];
        } else {
            [self cb_update];
        }
    }
}

%new
- (void)cb_update {
    [self updateAppearanceForController:self];
    [self updateBehaviorForController:self];
    [self.contentViewController _addCallToAction];
    [self cb_AddNewBattery];
}
%end
