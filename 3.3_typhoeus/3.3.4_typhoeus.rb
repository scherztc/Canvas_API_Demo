# import gems
require 'typhoeus'
require 'json'
require 'csv'

# declare variables
canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here

course_name = "I made this with the API 4"
course_code = "I made this with the API 4"
sis_course_id = "i_made_by_api4"
hide_grades = "false"
enroll_me = "true"

# define the API call
create_course = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/accounts/self/courses",
    method: :post,
    headers: { authorization: "Bearer #{canvas_token}" },
    params: {
        "course[name]" => course_name,              #replaced hard coded values
        "course[course_code]" => course_code,
        "course[sis_course_id]" => sis_course_id,
        "course[hide_final_grades]" => hide_grades, # when adding parameters all but the last should have 
        "enroll_me" => enroll_me
    }
    )

create_course.on_complete do |response|
    if response.code == 200
        data = JSON.parse(response.body)
        puts "The new canvas course id is #{data['id']}"
    else
        puts "Something went wrong! Response code was #{response.code}"
    end
end

create_course.run