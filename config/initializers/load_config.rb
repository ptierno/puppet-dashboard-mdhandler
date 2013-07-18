# Handle configuration default values.  We can't do this the normal way,
# because the sample file is part of the main product, and we don't have a
# per-plugin configuration file at this time.

# Keep in mind that the head div is only 75px in hieght. Use an appropriate logo image.
::SETTINGS.logo_path   = 'http://www.example.com'
::SETTINGS.logo_image  = 'https://www.example.com/images/logo.png'
::SETTINGS.links = [
  [ 'Test Link 1', 'http://testlink1.com/' ],
  [ 'Test Link 2', 'http://testlink2.com/' ],
]
