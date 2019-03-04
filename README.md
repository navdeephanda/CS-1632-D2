# D2

# Issues Faced
## Issues Faced During Code Creation
The main issue I had was balancing three factors: I was trying to write code that I felt was proper while still meeting the stringent 20-line requirement for ruby_rush.rb while also minimizing the amount I needed to test. 

If I had more time and/or I were writing production code, my program would have been a lot more object-oriented; I probably would have had a main Game class and broken almost everything else down further into objects (such as rubies). This would have reduced the size of my ruby_rush.rb file but would have required me to test a lot more, and with the limited time I have as a student, I wanted to minimize the amount of testing I needed. Furthermore, I felt that testing the core components (Arguments, Location, and Person) made more sense than testing one application of the core components, which was the game.

Another issue I faced was writing concise methods while still fitting all my driver code into 20 lines. There are methods I created in my class for the express purpose of reducing a couple lines in the ruby_rush.rb driver to one (e.g. store_the_days_winnings). It felt wrong to include such methods as part of the object, as they felt far too specific for the more generalized object.

## Issues Faced During Code Testing

Because some of the functionality of the program was necessarily complex, I wrote a lot of bigger functions at first, they didn't necessarily fit as well into the traditional model of a (Ruby-esque) unit test. I really felt like I was writing C-style unit tests (perhaps because that is what I'm used to).

When I tried to convert my bigger methods into smaller ones, I was able to create what I felt was better code style, but to preserve the functionality that a client of the class could reasonably expect, I had to have one big method that calls all of the smaller ones. This presented some weird challenges during unit testing as to what to do about this bigger method: I had to write a test for the bigger method to get appropriate coverage, but writing a test for the bigger method would be redundant if I already wrote all the tests for the smaller ones. I chose to write redundant tests because stubbing the smaller methods when I was testing the bigger method felt wrong (stubbing is only really for methods outside the class, not methods within it).