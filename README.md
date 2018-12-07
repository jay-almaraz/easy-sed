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
    'If I add apostrophes within 'single quotation marks'' 
    <<< 'eg: {{FIND_THIS_LITERAL}}'

# eg: If I add apostrophes within single quotation marks
```

Now we use dqoutes to wrap our replace string. Remember that special characters will now need to be broken with a backslash `(!,",$,%)` etc.
```sh
./easy-sed.sh \
    '{{FIND_THIS_LITERAL}}' \
    "But here I'll 'wrap' this string in double quotes" \
    <<< 'eg: {{FIND_THIS_LITERAL}}'

# eg: I'm going to use some 'double quotation marks' in this replace string
```

### Double Quotations and combinations of both
Here we have a more complex replacement with apostrophes and dquotes. Remember that special characters will now need to be broken with a backslash
```sh
./easy-sed.sh \
    '{{FIND_THIS_LITERAL}}' \
    "\"I'm falling down the hill, Jill\!\", Jack exclaimed." \
    <<< 'eg: {{FIND_THIS_LITERAL}}'
    
# eg: "I'm falling down the hill, Jill!", Jack exclaimed.
```
