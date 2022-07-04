
# Flow of operations
- The file used as parameter in run.sh will be copied to the folder "public/files" under the name "line_file.txt", after it is detected as a valid .txt file.
- Server will start in port 3000 with 5 Puma threads (default for a new rails app. Environment configurations have not been changed from the automatically generated ones)
## File size and operation
- Any file should work, as long as a line fits into memory (as per documentation)
- Lines are read 1 by 1 until the requested line is reached.
## Server operation
- As the server is capable of running several puma threads at once, it will boot another server instance as needed until it reaches the limit of 5

# Documentation used
- https://ruby-doc.org/core-2.5.1/IO.html#method-c-foreach
- https://www.rubydoc.info/stdlib/core/IO:readlines (not used in final version after evaluation)
- https://stackoverflow.com/questions/59531764/rails-file-readlines-vs-file-gets

# Third party libraries
- There was no inclusion of more libraries than the ones already available when creating a new Ruby on Rails server

# Time spent
- Between reserach, development, and testing, I might have spent just under 8h over the span of 3 days. The majority of time was spent developing the necessary shell scripts and logic associated with them (installing docker/installting nativelly + detecting the preffered method and running)

# Code analysis
- Could be cleaner
- Could use some more investigation into memory usage and profiling
- Currently accessible without user authentication
- Does not validate if the line_id param is an actual valid integer
- Does not validate the existance of the file used for all requests
- Should have a simples .txt file for unit testing
