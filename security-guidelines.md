## 1 SQL Injection
* Search the codebase for "select", see if the queries are joined together with user input by + or string interpolation eg: `` `Name: ${user.name}` ``
* Fix: Parameterized queries or replace with ORM queries

## 2 Cross-site Scripting (XSS) 
* Search the codebase for "{{{", if you see anywhere where the user input is displayed inside {{{ tags, it's probably vulnerable to XSS
* Fix: Either remove {{{ tags or add sanitization if that's not possible
* XSS Can also occur when creating elements with Javascript
* XSS: Try pasting in one of the below XSS polyglots, and then inspecting the response to see if any tags got through:
```javascript
jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */oNcliCk=alert() )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert()//>\x3e
```
```javascript
';alert(String.fromCharCode(88,83,83))//';alert(String.fromCharCode(88,83,83))//";
alert(String.fromCharCode(88,83,83))//";alert(String.fromCharCode(88,83,83))//--
></SCRIPT>">'><SCRIPT>alert(String.fromCharCode(88,83,83))</SCRIPT>
```
## 3 Cross-site Request Forgery (CSRF)
* Create an html file that contains the following:
* Testing GET requests`<img src="http://site-you-are-testing.com/logout">`, 
* Testing POST requests 
```html
<body onload='document.CSRF.submit()'>

<form action='http://tagetWebsite/Authenticate.jsp' method='POST' name='CSRF'>
	<input type='hidden' name='name' value='Hacked'>
	<input type='hidden' name='password' value='Hacked'>
</form>

</body>
```
* if either request works, you may have a CSRF problem
* CSRF has some pretty strict limitations, eg: It can't POST a JSON payload
* [List of Limitations/General info](https://github.com/pillarjs/understanding-csrf)
* Fix: [csurf](https://github.com/expressjs/csurf)

## 4 Password Brute Forcing
* Attempt to login with different incorrect passwords ~20 times, then login with the correct password
* If you haven't been blocked, or your responses slowed down, the site is vulnerable to brute-force password attacks
* Fix: [express-brute](https://github.com/AdamPflug/express-brute)

## 5 Setup SSL correctly
* Enter the URL in to this site: https://www.ssllabs.com/ssltest/
* Remember to untick "Show on leaderboards"
* Review output
* Disable http access
* Enable "secure" cookie header to disallow getting cookies via http

## 6 Path Traversal
* Try prepending `./` to a file in the url (via edit request, otherwise your browser might remove them) OR anyt input that has a file path in it (Query String, Request Body, Headers, Cookies, eg: `showHelp?page=errors.html`)
* If a different error message shows than when you change a character in the filename, or the site crashes, or any other weird behaviour, you may have found a Path Traversal issue 

## 7 Review headers: 
* eg: X-Powered-By is present by default and gives attackers information they shouldn't have
* Fix: [Helmet](https://github.com/helmetjs/helmet)
* Bonus: Helmet also adds a bunch of other sensible security headers
* Disable CORS, CORS is enabled by default in loopback
* Details here: [Loopback Security Considerations](https://docs.strongloop.com/display/public/LB/Security+considerations)

## 8 Access Control:
* Disable as many endpoints as possible, make sure the remaining endpoints require authorisation.
* Try to access API without being logged in by hitting every endpoint with: [swaggerScan](https://gist.github.com/anotheredward/f967079366158182d0bb40c555836ee0)
* They should all return 401 Unauthorized
* Try to access all pages from outside the application, especially any integrations or pages you are wrapping
* Repeat for each role, may need to review some endpoints manually due to input validation
* Review GET methods to check that no private properties are exposed (property whitelisting may be required)
* If any PUT/PATCH endpoint is available, try modifying all available fields, eg:a User's Email, EmailValidated, Permissions
* Try using include filter to give you related information you can't access directly: `filter={"include":["privateCourseData","user"]}`
* Properties that are used to access external APIs can allow you to steal other people's accounts, eg: ExternalId
* Try directly accessing any pages that require permissions as users who should not be able to access them
* Make sure to check for semantics, eg: taking other people's money (requires an understanding of the domain, can be complex)
* Watch out for anything that could give an attacker information, eg: A list of users
* Remember any information you put in an Ember application is fully accessible to an attacker, eg: Hidden URLs
* Different for every application, but worthwhile testing
* Probably the most important item on this list.

## 9 Secure file upload
* File uploads tend to be the source of many attacks that completely take over a server
* Recommendations:
* Have upload size limits
* Ensure access controls work for file access
* Make sure attackers can't control filenames
  * Don't save the file on the server under its original filename, store it in a db field instead (With a max-length and only whitelisted characters)
  * Use cryptographically secure random generated names so that files can't be guessed
* Check the file itself, not just against an extension whitelist, to check its type
* Consider using AWS file storage
* More details here: [Unrestricted File Upload](https://www.owasp.org/index.php/Unrestricted_File_Upload)

## 10 Unvalidated Redirects and Forwarding
* Fix: Simply avoid using redirects and forwards.
* If used, don’t involve user parameters in calculating the destination. This can usually be done.
* If destination parameters can’t be avoided, ensure that the supplied value is valid, and authorized for the user. 
* It is recommended that any such destination parameters be a mapping value, rather than the actual URL or portion of the
* URL, and that server side code translate this mapping to the target URL.
* More details here: [NodeGoat Redirects](http://nodegoat.herokuapp.com/tutorial/a10)

## 11 Work with Ember to setup a Content Security Policy (CSP)
* Well worth a little bit of time to avoid some really nasty attacks :)
* [CSP Intro](http://www.html5rocks.com/en/tutorials/security/content-security-policy/)
* [Ember CSP](https://github.com/rwjblue/ember-cli-content-security-policy)

## 12 Set up cookies correctly
* Set your cookie headers correctly 
* "secure" header to only send cookies via https, false by default in common libraries
* "httponly" to disallow access from Javascript, is true by default in common libraries
* For more detail and libraries: [Express Security](https://strongloop.com/strongblog/best-practices-for-express-in-production-part-one-security/)

## 13 Make sure everything is up to date
* Run nsp to check [Node Security Project](https://nodesecurity.io/opensource)
* Integrate David in to CI to keep checking: [David Dependency Checker](https://david-dm.org/)
* Update script from Mark
* Be aware of who is taking care of OS-level patching, and be sure it's happening

## Misc.
* Use whitelists not blacklists when possible
* Try removing the password parameter when logging in
* These tests don't guarantee you don't have the issue, but they will pick up low-hanging fruit :)

## Tools
* For the above tests you don't need any specialised tools
* If you want to edit a request,  Firefox's "Edit and Resend" is awesome and requires no set up
* [Firefox Dev Tools](https://developer.mozilla.org/en-US/docs/Tools/Network_Monitor)

## Resources:
* [XSS Evasion Cheat Sheet](https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet)
* [XSS Polyglot Explanation](https://github.com/0xsobky/HackVault/wiki/Unleashing-an-Ultimate-XSS-Polyglot)
* [SQL Injection Prevention Cheatsheet](https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet)

## TODO:
* Group roughly in terms of priority
* Add consequences to attacks
