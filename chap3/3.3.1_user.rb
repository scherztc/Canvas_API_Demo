# import the typhoeus gem
require 'typhoeus'

# declare variables
canvas_url = 'https://uc.instructure.com' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here

# define the API call
create_course = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/courses",
    method: :get,
    headers: { authorization: "Bearer #{canvas_token}" },
    )

create_course.on_complete do |response| #define behavior when API call completes
    puts response.headers
    puts response.body
end

#run API call 
create_course.run

