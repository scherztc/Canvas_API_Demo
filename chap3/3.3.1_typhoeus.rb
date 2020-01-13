# import the typhoeus gem
require 'typhoeus'

# declare variables
canvas_url = 'https://uc.instructure.com' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here

# define the API call
create_course = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/accounts/self/courses",
    method: :post,
    headers: { authorization: "Bearer #{canvas_token}" },
    params: {
        "course[name]" => "I made this with the API",
        "course[course_code]" => "I made this with the API",
        "course[sis_course_id]" => "i_made_by_api",
        "course[hide_final_grades]" => true,
        "enroll_me" => "true"
    }
    )

create_course.on_complete do |response| #define behavior when API call completes
    puts response.headers
    puts response.body
end

#run API call 
create_course.run
