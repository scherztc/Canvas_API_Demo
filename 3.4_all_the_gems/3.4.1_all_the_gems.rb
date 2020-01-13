# import gems
require 'typhoeus'
require 'json'
require 'csv'

canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
csv_file = '' # full path to api_courses.csv eg: full/path/to/file/api_courses.csv


CSV.foreach(csv_file, headers: true) do |row|
    course_name = row['long_name']
    course_code = row['short_name']
    sis_course_id = row['course_id']
    hide_grades = row['hide_grades']
    enroll_me = row['enroll_me']

    create_course = Typhoeus::Request.new(
        "#{canvas_url}/api/v1/accounts/self/courses",
        method: :post,
        headers: { authorization: "Bearer #{canvas_token}" },
        params: {
            "course[name]" => course_name,
            "course[course_code]" => course_code,
            "course[sis_course_id]" => sis_course_id,
            "course[hide_final_grades]" => hide_grades,
            "enroll_me" => enroll_me
        }
        )

    create_course.on_complete do |response|
        if response.code == 200
            data = JSON.parse(response.body)
            puts "The course #{row['long_name']} has a new canvas course id of #{data['id']}"
        else
            puts "Something went wrong creating course #{row['long_name']}! Response code was #{response.code}"
        end
    end

    create_course.run
end

puts "Script done running!"