require 'typhoeus'
require 'link_header'
require 'json'
require 'csv'

canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
api_endpoint = '/api/v1/accounts/self/courses'
output_csv = '' # put the full path of an output csv (doesn't have to exist yet) eg: '/my/path/to/output.csv'

############# Don't edit below this line unless you know what you are doing ############

CSV.open(output_csv, 'wb') do |csv|
    csv << ["canvas_course_id", "sis_course_id", "name", "total_students_enrolled"]
end

request_url = "#{canvas_url}#{api_endpoint}"
count = 0
more_data = true
while more_data   # while more_data is true keep looping through the data
    get_courses = Typhoeus::Request.new(
        request_url,    #we need a variable here because we need the api url to change
        method: :get,
        headers: { authorization: "Bearer #{canvas_token}" },
        params:{
            "with_enrollments" => true,
            "published" => true,
            "include[]" => "total_students"
        }
        )

    get_courses.on_complete do |response|
        #get next link
            links = LinkHeader.parse(response.headers['link']).links
            next_link = links.find { |link| link['rel'] == 'next' } 
            request_url = next_link.href if next_link 
            if next_link && "#{response.body}" != "[]"
                more_data = true
            else
                more_data = false
            end
        #ends next link code

        if response.code == 200
            data = JSON.parse(response.body)
            data.each do |courses|
                # puts courses
                count += 1
                puts "#{count} - Course #{courses['id']} has #{courses['total_students']} students enrolled"
                CSV.open(output_csv, 'a') do |csv|
                    csv << [courses['id'], courses['sis_course_id'], courses['name'], courses['total_students']]
                end
            end
        else
            puts "Something went wrong! Response code was #{response.code}"
        end
    end

    get_courses.run
end
puts "Script done running"