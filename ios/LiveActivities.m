#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(LiveActivities, NSObject)


RCT_EXTERN_METHOD(createActivity)
RCT_EXTERN_METHOD(endAllActivity)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
