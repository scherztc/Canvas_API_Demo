Update a User:

require 'uri'
require 'net/http'

url = URI("https://uc.instructure.com/api/v1/users/3694653?user[name]=Thomas%20C%20Scherz%20II")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Bearer <token>'
request["User-Agent"] = 'PostmanRuntime/7.11.0'
request["Accept"] = '*/*'
request["Cache-Control"] = 'no-cache'
request["Postman-Token"] = '<postman_token>'
request["Host"] = 'uc.instructure.com'
request["cookie"] = '_csrf_token=<_csrf_token>; log_session_id=56b0559c3b796e86e1d032adc1de078d; canvas_session=e0FEU8fqg0Oox9P3sppW2Q.kJwFc55sWb8fsZiPhipPOzc_5lfMlofdSrHPssDerVgSrUUNajwgCqP3QbibMbhq1AGvjoyp6O1RC0yq1Dj2Zv1TdvDnmjhomLrsxtWW6pL_9aZjglbONwj1-dU2zRGH.OauIQD8z09q47RmrS5BfiSDn29I.XhdiKQ'
request["accept-encoding"] = 'gzip, deflate'
request["content-length"] = ''
request["Connection"] = 'keep-alive'
request["cache-control"] = 'no-cache'

response = http.request(request)
puts response.read_body
