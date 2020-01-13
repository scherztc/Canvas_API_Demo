# demonstrates writing to a csv file

# import the necessary gems
require 'csv'

#identify location of script
output_file = 'sample_course_provisioning.csv' # put the full path of an output csv (doesn't have to exist yet) eg: '/my/path/to/output.csv'

CSV.open(output_file, 'wb') do |csv| #will create a csv in the output file location and name if it doesn't exist yet
    csv << %w(canvas_course_id course_id course_name published?)
end

puts "Script done running!"
