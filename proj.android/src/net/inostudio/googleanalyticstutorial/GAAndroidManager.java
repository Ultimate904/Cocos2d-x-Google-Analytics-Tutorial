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

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.Tracker;

public class GAAndroidManager {
    private static GAAndroidManager instance;
    private Context ctx;
    private String 	trackerId;
    private Tracker tracker;
    
    public static GAAndroidManager getInstance() {
    	return instance;
    }
    
    public static GAAndroidManager createManager(String trackerId, Context ctx) {
        if (instance == null) {
            instance = new GAAndroidManager(trackerId, ctx);
        }
        return instance;
    }
    
    public GAAndroidManager(String trackerId, Context ctx) {
    	this.ctx = ctx;
    	this.trackerId = trackerId;
    	this.tracker = GoogleAnalytics.getInstance(this.ctx).newTracker(this.trackerId);
    }

	public void trackScreenEvent(String name) {
		this.tracker.setScreenName(name);
		this.tracker.send(new HitBuilders.AppViewBuilder().build());
	}
	
	public void trackEvent(String category, String action, String label, int value) {
		HitBuilders.EventBuilder eventBuilder = new HitBuilders.EventBuilder();
		eventBuilder.setCategory(category);
		eventBuilder.setAction(action);
		eventBuilder.setLabel(label);
		eventBuilder.setValue(value);
		this.tracker.send(eventBuilder.build());
	}
	
	public void trackSocialEvent(String name, String action, String targetUrl) {
		HitBuilders.SocialBuilder socialBuilder = new HitBuilders.SocialBuilder();
		socialBuilder.setNetwork(name);
		socialBuilder.setAction(action);
		socialBuilder.setTarget(targetUrl);
		this.tracker.send(socialBuilder.build());
	}
	
	public void startSession() {
		this.tracker.send(new HitBuilders.AppViewBuilder()
		.setNewSession()
		.build());
	}
	
	public void endSession() {

	}
}
