/****************************************************************************
Copyright 2015 Inostudio Solutions

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
****************************************************************************/

package net.inostudio.googleanalyticstutorial;

import net.inostudio.googleanalyticstutorial.GAAndroidManager;

public class GANativeAPI {
	public static void trackScreenEvent(String name) {
		GAAndroidManager.getInstance().trackScreenEvent(name);
	}
	
	public static void trackEvent(String category, String action, String label, int value) {
		GAAndroidManager.getInstance().trackEvent(category, action, label, value);
	}
	
	public static void trackSocialEvent(String name, String action, String targetUrl) {
		GAAndroidManager.getInstance().trackSocialEvent(name, action, targetUrl);
	}
	
	public static void startSession() {
		GAAndroidManager.getInstance().startSession();
	}
	
	public static void endSession() {
		GAAndroidManager.getInstance().endSession();
	}
}
