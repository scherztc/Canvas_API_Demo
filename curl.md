Get User Details :

curl https://uc.instructure.com/api/v1/users/self \
    -X GET \
    -H 'Authorization: Bearer <token>'


{"id":3694653,"name":"Thomas Scherz","created_at":"2019-05-01T15:15:16-04:00","sortable_name":"Scherz, Thomas","short_name":"Thomas Scherz","avatar_url":"https://uc.instructure.com/images/messages/avatar-50.png","locale":null,"effective_locale":"en","permissions":{"can_update_name":true,"can_update_avatar":true}}


Update A User :

curl https://uc.instructure.com/api/v1/users/self \
    -X PUT \
    -F 'user[name]=Tommy Scherz' \
    -H 'Authorization: Bearer <token>'

https://uc.instructure.com/api/v1/users/3694653?user[name]=Thomas C Scherz II


