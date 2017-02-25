#line 1 "/Users/imokhles/Documents/Projects/Jailbreak/iOSOpenDev/ChargingBoard/ChargingBoard/ChargingBoard.xm"




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

@class SpringBoard; @class SBDashBoardMainPageView; @class SBDashBoardMainPageViewController; @class SBDashBoardComponent; @class SBUIController; 
static void (*_logos_orig$_ungrouped$SpringBoard$_batterySaverModeChanged$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$_ungrouped$SpringBoard$_batterySaverModeChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, int); static void (*_logos_orig$_ungrouped$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$SBDashBoardMainPageView$callToActionLabel)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SBDashBoardMainPageView$callToActionLabel(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, SBDashBoardAppearance *); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, SBDashBoardAppearance *); static long long (*_logos_orig$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL); static long long _logos_method$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_AddNewBattery(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithSaverStatus$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithStatusInfo$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_update(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBUIController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBUIController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBDashBoardComponent(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBDashBoardComponent"); } return _klass; }
#line 50 "/Users/imokhles/Documents/Projects/Jailbreak/iOSOpenDev/ChargingBoard/ChargingBoard/ChargingBoard.xm"

static void _logos_method$_ungrouped$SpringBoard$_batterySaverModeChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1) {
    _logos_orig$_ungrouped$SpringBoard$_batterySaverModeChanged$(self, _cmd, arg1);
    
    BOOL isBatterySaverActive = [self isBatterySaverModeActive];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCBSaveStatusNotificationChanged object:nil userInfo:@{@"isBatterySaverActive": [NSNumber numberWithBool:isBatterySaverActive]}];
}


static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBUIController$ACPowerChanged(self, _cmd);
    BOOL isPlugged = [self isOnAC];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCBOnACNotificationChanged object:nil userInfo:@{@"isPlugged": [NSNumber numberWithBool:isPlugged]}];
}


static id _logos_method$_ungrouped$SBDashBoardMainPageView$callToActionLabel(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([[_logos_static_class_lookup$SBUIController() sharedInstance] isOnAC]) {
        return nil;
    }
    return _logos_orig$_ungrouped$SBDashBoardMainPageView$callToActionLabel(self, _cmd);
}



static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBatteryViewWithStatusInfo:) name:kCBOnACNotificationChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBatteryViewWithSaverStatus:) name:kCBSaveStatusNotificationChanged object:nil];
    _logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    _logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$(self, _cmd, arg1);
    
    if ([[_logos_static_class_lookup$SBUIController() sharedInstance] isOnAC]) {
        [self cb_update];
    }
}
static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBDashBoardAppearance * arg1) {
    
    if ([[_logos_static_class_lookup$SBUIController() sharedInstance] isOnAC]) {
        SBDashBoardComponent *dateView = [_logos_static_class_lookup$SBDashBoardComponent() dateView];
        [dateView setHidden:YES];
        [arg1 addComponent:dateView];
        
        SBDashBoardComponent *pageControl = [_logos_static_class_lookup$SBDashBoardComponent() pageControl];
        [pageControl setHidden:YES];
        [arg1 addComponent:pageControl];
        
        



    }
    _logos_orig$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$(self, _cmd, arg1);
}
static long long _logos_method$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([[_logos_static_class_lookup$SBUIController() sharedInstance] isOnAC]) {
        return 5;
    }
    return _logos_orig$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle(self, _cmd);
}


static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_AddNewBattery(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    if ([[_logos_static_class_lookup$SBUIController() sharedInstance] isOnAC]) {
        
        BOOL isBatterySaverActive = [cb_sb_application() isBatterySaverModeActive];
        
        if (isBatterySaverActive) {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor orangeColor]]];
        } else {
            [cb_batteryView setColoringAnimationWithColors:@[[UIColor greenColor]]];
        }
        [cb_batteryView setProgress:[[_logos_static_class_lookup$SBUIController() sharedInstance] batteryCapacity]];
        
        if ([cb_batteryView superview] != self.view) {
            [self.view addSubview:cb_batteryView];
        }
    } else {
        if ([cb_batteryView superview] == self.view) {
            [cb_batteryView removeFromSuperview];
        }
    }
    
}

static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithSaverStatus$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
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


static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithStatusInfo$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
    NSDictionary *userInfo = [notification userInfo];
    if ([userInfo valueForKey:@"isPlugged"]) {
        BOOL isPlugged = [[userInfo valueForKey:@"isPlugged"] boolValue];
        if (isPlugged == YES) { 
            [self cb_update];
        } else {
            [self cb_update];
        }
    }
}


static void _logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_update(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMainPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [self updateAppearanceForController:self];
    [self updateBehaviorForController:self];
    [self.contentViewController _addCallToAction];
    [self cb_AddNewBattery];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(_batterySaverModeChanged:), (IMP)&_logos_method$_ungrouped$SpringBoard$_batterySaverModeChanged$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$_batterySaverModeChanged$);Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$_ungrouped$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$_ungrouped$SBUIController$ACPowerChanged);Class _logos_class$_ungrouped$SBDashBoardMainPageView = objc_getClass("SBDashBoardMainPageView"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardMainPageView, @selector(callToActionLabel), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageView$callToActionLabel, (IMP*)&_logos_orig$_ungrouped$SBDashBoardMainPageView$callToActionLabel);Class _logos_class$_ungrouped$SBDashBoardMainPageViewController = objc_getClass("SBDashBoardMainPageViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewWillAppear$);MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardMainPageViewController$viewDidAppear$);MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(aggregateAppearance:), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardMainPageViewController$aggregateAppearance$);MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(backgroundStyle), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle, (IMP*)&_logos_orig$_ungrouped$SBDashBoardMainPageViewController$backgroundStyle);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(cb_AddNewBattery), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_AddNewBattery, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(updateBatteryViewWithSaverStatus:), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithSaverStatus$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(updateBatteryViewWithStatusInfo:), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$updateBatteryViewWithStatusInfo$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBDashBoardMainPageViewController, @selector(cb_update), (IMP)&_logos_method$_ungrouped$SBDashBoardMainPageViewController$cb_update, _typeEncoding); }} }
#line 171 "/Users/imokhles/Documents/Projects/Jailbreak/iOSOpenDev/ChargingBoard/ChargingBoard/ChargingBoard.xm"
