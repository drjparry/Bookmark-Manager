# Bookmark Manager

##What is it?

Bookmark manager is an online application that records and manages a user's bookmarked sites. Users can sign up, log in, log out, save bookmarks, add tags and organise books by tag. It uses Postresql for the database, Datamapper for the ORM, Sintra for the controller, Heroku for the deployment and CAPYBARA for the testing. 

##Learnign objectives

This week's task was to practice was to learn how to use databases, particularly many-to-many relationships in relational databases, and ORMS to ultimatelty manipulate them in an object oriented way. We learned how to manipulate the databases with different environments, be it testing, development or production. We learned how to use Rakefiles to control when databases are updated and ultimately how to deploy to Heroku to see the app go live. 

##Pair partners: Valentina Monetta, Douglas Rose, Rebecca Piper, Wim Hekkleman and Russell Vaughan.


### User Stories

```
    As a User
    So that I can see which links I've saved
    I want to be able to see a list of links from the database.

    As a User
    So that I can save links
    I want to be able to add new links

    As a User
    So that I know the focus of the link
    I want to be able to tag links

    As a User
    So that I can organise links by subject
    I want to be able to filter the links by tags.
    
    ```
    
    ## Installation
    ``
$ git clone https://github.com/drjparry/Bookmark-Manager.git
$ bundle
$ createdb bookmark_manager_development
$ rake auto_migrate
$ rspec
$ rackup

```
