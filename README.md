# Family Friday Web Developer Prompt

### Delivered

![Email in Gmail web client, Chrome 58.0.3029.110, macOS Sierra 10.12.4](
  http://i.imgur.com/8wpFteh.png
  )
Email in Gmail web client, Chrome 58.0.3029.110, macOS Sierra 10.12.4

I have delivered an html file that is a sample email using data from the
payload. I did this because I preferred to focus on the HTML/CSS challenges.
Rest assured that I understand how to traverse the payload object as if it were
a JSON response I was parsing and manipulating in back-end code.

Likewise I understand how to use keys in a template to reference data passed to
the template such as the way ERB templates receive instance variables in Sinatra
and Rails. Part of me actually wanted to write an app with a web interface for
handling responses to the email and storing them as data and visualizing them,
but the prompt specifically asked for an email template.

My notes are in [NOTES.md](NOTES.md).

### Experience

While I had experience in web development, this is my first experience with
email templating. I was not expecting the rules of thumb that I had learned in
developing for browsers to be throw out the window so quickly.

The first oddity was the encouragement to use inline styling. I learned that
inline styling is preferable because many email clients break classes and ids
making writing css selectors difficult. I have learned of a work-around for this
called attribute selectors, but even with those it is expected that the styles
would be embedded between ```<style></style>``` tags.

On top of that, tables were hailed as a best solution to laying out the email.
The reasons for this became apparent as I learned things like floats were
pointless.

I was very frustrated that JavaScript was not viable as most email clients strip
it or ignore it entirely. This meant that it was going to be difficult to create
an interactive rating bar with stars that would respond to mouseovers and
persist the user's response in the UI.

### Plans for the future

Integrate an actual analytics campaign and a server to handle the rating
queries with an interface for creating new emails and storing and visualizing
response data.

Improve upon mobile responsiveness, particularly on the Android 4.x gmail
client. Need to write and integrate media queries.

Use attribute selectors to possibly build an interactive rating bar.

Get a litmus subscription. I quickly ran over the number of preview renders
(because they count renders of the unchanged code every time you reload the
builder)!

Work the email generation into a better file structure (create a generator
class)
