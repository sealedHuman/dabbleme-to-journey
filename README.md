# dabbleme-to-journey
A Perl script which converts a Dabble Me export file into a Journey import file.

#### Why?
I used to use a journaling application called [Dabble Me](https://dabble.me/). After a few years, I decided to migrate to a journaling application called [Journey](https://2appstudio.com/journey/). Both applications have import and export features, but it did not seem possible to export my Dabble Me journal entries into a file format which could be imported into Journey. I wrote a Perl script which takes a Dabble Me export text file and converts it into a JSON file format which Journey can import. Maybe someone else in this very specific situation will find this script to be useful.

#### Input file format:
```
2013-08-03

This is journal entry number one.

2013-08-04

This is journal entry number two.
What fun!

2013-08-05

And this is the third journal entry, naturally.
```

#### Output file format:
```
{
"metadata" : {
  "version" : "1.0"
},
"entries" : [
{
  "creationDeviceType" : "MacBook Pro",
  "starred" : false,
  "creationDate" : "2013-08-03T23:50:45Z",
  "creationOSVersion" : "10.13.5",
  "text" : "This is journal entry number one.",
  "timeZone" : "America\/Chicago",
  "creationOSName" : "macOS",
  "uuid" : "1",
  "creationDevice" : "MacBook Pro",
  "creationDeviceModel" : "MacBookPro11,3",
  "duration" : 0
},
{
  "creationDeviceType" : "MacBook Pro",
  "starred" : false,
  "creationDate" : "2013-08-04T23:50:45Z",
  "creationOSVersion" : "10.13.5",
  "text" : "This is journal entry number two. What fun!",
  "timeZone" : "America\/Chicago",
  "creationOSName" : "macOS",
  "uuid" : "2",
  "creationDevice" : "MacBook Pro",
  "creationDeviceModel" : "MacBookPro11,3",
  "duration" : 0
},
{
  "creationDeviceType" : "MacBook Pro",
  "starred" : false,
  "creationDate" : "2013-08-05T23:50:45Z",
  "creationOSVersion" : "10.13.5",
  "text" : "And this is the third journal entry, naturally.",
  "timeZone" : "America\/Chicago",
  "creationOSName" : "macOS",
  "uuid" : "3",
  "creationDevice" : "MacBook Pro",
  "creationDeviceModel" : "MacBookPro11,3",
  "duration" : 0
},
]}
```

Zip this output file into a file named "1 Entries - Export.zip" (don't ask me why) and then import it into Journey.
