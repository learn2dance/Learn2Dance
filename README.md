Group Project - README Template
===

# Learn2Dance

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[Description of your app]
Instructional dance video app

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login
* User can register an account
* User can view list of videos with dances
* User can watch individual videos
* Instructors can upload videos


**Optional Nice-to-have Stories**

* Profile page/Setting page
* Category of videos
* User can upload videos
* Ranking system
* Comments on videos
* Playlist 

### 2. Screen Archetypes

* Login
* Register - User signs up or logs into their account
    * User can register an account
* Stream - User can scroll through video resoucres in a list
    * User can view a list of videos with dances
* Detail 
    * User can watch individual videos
* Creation
    * Instructors can upload videos

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Create
* Stream

**Flow Navigation** (Screen to Screen)

* Login
 * Stream
* Register - User signs up or logs into their account
 * Stream 
* Stream - Users can scroll through video resources in a list
 * Detail
 * Create
 * Profile 
* Creation - Instructors can upload videos
 * Stream
* Detail - Viewing particular videos
 * Stream

## Wireframes
<a href="https://imgur.com/dd3c2CY"><img src="https://i.imgur.com/dd3c2CY.jpg" title="source: imgur.com" width=600></a>

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | username      | String   | Unique id for the user |
   | password      | String   | Credentials |
   | image         | File     | Image that instructors post |
   | description   | String   | Caption by instructor |
   | embeded link  | String   | Link to a youtube video |
   
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("username", equalTo: currentUser)
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
   - Create Post Screen
      - (Create/POST) Create a new post object
          ```swift
         let gameScore = PFObject(className:"GameScore")
         gameScore["score"] = 1337
         gameScore["playerName"] = "Sean Plott"
         gameScore["cheatMode"] = false
         gameScore.saveInBackground {
           (success: Bool, error: Error?) in
           if (success) {
             // The object has been saved.
           } else {
             // There was a problem, check error.description
           }
         }
         ```
### Milestone Deliverables
- [x] Networking (2pts)
- [x] GitHub Project created (1pt)
- [x] GitHub Milestones created (1pt)
- [x] GitHub Issues created from user stories (2pts)
- [x] Issues added to project and assigned to specific team members (1pt)
