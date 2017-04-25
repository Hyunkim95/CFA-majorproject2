# Documentation

## Problem Analysis

Business Owners - with the extensive development of technology, it is becoming harder and harder for businesses to keep up with their rivals. To differentiate themselves from competitors or even to keep up; businesses need a technical solution or an application to innovate, automate and distinguish themselves.  Currently business owners/entrepeneurs use the following for developers:

- freelancing 
- Developing consulting firms

However, the limitations behind these sources are:

- freelancers - although cheap, quality is not assured - furthermore solutions developed by the business owner may not be the best solution 
- Consulting firms - expensive 

Developers - developers are always working on personal projects, however often times these projects are purely for practice; hours of work goes down the drain as they are often forgotten. Furthermore, developers may lack ideas of a personal project they want to pursue.  
## Solution

My solution to this problem is to create a medium which in a dual sense simulates not only a hackathon but also a portfolio. Business owners approach the web application with a generic or specific problem; solutions will be crowdsourced by developers and tend to the problem. However, what differntiates this application from other applications is its ability to pair past projects as potential solutions to challenges and also recommend developers who have high experience at the particular topic of that challenge. 

This will solve the busienss owners problems as they are given a plethora of solutions they can implement - more than one solution at the price of one. Furthermore, business owners will also have the ability to choose none if they do not meet their requirement. 

This will solve the developers problems as their past projects will help them generate income in a form of passive income, they are also given a platform to develop solutions to random challenges that might interest them.  It is also a form of portfolio, allowing the developers to be approached by potential recruiters. 

## Workflow for users
[Imgur](http://i.imgur.com/vAL3br3.jpg)
[Imgur](http://i.imgur.com/oPhkKrX.jpg)
## Wireframes
[Imgur](http://i.imgur.com/d9WzCUM.jpg)
[Imgur](http://i.imgur.com/Y8QTylz.jpg)
## User stories
[Imgur](http://i.imgur.com/tpAwg9i.png)
## Entity Relationship Diagram
[Imgur](http://i.imgur.com/ZZW5vIF.jpg)
## Project Plan and Estimation
[Imgur](http://i.imgur.com/QLfPktx.jpg)
[Imgur](http://i.imgur.com/auWDmIX.jpg)

## Code Review
Reviewed by @abazilla
>After reviewing Hyun’s code, I can conclude that there is a lot of nice neat functionality, particularly in the pages controller. It is however a little complex and I could only understand it after it was explained to me, so it could possibly use some commenting. This particular code could also be moved to the model to fit the “fat model, skinny controller” practice.
At the moment, the tests are not organised into their separate models/controllers, but are rather in a single file, which is still readable thanks to rspec, but could be more DRY by splitting up the code. The Challenge/show page also has a hidden field that could be misleading to users/people reading the code. Lastly, there is some messy code that could be cleaned up (for example in the routes, which is unorganised). For the most part, Hyun’s code is clean and extremely functional.

## Evidence of Code Quality
Before
[Imgur](http://i.imgur.com/TnsEbXf.png)
After
[Imgur](http://i.imgur.com/TnsEbXf.png)


