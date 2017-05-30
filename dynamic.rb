require 'erb'

# ruby hash notation has allowed a colon (:) after keys instead requiring it
# before and using a hash rocket since 2.2
PAYLOAD = {
    "members": [
        {
            "email": "jill@mycompany.com",
            "name": "Jill",
            "team": "engineering"
        },
        {
            "email": "rohit@mycompany.com",
            "name": "Rohit",
            "team": "finance"
        },
        {
            "email": "maria@mycompany.com",
            "name": "Maria",
            "team": "operations"
        }
    ], # Using the logo and yelp link I sourced for the example restaurant
       # so we can get actual image and working link in the email.
    "restaurant": {
        "logo": "http://i.imgur.com/5e99OvU.png",
        "name": "Pizza R Us",
        "yelp_link": "https://www.yelp.com/biz/pizzas-r-us-birmingham"
    }
}

members = PAYLOAD[:members] # PAYLOAD is a hash and the key :members is an array
                            # of employee objects
@restaurant = PAYLOAD[:restaurant] # :restaurant key in PAYLOAD is a hash

members.each_with_index do |member, index|
   member_duplicate = members.dup # create a copy of members hash so we don't
                                  # call destructive methods on it because
                                  # the member we email first needs to
                                  # remain in the array so they will be a
                                  # comapnion for the other members when we
                                  # generate their emails.

   @employee = member_duplicate.delete(member) # delete returns what we delete
                                               # and we set it to @employee
                                               # to pass it to the ERB template

   @companions = member_duplicate # the other members left in the array are the
                                  # companions.

   # read the ERB template and create an ERB object with it
   erb = ERB.new(File.open("#{__dir__}/email_template.html.erb").read)

   # let the user know we are generating
   puts "Generating email for #{@employee[:name]}..."

   # write the results to an html file
   File.open("result_email_#{@employee[:name]}.html", 'w') do |file|
     file.write(erb.result)

   # let the user know that generation completed
   puts "Generated result_email_#{@employee[:name]}.html"
   end
end
