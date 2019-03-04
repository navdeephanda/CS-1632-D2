# D2

# Issues Faced

## Issues Faced During Code Creation
The main issue I had was balancing three factors: I was trying to write code that I felt was proper while still meeting the stringent 20-line requirement for ruby_rush.rb while also minimizing the amount I needed to test. 

If I had more time and/or I were writing production code, my program would have been a lot more properly object-oriented; I would have broken almost everything else down further into objects (such as rubies). Of course, this would significantly increase the bloat of my driver code and my class code, so it was not desirable for this project.

Another issue I faced was fitting all my driver code into 20 lines. Most of it was taken up by the complex initialization of the location information, so I had to offload the gameplay to another file.

## Issues Faced During Code Testing

Because some of the functionality of the program was necessarily complex, I wrote a lot of bigger functions at first, they didn't necessarily fit as well into the traditional model of a (Ruby-esque) unit test. I really felt like I was writing C-style unit tests (perhaps because that is what I'm used to).

When I tried to convert my bigger methods into smaller ones, I was able to create what I felt was better code style, but to preserve the functionality that a client of the class could reasonably expect, I had to have one big method that calls all of the smaller ones. This presented some weird challenges during unit testing as to what to do about this bigger method: I had to write a test for the bigger method to get appropriate coverage, but writing a test for the bigger method would be redundant if I already wrote all the tests for the smaller ones. Most of the time, I chose to write redundant tests because stubbing the smaller methods when I was testing the bigger method felt wrong (stubbing is only really for methods outside the class, not methods within it).

Lastly, I really struggled to test game.rb and ended up not doing so, as I had already achieved the necessary coverage with my other tests. There was no good way to break that control flow up into functions and test it according to proper testing principles and conventions. It would have required a lot of complex mocking, and at that point, it basically lent itself to a functional test, not a unit test. Ultimately, I felt that testing the core components (Arguments, Location, and Person) made more sense than testing one application of the core components, which was the game.