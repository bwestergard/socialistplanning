let Post
    : Type
    = { body : Text, shortname : Text, title : Text, date: Text }

let HtmlMap
    : Type
    = { mapKey : Text, mapValue : Text }

let markdownify =
      λ(p : Post) →
        { mapKey = "${p.shortname}.md"
        , mapValue =
            ''
            ---
            title: "${p.title}"
            author: Bjorn Westergard
            include-after: <div id="footer"><hr/><a href="${p.shortname}.pdf">Download PDF</a></div>
            suppress-bibliography: true
            ---

            ${p.body}
            ''
        }

let Prelude = ./prelude-18.0.0.dhall

let Text/concatSep = Prelude.Text.concatSep
let List/map = Prelude.List.map

let review-peoples-republic =
      { shortname = "review-peoples-republic"
      , title = "Review: People's Republic of Walmart"
      , date = "2019-09-06T20:00:00-0400"
      , body =
          ''
**People's Republic of Walmart**, by Leigh Phillips and Michal
Rozworski, is the latest short text on a political theme to issue from
[Verso](https://www.versobooks.com/) and [Jacobin
Magazine](https://jacobinmag.com/)'s joint publishing venture. Its theme is planning, as it exists within capitalist firms today and might exist in the socialist
polity of tomorrow.

The supercession of the market by economic planning was long thought, by
both proponents and detractors, to be the characteristic goal of
workers' movements worldwide. Since the crisis of 2008, interest in the
creeds of these movements ("socialism", "communism", "anarchism") has
exploded, due in no small part to the efforts of magazines like
[Jacobin](https://jacobinmag.com/) and [n+1](https://nplusonemag.com/).

The revival of these creeds has not been accompanied by a revival of
interest in planning. This is a shame. Socialism without planning is
Hamlet without the prince. As an effort to revive interest in economic
planning generally, and the [socialist calculation
debate](https://en.wikipedia.org/wiki/Socialist_calculation_debate)
specifically, **People's Republic of Wal-Mart** is laudable.

The authors take the reader on a tour of topics loosely related to the
calculation debate per se and along the way present highly condensed
arguments against capitalism and for economic planning with 'democratic'
features[^1]. What precisely is understood by 'planning' and what might
make future implementations 'democratic' remains hazy throughout.
Important arguments against planning are imperfectly communicated. As a
result, **People's Republic** is unlikely to persuade the skeptical
reader of any political hue. This is lamentable, as the arguments in
favor of certain conceptions of planning are much stronger than is
commonly supposed today[^2].

Summary
=======

According to Phillips and Rozworski, capitalism's "irremediable,
critical flaw" is that "the set of all useful things and the set of all
profitable \[to produce\] things are not in perfect correspondence"[^3].
New antibiotics could be developed and marketed to replace those that
microbes have evolved to resist, which would save lives. They are not
produced because it is not profitable to do so[^4]. On the flip side,
the production of fossil fuels is profitable despite "\[undermining\]
human flourishing" by way of the greenhouse effect[^5].

This non-correspondence of useful and profitable-to-produce goods and
services occurs because under capitalism "the primary method used to
allocate things is the free market"[^6]. Returning to the problem of
antibiotic resistance to illustrate their point, the authors ask us to
compare the incentives to produce a drug that merely amelioriates a
chronic health condition with the incentives to produce a drug that
cures the patient's illness in one fell swoop. While the patient can be
expected to prefer a cure, a revenue stream that endures as long as the
patient does might prove more attractive to a drugmaker[^7]. This anxiety
about proper standards of conduct for the practioners of some art being subordinated to commercial standards is at least as old as the Platonic dialogues ("Is medicine to be the art of fee-making because the healer collects a fee for healing?"[^8]).

The "allocation mechanism" of secondary importance in capitalist
modernity is "planning", which firms use to manage resources internally.
Some firms, notably Walmart and and Amazon, are so "vast" that they are
in every important respect "planned economies" like the former Soviet
Union. "\[When\] we ask whether another \[non-capitalist\] world is
possible, we are also asking: is there an alternate \[primary\]
mechanism \[with which\] to allocate things?"[^9]. The secondary
mechanism must become primary, the "planning" used within firms today
must be used without tomorrow[^10].

The former Soviet Union and Walmart - the "twin giants of central
planning" - demonstrate that "planning works", but they are normatively
unacceptable (because undemocratic) models. We're repeatedly assured
that the kind planned economy envisioned by the authors would be
"coordinated by ordinary working people, rather than by bureaucrats or
bosses".

We're invited to imagine "...Walmart's operational efficiency, its
logistical genius, its architecture of agile economic planning...
captured and transformed by those who aim toward a more egalitarian,
liberatory society!"[^11] To create a viable socialist order, our fellow
worker Prometheus must first steal fire from capital's Mount Olympus.

Rebuttals to Austrian critiques
===============================

Having sketched the capitalist present, there are two arguments against
the feasibility of socialism that the authors of **People's Republic**
are keen to rebut.

The first argument, attributed to Mises[^12], is that "planning at scale
wasn't feasible" because of the sheer number of calculations required to
work out an allocative plan for a 'large' economy. They counter that the
feasibility of planning at scale is established by the existence of
capitalist enterprises like Walmart and Amazon that are "so vast that we
should really call them centrally planned economies". Like all
capitalist enterprises, these buy and sell commodities (including labor
services) in the market, but regulate their internal affairs through
"planning" (rather than setting up internal markets for intermediate
goods). Had anti-socialists ("Mises and friends") been right, Walmart
and Amazon would not exist because they would "long since have hit their
wall of too many calculations to make".

The second argument, attributed to Hayek, is that even if the
calculations required to decide on an allocative plan were tractable,
planners would not be able to collect "the data that goes into the
equations"[^13]. Phillips and Rozworksi counter that whatever the case
may have been when Hayek wrote, the advent of "big data" in e-commerce,
which "is testing the limits of how much granular information can be
collected", has eliminated any informational obstacles. Product
recommendation systems like Amazon's are held up as a "crucial
innovation" for those who hope for a planned economy that can "satisfy
consumer wants", because they "\[condense\]... the chaos of individual
tastes an opinions... into something useable".

The inadequacy of these rebuttals
=================================

These rebuttals fly wide of their marks.

Walmart and Amazon have not overcome a once insuperable barrier to
centrally planned allocation - computational or otherwise - because
Walmart and Amazon do not allocate production goods.

Amazon and Walmart's "logistical genius" - which is genuinely novel and
interesting - is in solving the problem of distributing goods to
consumers through a network of warehouses connected by variety
transportation mechanisms. This problem is at root a series of enmeshed
[inventory](https://en.wikipedia.org/wiki/Inventory_optimization), [routing](https://en.wikipedia.org/wiki/Vehicle_routing_problem), and [scheduling](https://en.wikipedia.org/wiki/Scheduling_(production_processes)) problems.

The animating question of the socialist calculation debate, on the other
hand, was how a polity that had abolished private property in production
goods (compare "capital", "the means of production", "higher order" goods)
would allocate these production goods to different producing entities.

Solutions to the aforementioned logistical problems do not entail
solutions to production good allocation problems or vice versa. Phillips
and Rozworski often suggest otherwise ("manufacturing is merely another
link in the retail supply chain..."). This is misleading insofar as it
muddles the distinction between vertical integration - in which a firm
begins producing inputs it once purchased, supplanting commodity
exchange with a technical division of labor - and the complex
subcontracting relationships typical of contemporary supply chains.

To see how today's logistical problems and the economic planning
problems of the calculation debate differ, consider how products you
order on Amazon today are produced and sold.

Let's say you order some "Amazon Basics"-branded #2 Pencils or a
package of alkaline batteries. They are probably already resting in a
warehouse near your home thanks to software that allows Amazon employees
to anticipate the aggregate demand for these commodities. Because Amazon
stores your purchase history and those of millions of other consumers,
it possible for their employees to adjust the distribution of inventory
across warehouses, the schedules of trucks, etc. They might even be able
to indicate to some vendors that increased supply is likely to find
demand through their platform. To do all of this at low cost is a vexing
logistical problem, which Phillips and Rozworski are right to credit
Amazon for tackling.

But how were our notional batteries and pencils manufactured?

Graphite powder, for example, is the raw material for both the anodes in
alkaline batteries and the 'lead' in pencils. How did Amazon employees
know how much graphite powder to allocate for the production of each?
How were these allocations made consistent with the allocations of
graphite needed to produce the myriad varieties of steel which
constitute inputs for the production of hundreds of thousands of goods
sold through Amazon?

Amazon employees didn't know. They didn't draw up ex ante consistent
allocations of graphite. Amazon doesn't allocate production goods
to firms which manufacture for its virtual shelves. Those firms (and the
firms they buy from, and the firms those firms buy from, etc.) turn to
the market to acquire the inputs they believe will prove instrumental in
their effort to turn a profit.

If Amazon or Walmart were systematically acquiring the firms that sold
goods through their virtual storefront, replacing market exchange with a
deliberate allocative plan and technical division of labor as they moved
up the supply chain, there would be something to the book's claim that
"we should really call them centrally planned economies" of increasing
and potentially "vast" scale. They are not, so there isn't.

The Soviet Union's state planning agency, Gosplan, did tackle problems
of this kind through the method of ["material balances"](https://en.wikipedia.org/wiki/Material_balance_planning) among others.
Likewise, capitalist firms pursued vertical integration strategies to
such extremes they too began to face similar administrative and
computational difficulties. Henry Ford, for example, could boast that
raw materials like coal and iron ore were transformed into a working
automobile eighty-one hours later entirely within the confines of his
River Rouge factory complex, with intermediate goods like sheet metal
and cast metal parts produced along the way[^14]. But there is no
indication that these retail giants hope to begin allocating production
goods to those who produce for their shelves. Why would they?

Phillips and Rozworski's response to Hayek is similarly confused.

Hayek argued[^15] that there would be three types of information a
central planning board would require but find impossible to marshal.
First, a very granular and constantly updated inventory of all
production goods, their state of repair (e.g. remaining useful lifetime
of a machine) and location. Second, mathematical functions (think:
lookup tables) summarizing the quantities of each input (e.g. X
kilograms of steel tubing, Y drill presses, Z rubber tires, etc.)
required to produce any quantity of a given commodity (e.g. N bicycles).
Finally, "complete lists of the different quantities of all commodities
which would be bought at any possible combination of prices of the
different commodities which might be available" (i.e. an aggregate
demand function) would have to be settled upon in order to begin
calculating how best to make use of the aforementioned productive
resources.

Perhaps Amazon's product recommendation system could be extended to
produce the third of Hayek's three types of information. But it is
evident that Amazon has not even taken the first step toward building
systems to produce information of the first and second kinds,
speculation about the perpetually arriving "internet of things"
notwithstanding.

In sum, the inventory, scheduling, and routing techniques of e-commerce
giants do not offer solutions to the problems Austrians identified with
the planning proposals of "market socialism" that Rozworski and Phillips
implicitly defend.

Planning for what?
==================

Phillips and Rozworski's enthusiasm for product recommendation systems
suggests a vision of planning which owes more to the Austrian school
than to Marxian socialism.

On their telling, Hayek saw markets as uniquely able to "aggregate and
put to use the information dispersed throughout society". But today,
product recommendation systems have beat the market at its own game, so
to speak (emphasis mine)[^18]:

> ...Today’s deliberately planned IT systems are starting to create
> "group knowledge" (collective intelligence, or shared information that
> only emerges out of the interactions within or between groups of
> people) out of our individual needs and desires. And Amazon doesn’t
> just track market transactions. Beyond what you buy, the company
> collects data on what you browse, the paths you take between items,
> how long you stay on the page of each item you browse, what you place
> in your cart only to remove it later, and more.
>
> Hayek could not have envisioned the vast amounts of data that can
> today be stored and manipulated outside of market interactions (and,
> to be fair, even many Marxists have assumed that the myriad capricious
> variables associated with faddish consumer items in particular
> forecloses the capacity for their socialization), although he
> certainly would have admired the capitalists such as Bezos who own the
> data and use it to pad their obscene fortunes. **It is a delicious
> irony that big data, the producer and discoverer of so much new
> knowledge, could one day facilitate what Hayek thought only markets
> are capable of.**

This "group knowledge" sounds suspiciously like the mysterious
"[catallaxy](https://en.wikipedia.org/wiki/Catallaxy)" appealed to by
Austrians in their defenses of capitalism. In their eagerness to
demonstrate that "big data" could possess the virtues Austrians ascribed
to the market and the market alone, Phillips and Rozworski seem to have
forgotten to question whether those were legitimate virtues in the first place.

For Hayek, capitalist society does not impose a collective purpose on
its denizens, and is therefore a "Great Society" unprecedented in world
history. The principal merit of this order is that it allows
participants to coexist without having to discuss their aims, much less
agree on them[^19]:

> The Great Society arose through the discovery that men can live
> together in peace and mutually benefit each other without agreeing on
> the particular aims that they severally pursue. The discovery that
> substituting abstract rules for obligatory concrete ends made it
> possible to extend the order of peace beyond the small groups pursuing
> the same ends, because it enabled each individual to gain from the
> skill and knowledge of others whom he need not even know and whose
> aims could be different from his own...
>
> In the Great Society we all in fact contribute not only to the
> satisfaction of needs of which we do not know, but sometimes even to
> the achievement of ends of which we would disapprove if we knew about
> them. We cannot help this because we do not know for what purposes the
> goods or services which we supply to others will be used by them. That
> we assist in the realization of other people's aims without sharing
> them or even knowing them, and solely in order to achieve our own
> aims, is the source of strength of the Great Society.

In fact, capitalist society does impose a collective project on its
members: the endless accumulation of capital. Whatever goal we pursue -
creating a great work of art, caring for the sick, housing our
neighbors, etc. - we must either find a way turn a profit as we do so or
secure the support of those who do (which support is sure to fail in
times of crisis). Many on the socialist left today believe, as Hayek
did, that our society does not impose a collective project on its
members[^16]. The thought follows naturally enough that socialist
institutions must scrupulously preserve the market's value-neutrality. But we cannot preserve what does not exist.

As the philosopher John O'Neill notes[^17], Hayek's argument depends for
its force on the assertion that "beliefs about values do not answer to
rational argument". If rational argument could settle disagreements
about the products that needed to be provisioned and the services that needed to be offered for
citizens to lead a variety of good lives, socialism might be both feasible and
desirable. But because ideals and values are inaccessible to rational
argument, a value-neutral mechanism is needed to "aggregate whatever
ideals people happen to have, without conversation or judgement on those
ideals themselves" (O'Neill). The market order of private property
rights and free contract is just such a non-dialogical mechanism: an
increase in the price of oil induces oil production regardless of suppliers' attitudes toward climate change.

When Phillips and Rozworski argue that "big data" can "facilitate what
Hayek thought only markets are capable of", what can they have in mind
but the creation of new mechanisms to aggregate preferences in lieu of
political debate?

I am sure that such mechanisms can be constructed, and equally sure that
they would bring us no closer to realizing socialist ideals.

[^1]: The authors are explicit about the dual purpose of the book. They
    wish to rekindle interest in the socialist calculation debate (Pages
    14-15) and to participate in that debate themselves (Page 16).

[^2]: John O'Neill's "The Market: Ethics, Knowledge, and Politics"
    (1998) is an excellent summary of these arguments, but was written for a specialist audience.

[^3]: Page 4

[^4]: A less contentious example than antibiotic resistance, about which
    experts seem to disagree, might have better served the authors in
    making this point.

[^5]: Page 233

[^6]: Page 9

[^7]: This is my best effort at reconstructing the argument on page six.
    It is notable that here the authors appeal to a determinate
    non-commercial standard of "usefulness" - health - where in general
    they are disinclined to do so.

[^8]: Plato's Republic, Book I

[^9]: Page 8

[^10]: "... if allocation does not proceed via the market, then it will
    occur via economic planning, also know as 'direct allocation' ..."
    (Page 10)

[^11]: They take this theme from an essay by cultural critic Fred
    Jameson.

[^12]: Mises did not argue that the essential difficulty with socialist
    planning would be the sheer number of calculations it would require.
    Other disputants, like Robbins and Hayek, put forward such
    "equation-difficulty" arguments, but only alongside others they held
    to be dispositive. The equation-difficulty argument was first hinted at by Barone in "The Ministry of Production in the Collectivist State" (1908). In "[Human Action](https://mises.org/library/human-action-0)" (p. 706-711), Mises downplayed the significance of such arguments because he denied the premise that the relevant systems of equations could be formulated. The phrase "equation-difficulty argument" is from Rothbard, "[The End of Socialism and the Calculation Debate Revisited](https://mises.org/library/end-socialism-and-calculation-debate-revisited)" (1999).

[^13]: Page 60

[^14]: Henry Ford, "Today and Tomorrow" (1926). [Google Books
    Preview](https://books.google.com/books?hl=en&lr=&id=HzmDDwAAQBAJ&oi=fnd&pg=PT8&dq=81+hours+later+ford+%22today+and+tomorrow%22&ots=wfRxnKkkQf&sig=KaUKTRFX_3Whc5ZWe_PBUDOHJ9M#v=snippet&q=eighty-one%20hours&f=false).

[^15]: Hayek, "[Collectivist Economic
    Planning](https://mises.org/sites/default/files/Collectivist%20Economic%20Planning_2.pdf)"
    (1935). See page 207 (in the essay "The Current State of the
    Debate").

[^16]: For more on the "liberal mirage" of a capitalism as a society
    without a collective purpose, see Murray, "The Mismeasure of Wealth"
    (Page 47).

[^17]: O'Neill, "The Market" (1998), page 19.

[^18]: Page 85.

[^19]: Hayek, "[Law, Legislation and Liberty](https://books.google.com/books?id=9IpEBAAAQBAJ&pg=PA269&lpg=PA269&dq=The+Great+Society+arose+through+the+discovery+that+men+can+live+together+in+peace&source=bl&ots=unlqpAWKhu&sig=ACfU3U2NnxfqfmeXjCLkhukvta10RsHiMQ&hl=en&sa=X&ved=2ahUKEwitk6TXnrzkAhXRhOAKHR5RBpEQ6AEwCnoECAUQAQ#v=onepage&q=The%20Great%20Society%20arose%20through%20the%20discovery%20that%20men%20can%20live%20together%20in%20peace&f=false)" (1982)

                ''
      }

let posts = [ review-peoples-republic ]

let postFiles = List/map Post HtmlMap markdownify posts

let createFrontpageLink = λ(p : Post) → "- [${p.title}](posts/${p.shortname}.html)"

let indexFile =
      { mapKey = "index.md"
      , mapValue =
          ''
          ---
            pagetitle: "The Socialist Planning Blog"
          ---

          # Posts
          ${Text/concatSep "\n" (List/map Post Text createFrontpageLink posts)}

          You can subscribe to future posts through <a href="./feed.rss">RSS</a> or <a href="https://twitter.com/socplanning">Twitter</a>.

          # About

          This blog aims to explore socialist planning proposals and the strongest arguments for and against them. I'm setting out with three hunches:

          1. Critiques of capitalism lose their force without appeal to some vision of socialist planning.
          2. There is no vision of socialist planning that is both widely shared and compelling.
          3. The strongest arguments against the feasibility and desirability of socialist planning are much weaker than is commonly supposed.

          I hope that this blog will play some small part in helping a new generation articulate socialist programs adequate to the grave political and ecological crises of our times.

          # Bookmarks
          - [Viewpoint Magazine](https://www.viewpointmag.com/)
          - [Jacobin Magazine](https://jacobinmag.com/)
          - [Labor Notes](https://www.labornotes.org/)
          - [Organizing Work](https://organizing.work/)
          - [Endnotes](https://endnotes.org.uk/)
          - [People's Policy Project](https://www.peoplespolicyproject.org/)
          - [Science & Society](https://www.scienceandsociety.com/)
          - [The Law and Political Economy Blog](https://lpeproject.org/blog/)
          - [Legal Form](https://legalform.blog/)
          - [Tech Worker Coalition](https://techworkerscoalition.org/)
          - [The Mercatus Center](https://ppe.mercatus.org/)
          ''
      }

let websiteMetaData =
      { baseUri = "https://socialistplanning.org"
      , title = "The Socialist Planning Blog"
      , description = "Resources for envisioning socialism."
      }

let createPostItem =
      λ(p : Post) →
        ''
            <item>
                <title>${p.title}</title>
                <pubDate>$(date --rfc-email -d ${p.date})</pubDate>
                <link>${websiteMetaData.baseUri}/${p.shortname}.html</link>
                <guid>${websiteMetaData.baseUri}/${p.shortname}.html</guid>
                <dc:creator>Bjorn Westergard</dc:creator>
            </item>
        ''

let rssFeedGenerationScript =
      { mapKey = "feed.sh"
      , mapValue =
          ''
          #!/bin/sh

          cat << EOF
          <?xml version="1.0" encoding="UTF-8"?>
          <rss version="2.0" xml:base="${websiteMetaData.baseUri}" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:media="http://search.yahoo.com/mrss/">
          <channel>
              <title>${websiteMetaData.title}</title>
              <link>${websiteMetaData.baseUri}</link>
              <description>Resources for envisioning socialism.</description>
              <language>en</language>
              <generator>Dhall</generator>
              <lastBuildDate>$(date --rfc-email)</lastBuildDate>

          ${Text/concatSep "\n" (List/map Post Text createPostItem posts)}
          </channel>
          </rss>

          EOF
              ''
      }

in postFiles # [ indexFile, rssFeedGenerationScript ]
