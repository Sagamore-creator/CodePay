# CodePay - Project 2

Replica of classing banking application (Revolut, for example)

Your goal as a developer is not only to make it work and fulfil formal requirements, but also to make it as beautiful and user-friendly as possible. It means that you should choose appropriate UI elements to make input effortless for the user, use robust validation logic, error handling etc. We did not lay out all possible functionalities, failure scenarios, scene layout etc. - everything is left for you to decide. If we did not tell that you should not let user to input letters, unlimited numbers etc. to the phone number field - it does not mean that we will not require this. It means that we expect from you as future developers to understand this implicitly and choose appropriate solutions.

To summarize - you need to handle all errors, all failure scenarios. You need to build UI that not only works and does what expected, but also looks good for the user. Also, although everything can be achieved using primitive methods (functions, logic, UI elements etc.), this should not be your goal and you should aim to make it as good as you possibly can. Imagine that you are creating an app to be published in App Store and you have a lot of competitors. You need to make your app the best in the market in order to generate profit.

# API
We will be using Mock API for this project (mockapi.io). Since we are very limited on API functionality here, some things will be unusual. First is that each of you will have your own API base URL to call. The reason behind this is that whenever you POST something to one of the given endpoints (if POST is allowed on that endpoint), you will create an instance of the "resource". For example, if we have an endpoint called /account, whenever you POST something to it, your posted thing will be saved to that endpoint. The bad thing is that each endpoint has a limitation of 100 saved resources and they are not overwritten (if you have 100 already and try to post 101). So, to workaround this limitation, we will need to manually delete those resources by using DELETE request. 

TL;DR - if you are receiving some error regarding "too many resources" or something like that, please use DELETE request to wipe out old resources

One more thing is that we have no actual logic in our API here. In real world, backend API would validate your requests, provide with error messages etc. Since we are using mock API, we do not have this luxury. If you post something wrong, missing fields will be pre-filled for you and no error message will be provided.

TL;DR - our API is a "dummy boy". He does not know what is right and what is wrong. Keep that in mind.

## Base URL for students
- Anton Jemanov https://60850e319b2bed001704180b.mockapi.io/api/v1/
- Arvydas Klimavicius https://60888680a6f4a300174268f5.mockapi.io/api/v2/
- Arvydas Mickus https://60888690a6f4a300174268fe.mockapi.io/api/v3/
- Kristijonas Plukas https://60888699a6f4a30017426909.mockapi.io/api/v4/
- Lech Lipnicki https://608886a3a6f4a30017426912.mockapi.io/api/v5/
- Lukas Adomavicius https://608886b3a6f4a3001742691d.mockapi.io/api/v6/
- Lukas Uscila Dainavicius https://608886ffa6f4a30017426931.mockapi.io/api/v7/
- Monika Zdaneviciute https://60888723a6f4a3001742693c.mockapi.io/api/v8/
- Nerijus Surkys https://6088872ba6f4a30017426946.mockapi.io/api/v9/
- Petras Janulevicius https://60888750a6f4a30017426957.mockapi.io/api/v10/
- Remigijus Klimovas https://60888757a6f4a30017426960.mockapi.io/api/v11/
- Vilius Bundulas https://6088875fa6f4a30017426969.mockapi.io/api/v12/

## Endpoints
**/user**
- id (unique object ID in range 1-100, provided by mockapi.io)
- phoneNumber (String)
- password (String)

Request types available for this endpoint:
- GET (/user) - returns all User instances (all resources available for this endpoint)
- GET (/user/id) - this should be used for user authentication. You will provide user id that you are trying to authenticate and API will make a response for you which includes accessToken and expiration time in seconds. After the specified seconds, you will need to re-authenticate in your app (renew accessToken by making a request to this endpoint again). In real world we would use real authentication based on username and password, but since we are limited with API functionality, this will suffice
- POST (/user) - saves User, specified in request body, to endpoint resources (increasing its count towards 100). If any of the fields in the request body will be empty or mispelled, mockapi.io will pre-fill these values for you - keep that in mind and double-check if you are sending what you think
- PUT (/user/id) - updates User with specific id with values, provided in request body
- DELETE (/user/id) - deletes User with specifiec id from endpoint resources
---
**/account**
- id (unique object ID in range 1-100, provided by mockapi.io)
- phoneNumber (String)
- currency (String, e.g. EUR, NOK etc)
- balance (Number)

Request types available for this endpoint:
- GET (/account) - returns all Account instances (all resources available for this endpoint)
- GET with ID (/account/id) - returns Account with specified id
- POST (/account) - saves Account, specified in request body, to endpoint resources (increasing its count towards 100). If any of the fields in the request body will be empty or mispelled, mockapi.io will pre-fill these values for you - keep that in mind and double-check if you are sending what you think
- PUT (/account/id) - updates Account with specified id with values, provided in request body
- DELETE (/account/id) - deletes Account with specified id from endpoint resources
---
**/transaction**
- id (unique object ID in range 1-100, provided by mockapi.io)
- senderId (String)
- receiverId (String)
- amount (Number)
- currency (String)
- createdOn (Number, unix timestamp)
- reference (String, purpose of the transaction)

