# import the json gem
require 'json'

# sample canvas json response
users = '[{"id":7,"name":"Natalie Baker","sortable_name":"Baker, Natalie","short_name":"Natalie Baker","sis_user_id":null,"integration_id":null,"sis_import_id":null,"login_id":"sdemo+nbaker@instructure.com"},{"id":8,"name":"Jane Belo","sortable_name":"Belo, Jane","short_name":"Jane Belo","sis_user_id":null,"integration_id":null,"sis_import_id":null,"login_id":"sdemo+jbelo@instructure.com"},{"id":9,"name":"James Casey","sortable_name":"Casey, James","short_name":"James Casey","sis_user_id":null,"integration_id":null,"sis_import_id":null,"login_id":"sdemo+jcasey@instructure.com"},{"id":10,"name":"Kelly Chambers","sortable_name":"Chambers, Kelly","short_name":"Kelly Chambers","sis_user_id":"kchambers","integration_id":null,"sis_import_id":112,"login_id":"new_login"},{"id":18,"name":"Stephanie Charles","sortable_name":"Charles, Stephanie","short_name":"Stephanie Charles","sis_user_id":"sdemo+scharles@instructure.com_1422316350","integration_id":null,"sis_import_id":112,"login_id":"sdemo+scharles@instructure.com"},{"id":11,"name":"Aaron Jurel","sortable_name":"Jurel, Aaron","short_name":"Aaron Jurel","sis_user_id":"ajurel","integration_id":null,"sis_import_id":112,"login_id":"sdemo+ajurel@instructure.com"},{"id":12,"name":"George Kasabian","sortable_name":"Kasabian, George","short_name":"George Kasabian","sis_user_id":"gkasbian","integration_id":null,"sis_import_id":112,"login_id":"sdemo+gkasabian@instructure.com"},{"id":13,"name":"Megan Lange","sortable_name":"Lange, Megan","short_name":"Megan Lange","sis_user_id":"mlange","integration_id":null,"sis_import_id":112,"login_id":"sdemo+mlange@instructure.com"},{"id":14,"name":"Maria Pereira","sortable_name":"Pereira, Maria","short_name":"Maria Pereira","sis_user_id":"mpereira","integration_id":null,"sis_import_id":112,"login_id":"sdemo+mpereira@instructure.com"},{"id":15,"name":"Alex Roberts","sortable_name":"Roberts, Alex","short_name":"Alex Roberts","sis_user_id":"aroberts","integration_id":null,"sis_import_id":112,"login_id":"sdemo+aroberts@instructure.com"}]'

data = JSON.parse(users)        # use json gem to convert the json response to an array

data.each do |user_info|        # loop over each user's data stored in the array
    puts user_info              # output their data
    puts ""                     # add a spare line for demonstration purposes
end