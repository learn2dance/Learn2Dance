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

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | username      | String   | unique id for the user |
   | password      | String   |  |
   | image         | File     | image that instructors post |
   | description   | String   | caption by instructor |
   | embeded link  | String   | link to a youtube video |
   
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
#### [OPTIONAL:] Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name

##### Game of Thrones API
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /cities | gets all cities
    `GET`    | /cities/byId/:id | gets specific city by :id
    `GET`    | /continents | gets all continents
    `GET`    | /continents/byId/:id | gets specific continent by :id
    `GET`    | /regions | gets all regions
    `GET`    | /regions/byId/:id | gets specific region by :id
    `GET`    | /characters/paths/:name | gets a character's path with a given name
