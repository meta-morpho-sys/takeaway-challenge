# Takeaway challenge
An exercise in writing an app that 
- lets browse a set of menus, 
- select and add item to the basket, 
- check the total, and 
- send a confirmation message to the phone number of the user.

The app uses a YAML file to store the menus and their items. The storage of the selected and added entries is entrusted to helper Struct classes, great for storing data.

The app is intended for implementation of a GUI in the future.
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

-----


### User stories forming the challenge:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## Technologies used
[Twilio REST API](https://www.twilio.com)\
The text sending functionality was implemented using Twilio API. The account is free. However, please note that it will only allow you to send texts to "verified" numbers while if you have a Twilio 'trial account'.


[timecop](https://github.com/travisjeffery/timecop)\
This marvelous gem has a great functionality - helps test out time-dependent code


## Example of the app running in pry:
[Pry session 1](https://i.imgur.com/x3BtJYq.png)\
[Pry session 2](https://i.imgur.com/tiUU5GN.png)



