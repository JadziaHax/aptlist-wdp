require 'erb'

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
    ],
    "restaurant": {
        "logo": "http://i.imgur.com/5e99OvU.png",
        "name": "Pizza R Us",
        "yelp_link": "https://www.yelp.com/biz/pizzas-r-us-birmingham"
    }
}

members = PAYLOAD[:members]
@restaurant = PAYLOAD[:restaurant]
@employee = members[0]
@companions = [members[1], members[2]]

members.each_with_index do |member, index|
   member_duplicate = members.dup
   @employee = member_duplicate.delete(member)
   @companions = member_duplicate
   erb = ERB.new(File.open("#{__dir__}/email_template.html.erb").read)
   File.open("result_email_#{index}.html", 'w') { |file| file.write(erb.result)}
end
