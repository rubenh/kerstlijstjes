{
  "name": "mysql",
  "description": "mySQL database server",
  "json_class": "Chef::Role",

  "run_list": ["recipe[kerst]",
               "recipe[mysql::client]",
               "recipe[mysql::server]",
               "recipe[kerst::database]",
               "recipe[kerst::database_configuration]"]
}
