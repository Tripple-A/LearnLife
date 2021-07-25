# README
# Courses-Api
This is a library app that was built using RubyOnRails. It keeps track of borrowed books and their borrowers. 
## Table of Contents

* [Features](#features)
* [Concepts Employed](#concepts-employed)
* [Built With](#built-with)
* [Live Application](#live-application)
* [Required Installations](#required-installations)
* [Instalation of This App](#instalation)
* [Future Improvements](#future-improvements)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)


<!-- features -->
## Features
* System allows to list, create, update and delete users
* System allows to list, create, update and delete books
* System allows assigning a book to user, but only in the case were the book is not already borrowed
* System allows defining of the date of return when assigning book to user
* System displays a list of borrowed books and users who borrowed them
* System highlights in red the books which are past the returning date

<!-- concepts employed -->
## Concepts Employed
* Associations
* Indexing Tables
* Validations
* RSpec

<!-- BUILT WITH -->
## Built With
* RAILS
* HAML
* BOOTSTRAP

<!-- Live application -->
## Live Application
The live application can be found [here](https://learn-life.herokuapp.com).
![image](https://user-images.githubusercontent.com/52589264/126914527-ca320cee-4ef6-4153-87c0-cf245b72eead.png)



<!-- REQUIRED INSTALLATION -->
## REQUIRED INSTALLATIONS
* ruby
* rails

<!-- INSTALLATION -->
## Installation of This Repository

Once you have installed the requiered packages shown on the [Required Installations](#required-installations), proceed with the following steps

Clone the Repository,

```Shell
your@pc:~$ git clone https://github.com/Tripple-A/LearnLife.git
```

Move to the downloaded folder

```Shell
your@pc:~$ cd LearnLife
```

Install all packages

```Shell
your@pc:~$ bundle install
```

To test

```Shell
your@pc:~$ rspec
```


<!-- FUTURE IMPROVEMENTS -->
## Future Improvements
* Use Turbo Streams to update a page on model changes to enable SPA simulation.
* Add feature specs using Capybara, to mimic actions of real users interacting with the app.

## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact
## Author
* 🇳🇬  Abiodun Ajibade - biodun9@gmail.com | [Github Account](https://github.com/Tripple-A) | [Twitter](https://twitter.com/AbiodunAjibade3) | [Linkedin](https://linkedin.com/in/abiodun-ajibade)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* <a href="https://learnlife.com"> Learn Life </a>  .


