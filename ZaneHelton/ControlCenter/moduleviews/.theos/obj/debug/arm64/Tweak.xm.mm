#line 1 "Tweak.xm"
@import UIKit;

@interface CCUIModuleCollectionViewController : UIViewController {
    
    
    
    NSDictionary* _moduleContainerViewByIdentifier;
    
}

- (void)viewWillAppear:(BOOL)arg1;
 

- (UIColor *)randomColor;
@end

@interface CCUIContentModuleContainerView : UIView
@end



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

@class CCUIContentModuleContainerView; @class CCUIModuleCollectionViewController; 
static void (*_logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$didPressButton$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL, UIButton *); static UIColor * _logos_method$_ungrouped$CCUIModuleCollectionViewController$randomColor(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIContentModuleContainerView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIContentModuleContainerView"); } return _klass; }
#line 21 "Tweak.xm"
UIView *newView;


static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$(self, _cmd, arg1);

    NSLog(@"Hey Vlad Vlad!");
    NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
    for(NSString *key in moduleDictionary) {
        id val = moduleDictionary[key];
        
        if([val isMemberOfClass:[_logos_static_class_lookup$CCUIContentModuleContainerView() class]]) {
            [val setBackgroundColor:[self randomColor]];
        }
    }
    
    
    
    if (!newView) {
        newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
        [newView setBackgroundColor:[self randomColor]];
    }
    
    
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [newButton setTitle:@"Press Me!" forState: UIControlStateNormal];
    [newButton setFrame:newView.frame];
    
    [newButton addTarget:self action:@selector(didPressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [newView addSubview:newButton];
    [[[UIApplication sharedApplication] keyWindow] addSubview:newView];
    
    
    UIImage *bobImage = [UIImage imageWithContentsOfFile:@"/Library/Application Support/ModuleViews.bundle/mia.png"];
    UIImageView *bobImageView = [[UIImageView alloc] initWithImage:bobImage];
    [bobImageView setFrame:CGRectMake(0, 250, 250, 250)];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:bobImageView];
}


static void _logos_method$_ungrouped$CCUIModuleCollectionViewController$didPressButton$(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * arg1) {
    [newView setBackgroundColor:[self randomColor]];
    
}


static UIColor * _logos_method$_ungrouped$CCUIModuleCollectionViewController$randomColor(_LOGOS_SELF_TYPE_NORMAL CCUIModuleCollectionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    int r = arc4random_uniform(256);
    int g = arc4random_uniform(256);
    int b = arc4random_uniform(256);
    
    
    return [UIColor colorWithRed: r/255.0f green: g/255.0f blue: b/255.0f alpha:1.0f];
    
    
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CCUIModuleCollectionViewController = objc_getClass("CCUIModuleCollectionViewController"); MSHookMessageEx(_logos_class$_ungrouped$CCUIModuleCollectionViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$CCUIModuleCollectionViewController$viewDidAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CCUIModuleCollectionViewController, @selector(didPressButton:), (IMP)&_logos_method$_ungrouped$CCUIModuleCollectionViewController$didPressButton$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIColor *), strlen(@encode(UIColor *))); i += strlen(@encode(UIColor *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CCUIModuleCollectionViewController, @selector(randomColor), (IMP)&_logos_method$_ungrouped$CCUIModuleCollectionViewController$randomColor, _typeEncoding); }} }
#line 85 "Tweak.xm"
