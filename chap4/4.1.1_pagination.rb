require 'typhoeus'
require 'json'

canvas_url = 'https://uc.instructure.com' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
counter = 0

get_courses = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/courses",
    method: :get,
    headers: { authorization: "Bearer #{canvas_token}" },
    params:{
        "with_enrollments" => true,
        "published" => true,
        "include[]" => "total_students"
    }
    )

get_courses.on_complete do |response|
    puts response.headers
    if response.code == 200
        data = JSON.parse(response.body)
        data.each do |courses|
            counter += 1
            puts "#{counter} - Course #{courses['id']} has #{courses['total_students']} students enrolled"
        end
    else
        puts "Something went wrong! Response code was #{response.code}"
    end
end

get_courses.run