Request types available for this endpoint:
- GET (/transaction) - returns all Transaction instances (all resources available for this endpoint)
- GET with ID (/transaction/id) - returns Transaction with specified id
- POST (/transaction) - saves Transaction, specified in request body, to endpoint resources (increasing its count towards 100). If any of the fields in the request body will be empty or mispelled, mockapi.io will pre-fill these values for you - keep that in mind and double-check if you are sending what you think
- DELETE (/account/id) - deletes Transaction with specified id from endpoint resources

## Search parameters
Add query params to GET request:

- `/blogs?search=blog1` - search by all fields for string `blog1`
- `/blogs?title=cool%20blog` - search by `title` field for string `cool blog` (you need to use percent encoding for all special chars, in this case - whitespace. More about this https://developer.mozilla.org/en-US/docs/Glossary/percent-encoding)

# UI

You are free to make any UI based on the requirements. You can use your favourite banking application as an inspiration.

# Scenes

## Login
Fields:
- Phone number
- Password
- Submit button

On Submit:
- Check if user with this phone number exists (/user)
- Check if password is correct (/user)
- GET /user/:id to get access token and its expiration. Save access token and expiration in the app. Renew (GET new one) when it expires

## Register
Fields:
- Phone number
- Password
- Confirm password
- Currency
- Submit button

On Submit:
- Create user (/user)
- Create account (/account)

Validation:
- Before submitting, check if values in fields are valid

## Home
When home screen opens, load current account transactions (where current account is sender or receiver) and related accounts from API and save to local storage

Fields:
- Current account balance with currency
- Add money button
- Send Money button
- Settings button
- Transaction List (Shows 5 newest transactions loaded from local storage) with See all button, which would load all transaction (in a separate window, or how do you want, it does not matter)

## Transaction List
Show all current account transactions loaded from local storage

- Search field which filters transaction list based on input (by note, by phone number)
- Filter button
- Clear filter button (clears search and filter)

### Transaction Filter
- Date (range)
- Amount (range)
- Currency
- Outgoing or incoming transactions

## Transaction Info 
- Outgoing or incoming transaction
- Formatted date
- Sender phone number
- Receiver phone number
- Note (reference)
- Amount and currency
- Repeat button (Opens prefilled Send Money scene)

## Add Money
- Enter amount and PUT new balance (/account)

## Send Money
- Recepient phone number
- Prefill sender currency
- Add note (reference)
- Enter sum

Validation
- Check if recepient exists
- Check if recepient currency is equal to your currency
- Check if your sender balance is sufficient

After validation
- Create new trasaction and POST (/transaction)
- Change recepient Account balance and PUT (/account)
- Change sender Account balance and PUT (/account)

## Settings
- Update password (/user)
- Update currency (/account)
- Update phone number (first update /user, then update /account, then update locally saved information)

# Technical Requirements

## General
- Do not forget about Swift style guides (either Ray Wenderlich - https://github.com/raywenderlich/swift-style-guide or Google - https://google.github.io/swift/) 
- Do not forget about access control (`private`, `internal`, `public` etc.)
- Use subclassing, where it is relevant and needed
- Use extensions, split huge functions into smaller ones (if possible, of course)
- When you finish some part of the functionality, take a look of what you have already written and check if you can refactor something and make it look cleaner
- Differentiate between structs and classes by situation (do not mix them - use `struct` where struct is best, use `class` where class is best)
- Functions with clear purpose, without unexpected side-effects
- Use “weak” when needed

## Storage
- Use `UserDefaults` and `CoreData`
- Fetch and save transactions and accounts locally
- Create a relationship between `Transaction` and `Account`
- In API, transaction has fields for sender and receiver ids. In local storage, keep reference to sender and receiver `Account` instead of ids. 

## UI
- Application should only support `Vertical` orientation
- Application should support all screen sizes, all required elements should fit
- Write UI programatically without `Xibs`, `Storyboards` or `SwiftUI`
- Use `UINavigationController` for navigating between scenes
- Use self-sizing cells, scroll views, keyboard appearing notification and visual effects (rounded corners, shadows, borders, gradients) where appropriate
- You can write progamatic UI constraints by using Apple methods or using `SnapKit` (or other 3rd party constraint wrapper library)

# Evaluation
We will evaluate:

1. **User side** - we will be your application users and see if we can break them. We will check if everything works as expected, there are no unhandled scenarios, there are no crashes or other things that could affect user experience
2. **Code functionality** - this is similar to user functionality testing but this time we will go into your code and check if everything is handled correctly code-wise. We will check if you used appropriate things for specific tasks, if there are no loopholes, if everything is handled correctly etc. In other words, we will check how you implement requirements code-wise.
3. **Code cleanliness** - in this part we will check is your code clean. Do you split your functions, do you use extensions, if code is structured correctly, if you use proper naming, is styling okay etc.

# Deadline
The work needs to be sent as an archive to Arnas via Teams private message until **2021-05-16**
