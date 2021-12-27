Read Me.

ReadMe for NASA Image Search App

A)    Libraries used are  Alamofire,  AlamofireImage, and SwiftyJSON

Decided to use Alamofire for its simplicity in API call interactions.
Less code is always better, I think!
Plus it provides a clean abstraction in the networking layer in iOS. Gives the http calls that swifty vibe.

Also used AlamofireImage here when I realized that it can also pull images here as well! Super useful and clean in how it is integrated with UIImage.

For SwiftyJSON, I used it because of it’s flexibility to handle data types and parsing of JSON.

 
B)    Overview of how app is architected:
There are just two UIViews. The first one you see has a search bar at the top and a collection view. Input your search query to load in search results of whatever you typed in.
    

Once you scroll to the bottom, just press+hold and swipe up again to have the collectionview refresh with more images from the API. Just need to wait 3 secs or so to have them load in.

Clicking on any of the images will bring you to another ViewController that has the details of the picture and time/date of when it was taken.



C)    How to build/run the app

Please make sure to add and install the three cocoapods in the pod file. Once this is done open up the project:  NASA_MediaSearchApp.xcworkspace.

pod 'Alamofire', '~> 5.4'
pod 'AlamofireImage', '~> 4.1'
pod 'SwiftyJSON', '~> 4.0'





