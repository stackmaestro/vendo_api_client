# Problem Statement
The main objective of this task is to create a simple Ruby SDK for Vendo API.

API documentation is available at: https://developers.getvendo.com/reference/api-getting-started


SDK should support
- Authentication - https://developers.getvendo.com/reference/authentication this should support both success and failure scenarios
- Create a new Cart - https://developers.getvendo.com/reference/create-cart
-Fetching a Cart - https://developers.getvendo.com/reference/get-cart With line items/products this should support both success and failure scenarios, eg. wrong token, etc
- Adding an Item to the Cart - https://developers.getvendo.com/reference/add-item
 this should support both success and failure scenarios, eg. wrong variant ID etc
- Changing quantity - https://developers.getvendo.com/reference/set-quantity this should support both success and failure scenarios eg. insufficient quantity
- Removing item - https://developers.getvendo.com/reference/remove-line-item
- Applying a coupon code - https://developers.getvendo.com/reference/apply-coupon-code (valid code is: “test”) - this should support both success and failure scenarios
- This can be a stand-alone ruby library or code embedded into a rails project, whatever is easier/faster to set it up for you
- You can test against demo.getvendo.com


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vendo_api_client'
```

And then execute:
    $ bundle install
Or install it yourself as:
    $ gem install vendo_api_client

