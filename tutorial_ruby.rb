#initialize

$auth_token = ''
$school_domain = ''
$mapping_file_path = '/home/scherztc'
$first_name = 'Thomas'
$last_name = 'Scherz'

#referencing

if response.code == 200
  puts "Created successfull User #{first_name} #{last_name}
else
  puts "Error."
end


#array

course_info = {"course_id" => 123, "user_id" => 234, "role" => student }
puts course_info["course_id"]
puts "The old course number is #{row['canvas_course_id']}"
 
