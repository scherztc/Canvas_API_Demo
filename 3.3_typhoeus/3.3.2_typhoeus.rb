# import the typhoeus gem
require 'typhoeus'

# declare variables
canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here

# define the API call
create_course = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/accounts/self/courses",
    method: :post,
    headers: { authorization: "Bearer #{canvas_token}" },
    params: {
        "course[name]" => "I made this with the API 2",
        "course[course_code]" => "I made this with the API 2",
        "course[sis_course_id]" => "i_made_by_api2",
        "course[hide_final_grades]" => true,
        "enroll_me" => "true"
    }
    )

create_course.on_complete do |response| # define behavior when API call completes
    if response.code == 200             # if API call was successful
        puts "I made a course in Canvas via a Ruby Script!!!" 
    else
        puts "Something went wrong! Response code was #{response.code}"  # see https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
    end
end

create_course.run