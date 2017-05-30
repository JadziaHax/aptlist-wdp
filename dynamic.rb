require 'erb'
require 'fileutils'

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

puts "Found #{members.length} members for this."

generated = 0

@restaurant = PAYLOAD[:restaurant] # :restaurant key in PAYLOAD is a hash

members.each do |member|
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

   # generate a directory if it doesn't exist
   dir_name="#{__dir__}/output_emails"
   unless File.directory?(dir_name)
     FileUtils.mkdir_p(dir_name)
   end

   # write the results to an html file
   File.open("#{__dir__}/output_emails/result_email_#{@employee[:name]}.html", 'w') {|file| file.write(erb.result)}
   generated += 1

   # let the user know that generation completed
   puts "output email/Generated result_email_#{@employee[:name]}.html"
end

puts "Generated #{generated} emails."
