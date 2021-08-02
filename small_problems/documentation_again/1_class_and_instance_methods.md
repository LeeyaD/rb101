Locate the ruby documentation for methods File::path and File#path. How are they different?

File::path
- Class method, can be called on the File class itself
- path(path) -> string
- returns the string representation of the path

File#path
- Instance method, called on an instance of the File class
- path -> filename or to_path -> filename