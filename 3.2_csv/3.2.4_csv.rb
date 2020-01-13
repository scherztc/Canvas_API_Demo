# demonstrates writing to a csv file

# import the necessary gems
require 'csv'
require 'json'

#identify location of output
output_file = ''

CSV.open(output_file, 'wb') do |csv|
    csv << ["canvas_course_id", "sis_course_id", "course_name", "published?"]
end

courses = '[{"id":1,"name":"Algebra I","account_id":4,"uuid":"CbeuQBQPAhpcX9VeaUGRtcLK8GakSfnsYq24oUUc","start_at":"2014-08-01T16:18:00Z","grading_standard_id":null,"is_public":true,"course_code":"I","default_view":"modules","root_account_id":1,"enrollment_term_id":1,"end_at":null,"public_syllabus":true,"public_syllabus_to_auth":false,"storage_quota_mb":500,"is_public_to_auth_users":false,"apply_assignment_group_weights":false,"calendar":{"ics":"https://jperkins.test.instructure.com/feeds/calendars/course_CbeuQBQPAhpcX9VeaUGRtcLK8GakSfnsYq24oUUc.ics"},"time_zone":"America/Denver","sis_course_id":"I","sis_import_id":null,"integration_id":null,"hide_final_grades":false,"workflow_state":"available","restrict_enrollments_to_course_dates":false},{"id":2,"name":"9th Grade English","account_id":5,"uuid":"mLYv18b9DAn9PWVgGj51wGFSgvqqD7gnkjRLkxMB","start_at":null,"grading_standard_id":null,"is_public":false,"course_code":"love","default_view":"modules","root_account_id":1,"enrollment_term_id":1,"end_at":null,"public_syllabus":false,"public_syllabus_to_auth":false,"storage_quota_mb":500,"is_public_to_auth_users":false,"apply_assignment_group_weights":false,"calendar":{"ics":"https://jperkins.test.instructure.com/feeds/calendars/course_mLYv18b9DAn9PWVgGj51wGFSgvqqD7gnkjRLkxMB.ics"},"time_zone":"America/Denver","sis_course_id":"can","sis_import_id":null,"integration_id":null,"hide_final_grades":false,"workflow_state":"available","restrict_enrollments_to_course_dates":false},{"id":3,"name":"Teaching and Learning","account_id":2,"uuid":"rjUY0ee1NpQT13MiemEKSIQdBVmmL2CfvVdY2UUD","start_at":null,"grading_standard_id":null,"is_public":false,"course_code":"learning","default_view":"feed","root_account_id":1,"enrollment_term_id":1,"end_at":null,"public_syllabus":false,"public_syllabus_to_auth":false,"storage_quota_mb":500,"is_public_to_auth_users":false,"apply_assignment_group_weights":false,"calendar":{"ics":"https://jperkins.test.instructure.com/feeds/calendars/course_rjUY0ee1NpQT13MiemEKSIQdBVmmL2CfvVdY2UUD.ics"},"time_zone":"America/Denver","sis_course_id":"do","sis_import_id":null,"integration_id":null,"hide_final_grades":false,"workflow_state":"unpublished","restrict_enrollments_to_course_dates":false},{"id":4,"name":"sample","account_id":1,"uuid":"uwzoq4YkeGEGuJC1QEYmnoS2cfuMEhgKYAe0hxdd","start_at":null,"grading_standard_id":null,"is_public":false,"course_code":"Ruby!","default_view":"feed","root_account_id":1,"enrollment_term_id":1,"end_at":null,"public_syllabus":false,"public_syllabus_to_auth":false,"storage_quota_mb":500,"is_public_to_auth_users":false,"apply_assignment_group_weights":false,"calendar":{"ics":"https://jperkins.test.instructure.com/feeds/calendars/course_uwzoq4YkeGEGuJC1QEYmnoS2cfuMEhgKYAe0hxdd.ics"},"time_zone":"America/Denver","sis_course_id":"the csv gem!","sis_import_id":null,"integration_id":null,"hide_final_grades":false,"workflow_state":"unpublished","restrict_enrollments_to_course_dates":false}]'

data = JSON.parse(courses)            # use json gem to convert the json response to an array

data.each do |course_info|
    canvas_course_id = course_info["id"]
    sis_course_id = course_info["sis_course_id"]
    course_name = course_info["name"]
    published = course_info["workflow_state"]

    CSV.open(output_file, 'a') do |csv|
        csv << [canvas_course_id, sis_course_id, course_name, published]
    end
end

puts "Script done running!"

