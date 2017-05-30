# Apartment List Web Developer Prompt

## Heading Determination Research Notes:
  - Most familiar with erb for templating. Will likely start by just writing an example email in HTML and will convert to template.
  - Email clients are quite disparate in what they support in terms of HTML and CSS (forget javascript).
  - Use tables to replicate a pseudo box-model with the finest control supported across the most email clients.
  - Find out what assets Apartment List currently uses in emails to see if any can be repurposed here.
  - Use e-mail marketing approach—consistent with viewing employees served as customers.
  - litmus guides and peer-support forums, google gmail and analytics support docs, check codepen for email-specific code to learn and adapt.

## Notes From First Pass at HTML & Thinking Ahead
  - Working without <p> tags and just using <br> to shape text allows for more fine control that is again most widely supported by email clients. Hopefully can use line-height in css (which I understand is best supported when used inline in email.
  - Make use of as much payload data in ways that make sense.
  - There was a header logo in Apartment List's current emails that was easily usable for our template.
    - http://images.postdirect.com/master/9/1180712/logo@2x.png
  - Nesting tables is actually encouraged and works as a good way to get clickable rating system under the text of the email.
  - Most obvious way to make links trackable is to use Google Analytics.

## Notes From Adding Rating Bar & Thinking Ahead
  - Email marketing providers typically use a links that use query formatted stings on the end for response tracking. Cleaner and better supported than using forms.
  - Even though payload didn't include actual logo image file and a real yelp link we can find some to use as examples.
  - Google Analytics has "Custom Campaigns" that derive contextual tracking information from url query parameters.
    - Google Analytics' URL Query Builder: https://ga-dev-tools.appspot.com/campaign-url-builder/
  - Find images for ratings bar from permissively licensed image assets or create them myself?

## Notes from styling
  - Uncomfortable with the use of &nbsp;-spaces to pad but expect it to be more reliable than the padding css property in more email clients
  - Struggled to find a HTML/some-css-only solution for the rating bar that could convey its purpose semantically. Used the gradient to achieve the best measure of it I could for the solution I had.
    - Found a cool tool that will calculate x (between 3-63) hex codes for colors that form a gradient from two given colors: http://www.perbang.dk/rgbgradient/
  - I used Litmus' free preview to see some rendering across different email clients. There's definitely a mobile problem that I would love to fix next.
