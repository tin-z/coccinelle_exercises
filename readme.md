
## coccinelle_exercises

 - coccinelle notes and exercises


### contents ###

 - [solutions-tutorial](./solutions) 
 - [advanced_queries](.(advanced_queries)

 - tips 1: start simple, with a semantic patch that matches the common case
 - tips 2: incremental development, restrict semantic patch to reduce results, fp

 - tips 3: use multiple rules to have better results and scripts
    * e.g. we have @badr@ positon p; @@ <etc> @@ position p != badr.p @@ <etc>

 - software lifecycle in a nutshell (ref: https://www.youtube.com/watch?v=LOsluYTzdMg)
    1. (great) idea 
    2. quick and dirty implementation
    3. people like the idea and start to use the code
    4. feature requests
    5. bug reported
    6. attackers start to develop exploit


### refs ###

 - [Julia Lawall: An Introduction to Coccinelle Bug Finding - video](https://www.youtube.com/watch?v=buZrNd6XkEw)
    * [pdf](https://coccinelle.gitlabpages.inria.fr/website/papers/tutorial.pdf)

 - [Keynote: Inside the Mind of a Coccinelle Programmer - video](https://www.youtube.com/watch?v=xA5FBvuCvMs)

 - [SAN19-500K1 Keynote: Coccinelle: 10 Years of Automated Evolution in the Linux Kernel - video](https://www.youtube.com/watch?v=LOsluYTzdMg)

 - [Mentorship Session: Coccinelle: Automating Large-scale Evolution and Bug Finding in C Code - video](https://www.youtube.com/watch?v=16wUxqDf1GA)
    * [pdf](https://events.linuxfoundation.org/wp-content/uploads/2021/02/coccinelle_tutorial.pdf)

 - [Coccinelle quickstart - blog](https://lwn.net/Articles/315686/)

 - [learning-coccinelle - github repo](https://github.com/gmacario/learning-coccinelle)

 - [Case study: Searching for a vulnerability pattern in the Linux kernel - blog](https://a13xp0p0v.github.io/2019/08/10/cfu.html)

 - [Kernel Exploitationvia Uninitialized Stack - doc](https://outflux.net/slides/2011/defcon/kernel-exploitation.pdf)

 - https://github.com/gmacario/learning-coccinelle/blob/master/docs/wk4_coccinelle.md
   * https://github.com/gmacario/learning-coccinelle/tree/master/wk4

 - [coccinelle-for-the-newbie - blog](https://home.regit.org/technical-articles/coccinelle-for-the-newbie/)

 - [Coccinelle - JEHTech blog](http://jeh-tech.com/c_and_cpp/coccinelle.html)

 - [coccinelle gitlab page](https://coccinelle.gitlabpages.inria.fr/website/rules/)

