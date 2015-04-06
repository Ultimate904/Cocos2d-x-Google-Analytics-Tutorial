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

#include "GANativeAPI.h"
#include "GAIOSManager.h"

void GANativeAPI::trackScreenEvent(const std::string &name)
{
    GAIOSManager *manager = [GAIOSManager getInstance];
    [manager trackScreenEventWithName:[NSString stringWithCString:name.c_str()
                                                              encoding:[NSString defaultCStringEncoding]]];
}


void GANativeAPI::trackEvent(const std::string &category, const std::string &action, const std::string &label, int value)
{
    GAIOSManager *manager = [GAIOSManager getInstance];
    [manager trackEventWithCategory:[NSString stringWithCString:category.c_str()
                                                    encoding:[NSString defaultCStringEncoding]]
                          action:[NSString stringWithCString:action.c_str()
                                                    encoding:[NSString defaultCStringEncoding]]
                           label:[NSString stringWithCString:label.c_str()
                                                    encoding:[NSString defaultCStringEncoding]]
                           value:value == 0 ? nil : [NSNumber numberWithInt:value]];
}

void GANativeAPI::trackSocialEvent(const std::string &name, const std::string &action, const std::string &targetUrl)
{
    GAIOSManager *manager = [GAIOSManager getInstance];
    [manager trackSocialEventWithName:[NSString stringWithCString:name.c_str()
                                                      encoding:[NSString defaultCStringEncoding]]
                            action:[NSString stringWithCString:action.c_str()
                                                      encoding:[NSString defaultCStringEncoding]]
                         targetUrl:[NSString stringWithCString:targetUrl.c_str()
                                                      encoding:[NSString defaultCStringEncoding]]];
}

void GANativeAPI::startSession()
{
    GAIOSManager *manager = [GAIOSManager getInstance];
    [manager startSession];
}

void GANativeAPI::endSession()
{
    GAIOSManager *manager = [GAIOSManager getInstance];
    [manager endSession];
}
