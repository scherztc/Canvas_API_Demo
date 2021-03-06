# import gems
require 'typhoeus'
require 'json'
require 'csv'


canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
csv_file = '' # full path to api_courses.csv  eg: full/path/to/file/api_courses.csv
success_count = 0
fail_count = 0

tab_ids = [                         # this is a nested or multidimensional array 
    ['modules','2','false'],        # ['id','position','hidden']
    ['announcements','3','false'], 
    ['discussions','4','false'], 
    ['grades','5','false'],
    ['assignments','6','true']      # you could add all other tabs here if you wanted to manage them all in one script
]

CSV.foreach(csv_file, headers: true) do |row|
    sis_course_id = row['course_id']

    tab_ids.each do |tab_info| # loop through each tab_id
        update_course = Typhoeus::Request.new(
            "#{canvas_url}/api/v1/courses/sis_course_id:#{sis_course_id}/tabs/#{tab_info[0]}",
            method: :put,
            headers: { authorization: "Bearer #{canvas_token}" },
            params: {
                "position" => tab_info[1],
                "hidden" => tab_info[2]
            }
            )

        update_course.on_complete do |response|
            if response.code == 200
                data = JSON.parse(response.body)
                puts "The course tab #{tab_info[0]} has been updated in course #{sis_course_id}"
            else
                puts "Something went wrong updating the course tab #{tab_id} in course #{sis_course_id}! Response code was #{response.code}"
            end
        end
        update_course.run
    end
end

puts "Script done running!"