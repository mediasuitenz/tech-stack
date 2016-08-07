So I ran a sql injection fuzzer https://github.com/sqlmapproject/sqlmap on the search endpoint to see what I could dig up. As far as I can tell there was no successful injection - but I did uncover two crashes at the pg level, so the takeaway is:

> Loopback DOES prepare the statements, passing them to the pg lib, which as far as I can tell passes them over the pg connection and lets pg do the preparing

> Loopback DOES NOT know anything about column types / paramters. So '1a' gets passed as a string literal in .id = clause

> PostgreSQL DOES NOT implicitly cast '1a' to 1 and instead throws an exception invalid input syntax for integer

So we have to manually ensure we only pass integers down the chain

> Loopback DOES NOT correctly escape / remove invalid data from the parameters (null byte not allowed in a string)

So we have to manually remove null characters from strings

> Loopback DOES NOT handle errors from the pg adapter - it bounces them all the way back to the top of the stack including postgres .c file names and line numbers :rage4:

So we have to be pretty damn vigilant with fuzzing / testing any SQL statements we make
