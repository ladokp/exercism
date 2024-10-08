# Parallel Letter Frequency

Welcome to Parallel Letter Frequency on Exercism's Scala Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Count the frequency of letters in texts using parallel computation.

Parallelism is about doing things in parallel that can also be done sequentially.
A common example is counting the frequency of letters.
Employ parallelism to calculate the total frequency of each letter in a list of texts.

According to [this terminology](http://chimera.labs.oreilly.com/books/1230000000929/ch01.html#sec_terminology) you should write a *parallel* and *deterministic*
program and (by all means!) let Scala deal with the *concurrency* aspect.
Or else your code could quickly get messy and error-prone with all kinds of nasty
concurrency bugs. In particular your program could become indeterministic
which spells in practice: very (in fact, VERY) hard to debug, test and reason about.

Having said that it might be a good idea to first write a sequential solution (and
use the test suite to verify it).
Only then should you try to parallelize it while keeping the sequential and parallel
portions of your code as separate as possible.

A first iteration could be using Scala's [parallel collections](http://docs.scala-lang.org/overviews/parallel-collections/overview.html). You might find
that this is almost too simple (especially if you have followed our advice and
already have a sequential solution).

For the second iteration we recommend you try a solution with [scala.concurrent.Future](http://www.scala-lang.org/api/current/scala/concurrent/Future$.html).
You can consult [this tutorial](http://danielwestheide.com/blog/2013/01/09/the-neophytes-guide-to-scala-part-8-welcome-to-the-future.html) and [its sequel](http://danielwestheide.com/blog/2013/01/16/the-neophytes-guide-to-scala-part-9-promises-and-futures-in-practice.html) for some help.
Make sure that you
- have only one single blocking call to wait for the result
- that it is at the very end of your program, and
- that it has a timeout.

`scala.concurrent.Future` is used in many libraries and the doctor's advice for
parallel and asynchronous programming in Scala. So it is essential for mastering
the language and it should become part of your Scala armory.

## Source

### Created by

- @ricemery

### Contributed to by

- @abo64
- @ErikSchierboom
- @ppartarr
- @rajeshpg