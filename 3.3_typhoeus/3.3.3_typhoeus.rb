# import gems
require 'typhoeus'
require 'json'

# declare variables
canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here

# define the API call
create_course = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/accounts/self/courses",
    method: :post,
    headers: { authorization: "Bearer #{canvas_token}" },
    params: {
        "course[name]" => "I made this with the API 3",
        "course[course_code]" => "I made this with the API 3",
        "course[sis_course_id]" => "i_made_by_api3",
        "course[hide_final_grades]" => true,
        "enroll_me" => "true"
    }
    )

create_course.on_complete do |response|
    if response.code == 200
        data = JSON.parse(response.body)                    # turn our json data into array
        puts "The new canvas course id is #{data['id']}"    # pull out just ID's from the array
    else
        puts "Something went wrong! Response code was #{response.code}"
    end
end

create_course.run