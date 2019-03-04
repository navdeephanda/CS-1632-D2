# D2

# Issues Faced
## Issues Faced During Code Creation
The main issue I had was balancing three factors: I was trying to write code that I felt was proper while still meeting the stringent 20-line requirement for ruby_rush.rb while also minimizing the amount I needed to test. 

If I had more time and/or I were writing production code, my program would have been a lot more object-oriented; I probably would have had a main Game class and broken almost everything else down further into objects (such as rubies). This would have reduced the size of my ruby_rush.rb file but would have required me to test a lot more, and with the limited time I have as a student, I wanted to minimize the amount of testing I needed. Furthermore, I felt that testing the core components (Arguments, Location, and Person) made more sense than testing one application of the core components, which was the game.

Another issue I faced was writing concise methods while still fitting all my driver code into 20 lines. There are methods I created in my class for the express purpose of reducing a couple lines in the ruby_rush.rb driver to one (e.g. store_the_days_winnings). It felt wrong to include such methods as part of the object, as they felt far too specific for the more generalized object.

## Issues Faced During Code Testing

Because my methods were bigger, they didn't necessarily fit as well into the traditional model of a (Ruby-esque) unit test. I really felt like I was writing C-style unit tests (perhaps because that is what I'm used to).