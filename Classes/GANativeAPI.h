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

#ifndef __GOOGLE_ANALYTICS_TUTORIAL_GA_BRIDGE_H__
#define __GOOGLE_ANALYTICS_TUTORIAL_GA_BRIDGE_H__

#include <iostream>

class GANativeAPI {
public:
    static void trackScreenEvent(const std::string &name);
    static void trackSocialEvent(const std::string &name, const std::string &action, const std::string &targetUrl);
    static void trackEvent(const std::string &category, const std::string &action, const std::string &label, int value);
    static void startSession();
    static void endSession();
};

#endif // __GOOGLE_ANALYTICS_TUTORIAL_GA_BRIDGE_H__
