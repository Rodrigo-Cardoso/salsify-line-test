# README

Created acording to the documentation supplied @ http://salsify.github.io/line-server

Using Ruby 3.0.2
Made in Xubuntu 22.04 LTS (Based on Ubuntu 22.04 LTS) after fresh installation
Development environment made with docker

Run "build.sh" for installation of docker with the script from https://get.docker.com/ and building of docker image.
The same file is also prepared for a native installation using ruby3.0 from ubuntu's package manager, using the flag '--native'.

To execute, run "run.sh", followed by the file to be used. This script will detect a valid docker install and subsequent docker image to execute the rails server OR run it in native mode.

#--- Q&A ---

## Flow of operations
- The file used as parameter in run.sh will be copied to the folder "public/files" under the name "line_file.txt", after it is detected as a valid .txt file.
- Server will start in port 3000 with 5 Puma threads (default for a new rails app. Environment configurations have not been changed from the automatically generated ones)
### File size and operation
- Any file should work, as long as a line fits into memory (as per documentation)
- Lines are read 1 by 1 until the requested line is reached.
### Server operation
- As the server is capable of running several puma threads at once, it will boot another server instance as needed until it reaches the limit of 5

## Documentation used
- https://ruby-doc.org/core-2.5.1/IO.html#method-c-foreach
- https://www.rubydoc.info/stdlib/core/IO:readlines (not used in final version after evaluation)
- https://stackoverflow.com/questions/59531764/rails-file-readlines-vs-file-gets
- https://www.howtoforge.com/setup-ruby-on-rails-development-environment-with-docker-and-docker-compose-on-ubuntu/ (docker run command for new RoR app)
- https://rapidapi.com/blog/how-to-build-an-api-in-ruby/ (usage of --api --skip-active-record flags)

## Third party libraries
- There was no inclusion of more libraries than the ones already available when creating a new Ruby on Rails server

## Time spent
- Between reserach, development, and testing, I might have spent just under 8h over the span of 3 days. The majority of time was spent developing the necessary shell scripts and logic associated with them (installing docker/installting nativelly + detecting the preffered method and running)

## Code analysis
- Could be cleaner
- Could use some more investigation into memory usage and profiling
- Currently accessible without user authentication
- Does not validate if the line_id param is an actual valid integer
- Does not validate the existance of the file used for all requests
- Should have a simples .txt file for unit testing
