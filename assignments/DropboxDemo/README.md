## Dropbox

The purpose of this homework is to use Xcode to implement the flow between the screens of an application. We're going to use the techniques from this week to implement the Dropbox app from the signed out state to the basic signed in state.

Time spent: 12

### Features

#### Required

- [x] User can tap through the 3 welcome screens.
- [x] User can follow the create user flow.
  - [x] On the create user form, the user can tap the back button to go to the page where they can sign in or create an account.
  - [x] Before creating the account, user can choose to read the terms of service.
  - [x] After creating the account, user can view the placeholders for Files, Photos, and Favorites as well as the Settings screen.
  - [x] User can log out from the Settings screen.
- [x] User can follow the sign in flow.
  - [x] User can tap the area for "Having trouble signing in?".
  - [x] User can log out from the Settings screen.

#### Optional

- [x] User can view a detail view for one of the files and favorite the file.
- [x] User can actually type in the forms and tap to dismiss the keyboard.
- [x] User can swipe through the welcome screens instead of just tapping them.
- [x] User sees updated page indicator dots using page control.
- [x] User can view actual Dropbox Terms of Service in a web view.
- [x] User is presented with native action sheet to view and agree with terms of service.
- [x] User sees updated password strength as they type in password field.

#### The following **additional** features are implemented:

- [x] Moving between text fields with "Next" button
– [x] Simulated dropdown menu in file detail

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Retina images or actual UI menu components

### Video Walkthrough

Here's a walkthrough of implemented user stories:


## Notes

I can't get tabs to show up for existing account flow. Don't know why — I tried rebuilding it. The syntax in the examples was a little outdated and there were some "hidden" shortcuts that I wish I already knew faster, e.g. control-dragging between view controller and tab bar controller to create a segue.
