1. I spend on the coding test between 8 and 10 hours. If I would have more time I would add to my solution:
    - the methods of the JEApiClient class would take success and failure completion blocks;
    - group somehow CLLocation related code, in order to be reusable;
    - use a custom ViewController as root ViewController and custom animations for transitioning from screen to screen. (Instead of the NavigationController);
    - add more unit tests;
	- make the loading indicator prettier, or perhaps use some third party framework like SVProgressHUD.

Unfortunately, so far, I do not have any real work experience with Unit Tests or TDD, I did my best to do unit testing for the model of this app, hope my tests are not too superficial.
As far as the Network Layer and the ViewController go, I know about the existence of some techniques like dependency injection and mocking, that should help with testing, but at this point I do not really know how to apply them. I hope I will have soon the opportunity to learn more about them.

Some assumption that I’ve made:
- minimum iOS version: I have set up the project to support iOS 7 and above. According to: https://developer.apple.com/support/appstore/ this accounts for 98% of devices.
- rotation support. I allowed the app to rotate and the layout should update correctly.
- the test states that the user should know exactly which restaurants are available: I assume that this refers to the flag: IsOpenNow from the JSON response.

2. The most important feature that was added to the latest version of Objective-C is literal notation for: NSNumber, NSDictionary, NSArray and BOOL(@YES, @NO).
    _name = dictionary[@"Name"];
    JERestaurant *restaurant = self.restaurants[indexPath.row];
    BOOL isTrue = @YES;
    NSNumber *studentMark = @(10);

3. I would track down a performance issue in an app using Xcode Instruments like Allocations, Time Profiler and Leaks to monitor performance parameters and identify which class/method is responsible for the performance issue. Yes I had to track down performance issues on some of the projects I’ve worked on.

4. Improvements to the JUST-EAT API that I’ve used:
    - since the app uses some kind of authentication using https instead of http might do well for security
    - the response from the API seemed rather slow, and the quantity of information sometimes it is pretty large so I would use some pagination(deliver a specific number of restaurants) to improve the response time
    - I would add inside the JSON a “Status” field to pass the status code of the call.
    - Change the .gif graphical resources to .png as Apple recommends.

5. {
    "Applicant": {
        "FirstName": "Andrei",
         "LastName": "Popa",
             "Role": "iOS Developer",
           "Skills": [
                {
                "Value": "Objective-C",
                "Level": "Advanced"
                },
                {
                "Value": "Design Patterns",
                "Level": "Advanced"
                },
                {
                "Value": "Versioning: GIT",
                "Level": "Advanced"
                },{
                "Value": "Versioning: SVN",
                "Level": "Practitioner"
                },
                {
                "Value": "Agile - Scrum",
                "Level": "Practitioner"
                },
                {
                "Value": "JSON",
                "Level": "Practitioner"
                },
                {
                "Value": "REST API",
                "Level": "Practitioner"
                }
            ],
            "Personal Qualities": [
                "Attention to detail", 
                "Resourceful", 
                "Passionate about structure and hierarchy", 
                "Perseverance",
                "Team player",
                "Problem solving",
                "Analytical thinking",
                "Attention to detail",
                "Perceptive",
                "Clean",
                "No criminal record"],
            "Hobbies and Personal Activities": [
                "Outdoor activities",
                "Sports",
                "Motorbiking"
            ]
    }
}