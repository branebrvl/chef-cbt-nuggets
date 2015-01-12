name "webserver"
description "Install a web server"
run_list "recipe[web_server]"

override_attributes(
    "php" => {
      "install_method" => "source",          
      "version" => "5.5"
      }
)
