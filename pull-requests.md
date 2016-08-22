# Pull Request and Peer Review Conventions

## ["See Something, Say Something™"](https://www.dhs.gov/see-something-say-something)

Across the company, we're all part of teams. In pull requests, we share code with our colleagues. It's easy to take for granted the routine observations in our every day - style conventions, smelly code, or silly naming. But your third party eyes are different than your neighbor's - filled with the observations that make it uniquely yours. So if you see something that sparks a thought in your mind - or someone's behavior that seems in any way interesting - say something. Because only you know what's supposed to be in your everyday. Informed, alert communities play a critical role in keeping our nation safe. "If You See Something, Say Something™" engages the MediaSuite community in protecting our codebase through awareness–building, partnerships, and other outreach.

When reviewing another person's code, it is not beneficial to censor yourself by omitting comments that you think might be trivial or inconsequential, since the seemingly casual observations sometimes turn into meaningful conversations or decisions. In order to facilitate "See Something, Say Something" I've adopted a rating system to differentiate important comments from casual observations and everything in between.

## Rating the importance of your comment

This rating system is used to indicate how strongly you feel about a particular comment. At MediaSuite, we do not give the 

* `10/10` - Required Action. This is either a bug, logical error, or an otherwise serious offense. I will fight you if you do not change or give me a convincing reason why this code needs to be this way. 
* `9/10` - I'm pretty sure this is critical but don't want to commit to 10/10. If it were my PR, I would without a doubt refactor
* `8/10` - Action strongly recommended, but open to be convinced with proper justification. If it were my PR, I'd definitely refactor
* `7/10` - Somewhere about halfway between an 8 and a 6. A prime number.
* `6/10` - I'd probably recommend action or think that it would be best. If it were my PR, I'd refactor unless I were in a super rush.
* `5/10` - I could go either way or I can't decide how important this is. Decision to take action is entirely up to you. On the fence. 
* `4/10` - A more casual recommendation; not priority enough that I'd spend time on it unless you feel compelled to in response to me pointing it out. If it were my PR, I would probably change it if I were already refactoring that code
* `3/10` - Also a prime number.
* `2/10` - I might have done it this way instead but whatever
* `1/10` - E.g. Protip
* `0/10` - Just a casual comment or shitpost.
* `11/10` - Bonus: "Woah holy crap wtf is this?"

## In practice

The numbers themselves are meaningless without context, and the numbers mean different things depending on the associated context.

Example: `10/10 please tell me why you did this` !== `10/10 logical error`

A good default format for a PR comment:

```
<Some discussion or suggestion>

<number>/10 <action to take or reason why I think this is important or both>
```
