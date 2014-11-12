A [Stack Overflow](stackoverflow.com) client created for [Code Fellows'](http://codefellows.org) iOS Development Accelerator Week 6.

##Monday:

- Setup your model layer of your stack overflow client. Create a class for a question and a user. Model them using the stack overflow API.
- Structurally, set your app up very similar to our Github client. Use a split view controller to help with universal layout. 
- Create a network controller with a method designed to fetch questions based on a tag. Consult the stack overflow API documentation to find the endpoint for this.
- Parse the results and show them in a table view. Do this inside of a QuestionSearchViewController.

##Tuesday:

- Get OAuth working with your app.

##Wednesday:

- Make sure you get your OAuth working so we stop getting rate limited
- Write a unit test to test out your JSON parsing on your question class
- Enable localization in your app for any non english language, and set at least one user facing label or button to be translated when the user changes the language setting on the device.