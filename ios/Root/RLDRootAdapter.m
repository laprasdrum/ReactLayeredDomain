//
//  RLDRootAdapter.m
//  ReactLayeredDomain
//
//  Created by laprasDrum on 2017/12/04.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RLDRootAdapter.h"
#import <React/RCTViewManager.h>

NSString * const RootModelDidMountNotification = @"RootModelDidMountNotification";

@implementation RLDRootAdapter
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(emitChange:(NSArray <NSDictionary *> *)obj)
{
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:RootModelDidMountNotification object:obj]];
}
@end
