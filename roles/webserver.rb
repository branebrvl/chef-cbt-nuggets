name "webserver"
description "Install a web server"
run_list  "recipe[apache::install]", "recipe[apache::base-files]"
