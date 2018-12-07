# easy-sed

easy-sed is a very simple script that wraps the `sed` command and allows for find/replace operations without any Regex syntax. Find a string and replace that string with a string; easy-sed, easy done.

[![Build Status](https://travis-ci.org/jay-almaraz/easy-sed.svg?branch=master)](https://travis-ci.org/jay-almaraz/easy-sed)

## Usage
```sh
./easy-sed.sh FIND REPLACE [FILE]
```

## Quotation marks

Use common sense when inputting FIND and REPLACE strings that themselves contain single or double quotation marks

### Single Quotations and apostrophes
Here we will lose our apostrophes because we kept them inside of single quotes
```sh
./easy-sed.sh \
    '{{FIND_THIS_LITERAL}}' \
    'My 'apostrophes' are all gone :(' 
    <<< 'Hello, World! {{FIND_THIS_LITERAL}}'

# Output:
# Hello, World! My apostrophes are all gone :(
```

Now we use dqoutes to wrap our replace string. Remember that special characters will now need to be broken with a backslash `(!,",$,%)` etc.
```sh
./easy-sed.sh \
    '{{FIND_THIS_LITERAL}}' \
    "But here I'll 'wrap' this string in double quotes" \
    <<< 'Hello, World! {{FIND_THIS_LITERAL}}'

# Output
# Hello, World! But here I'll 'wrap' this string in double quotes
```

### Double Quotations and combinations of both
Here we have a more complex replacement with apostrophes and dquotes. Remember that special characters will now need to be broken with a backslash
```sh
./easy-sed.sh \
    '{{FIND_THIS_LITERAL}}' \
    "\"I'm falling down the hill, Jill\!\", Jack exclaimed." \
    <<< 'Hello, World! {{FIND_THIS_LITERAL}}'
    
# Output:
# Hello, World! "I'm falling down the hill, Jill!", Jack exclaimed.
```
