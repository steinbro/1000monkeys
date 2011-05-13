If you have no idea what this is about, watch the
[two-minute video introduction](http://www.youtube.com/watch?v=2N67nV5jPJs).

First, build the rhyming dictionary:

    wget https://cmusphinx.svn.sourceforge.net/svnroot/cmusphinx/trunk/cmudict/cmudict.0.6d -O cmudict
    make rhyming-dictionary

Next, analyze some poetry, like the complete works of Emily Dickinson:

    wget http://www.gutenberg.org/cache/epub/12242/pg12242.txt -O dickinson
    make anthology-analysis ANTHOLOGY=dickinson

Write some poems!

    make poem

Of course, you can set the number of monkeys to your liking:

    make poem MONKEYS=5000
