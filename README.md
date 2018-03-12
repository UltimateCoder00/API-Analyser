# API-Analyser
### Contents
- [Summary](#summary)
- [Description](#description)
- [Installation](#installation)
- [The Program](#the_program)
- [Test Driven Development (TDD) With Rspec](#tdd)

### <a name="summary">Summary</a>
A ruby application for extracting users and purchases data through API calls to do data analysis.

### <a name="description">Description</a>
Produce an app that can answer some questions about data held in a public API. The API and the questions are detailed below. Doing this app will involve having to work out how best to merge data returned from two different end points.

##### What you have:
You have been given access to a JSON API, there are 2 endpoints, 1 for user data (/users) and another for purchase (/purchases) data.

User data looks like this:
```
{
  "data": [
    {
      "id": "12DF-2324-GA2D-31RT",
      "first_name": "John",
      "last_name": "Andrew",
      "phone": "0-200-100-1234",
      "email": "john.andrew@example.com"
      },
  ]
}
```

Purchases data looks like this:
```
{
  "data": [
    {
      "user_id": "12DF-2324-GA2D-31RT",
      "item": "Huge pineapple pizza",
      "spend": "19.99"
    },

    {
      "user_id": "12DF-2324-GA2D-31RT",
      "item": "A nice cup of tea",
      "spend": "2.99"
    }
  ]
}
```

##### Your task:
Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.
```
ruby app.rb COMMAND PARAMETERS
```
The script should implement these commands:
```
- most_sold: What is the name of the most sold item?
- total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]?
- most_loyal: What is the email address of the most loyal user (most purchases)?
```
e.g.
```
$ ruby app.rb total_spend john.andrew@example.com
  22.98
$ ruby app.rb most_loyal
  john.andrew@example.com
```

### <a name="installation">Installation</a>
Follow the instructions below to install and setup all the tools to use the API-Analyser code
##### Install Ruby Version Manager (RVM)
Open your terminal and type this line in:
```
\curl -L https://get.rvm.io | bash -s stable
```
##### Install Ruby 2.4.2
Open your terminal and type this line in:
```
rvm install ruby-2.4.2
```
##### Install Code to Local Device
To install the code on your local device, do the following:

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems

### <a name="the_program">The Program </a>
Open your terminal and change to the program folder, then run
```
ruby app.rb COMMAND PARAMETERS
```
##### Example 1:
COMMAND: most_sold - What is the name of the most sold item?

```
$ ruby app.rb most_sold
  "Heavy Duty Concrete Watch"
```

##### Example 2:
- COMMAND: total_spend, PARAMETER: EMAIL - What is the total spend of the user with this email address [EMAIL]?

```
$ ruby app.rb total_spend travis_kshlerin@wunsch.net
  336.76
```

##### Example 3:
COMMAND: most_loyal - What is the email address of the most loyal user (most purchases)?

```
$ ruby app.rb most_loyal
  "travis_kshlerin@wunsch.net"
```

### <a name="tdd">Test Driven Development (TDD) With Rspec</a>
This program was developed using Rspec. To run the tests, in the terminal type:
```
rspec
```
This will return the following output:
```
DataAnalysis
  #users
    Contains array of users data
  #purchases
    Contains array of purchases data
  #most_sold
    Returns most sold item
  #most_loyal
    Returns most loyal customer
  #total_spend(email)
    Returns total spend of customer
    Error message for incorrect email

Purchases
  #response
    Contains RestClient::Response class
  #json_response
    Has JSON hash content
    Has JSON hash

Users
  #response
    Contains RestClient::Response class
  #json_response
    Has JSON hash content
    Has JSON hash

Finished in 2.95 seconds (files took 0.33879 seconds to load)
12 examples, 0 failures
```
