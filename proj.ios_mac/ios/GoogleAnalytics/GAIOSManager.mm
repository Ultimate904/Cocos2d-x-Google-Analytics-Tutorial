//
// Copyright 2015 Inostudio Solutions
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "GAIOSManager.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@implementation GAIOSManager

static GAIOSManager *_instance;

+ (instancetype)createManagerWithId:(NSString *)trackerId {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[GAIOSManager alloc] initWithId:trackerId];
    });
    return _instance;
}

+ (instancetype)getInstance {
    return _instance;
}

- (instancetype)initWithId:(NSString *)trackerId {
    self = [super init];
    if(self) {
        GAI *item = [GAI sharedInstance];
        [item setTrackUncaughtExceptions:YES];
        [item setDispatchInterval:60];
        
        id<GAILogger> logger = [item logger];
        [logger setLogLevel:kGAILogLevelNone];
        
        [item trackerWithTrackingId:trackerId];
    }
    return self;
}

- (void)trackScreenEventWithName:(NSString *)name {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIDescription value:name];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)trackEventWithCategory:(NSString *)category
                        action:(NSString *)action
                         label:(NSString *)label
                         value:(NSNumber *)value {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                          action:action
                                                           label:label
                                                           value:value] build]];
}

- (void)trackSocialEventWithName:(NSString *)name
                          action:(NSString *)action
                       targetUrl:(NSString *)targetUrl {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createSocialWithNetwork:name
                                                          action:action
                                                          target:targetUrl] build]];
}

- (void)startSession {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    GAIDictionaryBuilder *builder = [GAIDictionaryBuilder createScreenView];
    [builder set:@"start" forKey:kGAISessionControl];
    [tracker send:[builder build]];
}

- (void)endSession {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    GAIDictionaryBuilder *builder = [GAIDictionaryBuilder createScreenView];
    [builder set:@"end" forKey:kGAISessionControl];
    [tracker send:[builder build]];
}

@end
