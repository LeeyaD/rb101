# Sometimes, the documentation is going to leave you scratching your head.

# In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.
# https://ruby-doc.org/stdlib-3.0.0/libdoc/psych/rdoc/Psych.html