# import gems
require 'typhoeus'
require 'json'
require 'csv'

canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
csv_file = '' # full path to api_courses.csv  eg: full/path/to/file/api_courses.csv
success_count = 0
fail_count = 0

tab_id = 'collaborations'  #need to retrieve the available tab ids /api/v1/courses/:course_id/tabs

CSV.foreach(csv_file, headers: true) do |row|
    sis_course_id = row['course_id']


    update_course = Typhoeus::Request.new(
        "#{canvas_url}/api/v1/courses/sis_course_id:#{sis_course_id}/tabs/#{tab_id}",
        method: :put,
        headers: { authorization: "Bearer #{canvas_token}" },
        params: {
            "hidden" => true
        }
        )

    update_course.on_complete do |response|
        if response.code == 200
            data = JSON.parse(response.body)
            puts "The course tab #{tab_id} has been hidden in course #{sis_course_id}"
            success_count += 1 # add 1 to the variable success_count
        else
            puts "Something went wrong updating the course tab #{tab_id} in course #{sis_course_id}! Response code was #{response.code}"
            puts fail_count += 1 # add 1 to the variable fail_count
        end
    end

    update_course.run
end

puts "Script done running! #{success_count} courses were updated. #{fail_count} courses failed to be updated"