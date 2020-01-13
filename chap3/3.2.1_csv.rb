# demonstrates reading from a csv file

# import the csv gem
require 'csv'

#identify location of script
csv_file = '/Users/scherztc/Workspace/Canvas_API_Demo/sample_course_provisioning.csv' # use full file path to sample_course_provisioning.csv eg: '/path/to/file/sample_course_provisioning.csv'

CSV.foreach(csv_file, headers: true) do |row|
    course_canvas_id = row['canvas_course_id']
    course_name = row['long_name']
    puts "#{course_name}'s Canvas URL is https://jperkins.test.instructure.com/courses/#{course_canvas_id}"
end
