
#import "React/RCTLog.h"

#import "RNDynamicAppIcon.h"

@implementation RNDynamicAppIcon

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setAppIcon:(NSString *)name)
{
  [[UIApplication sharedApplication] setAlternateIconName:name completionHandler:^(NSError * _Nullable error) {
    if (error != nil) {
      RCTLog(@"%@", [error description]);
    }
  }];
}

RCT_REMAP_METHOD(supportsDynamicAppIcon, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  bool supported = [[UIApplication sharedApplication] supportsAlternateIcons];
  resolve(@(supported));
}

RCT_EXPORT_METHOD(getIconName:(RCTResponseSenderBlock) callback ){
    NSString *name = @"default";
    NSDictionary *results;
    
    if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.3") ){
        if( [[UIApplication sharedApplication] supportsAlternateIcons ] ){
            name = [[UIApplication sharedApplication] alternateIconName];
            if( name == nil ){
                name = @"default";
            }
        }
    }
    
    results = @{
                @"iconName":name
                };
    callback(@[results]);
}

@end
