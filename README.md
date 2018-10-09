# A Docker Laravel starter pack

## Starting your project with Laravel

1. Clone repo and run docker-compose up.
1. Make sure you successfully started Docker. You can use `docker ps` to see a list of running Docker containers.
1. At this point you should be able to connect to Docker on the remote host. It's probably found at http://192.168.99.100/ but could be elsewhere.
1. If Docker has a running container (shown with `docker ps`) and yet you can't connect to the Apache server, check to see what your Docker machines IP
    address is. `docker-machine ip` will tell you. Try loading the address from `docker-machine ip` in your web browser.
3. Once you're sure Apache is working, connect to Docker with `docker exec -it laravel-container bash`
3 Laravel won't install into a directory containing files, so delete the `myapp` folder so the next step works properly. 
    From within Docker you can use: `rm -rf /var/www/myapp` 
4. Now install Laravel: `composer create-project --prefer-dist laravel/laravel myapp`. 
5. If you choose a project name other than `myapp` you also have to update the Apache
    config in `laravel-docker-starter-pack/docker/laravel/apache/000-default.conf`.

# Running npm commands for VueJS

1. I recommend running npm form within Windows instead of Docker. It's faster and less problematic.
3. Install the same version of npm in Windows which is installed in Docker.
4. Delete any node_module folders (and files) which were created in Docker. This helps solve issues with packages being installed in one OS but used in another.
5. Move into your projects public folder.
6. All normal npm commands should work: npm init; npm install; npm watch.

