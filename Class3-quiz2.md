# Class3-quiz2
**Question1 **

Register an application with the Github API here https://github.com/settings/applications. Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). Use this data to find the time that the datasharing repo was created. What time was it created?

This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). You may also need to run the code in the base R package and not R studio.

```r
library(httr)
library(httpuv)
library(jsonlite)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications   OAuthApp
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("CourseraAPI", key = "55169ce7527ea5214a6b", secret = "6854470728a92ef9ba6527f92382cbfd19e1597a")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token) 
req <- GET("https://api.github.com/users/jtleek/repos", gtoken) 
    ## or req <- GET("https://api.github.com/users/jtleek/repos", token = github_token) 
stop_for_status(req) 
output <- content(req)

#5. Use jsonlite to get full contect of URL
homeTL=GET("https://api.github.com/users/jtleek/repos",myapp)
json1=content(req)
json2=jsonlite::fromJSON(toJSON(json1))

#6. find out the exact name for the item of interest, in our case "datasharing" 
names(json2) 
    # return a list of names, confirming that "datasharing" is the "name"
    json2$name 
    # the item name contains a list of elements, datasharing is the 12th element, is also the 12th element of the all contecnt 
    # getting the list value in "created_at" of the elements that has the "name"=="datasharing" 
    # can't use json2["name"=="datasharing",] becuase this is a list rather than a dataframe
    json2[12,"created_at"]
    ##return [[1]]
    ##return [1] "2013-11-07T13:25:07Z"
```

