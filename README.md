# A Docker Laravel starter pack

This makes it super easy to get started on a new project.

Requirements:
* Everything needed to run docker. Tested with docker toolbox and virtualbox. https://docs.docker.com/toolbox/
 
1. Clone repo
1. cp docker/.env.example .env
1. Set project name in .env
1. docker-compose up
1. To rebuild vue assets and watch for changes: docker exec -it web-box-starter_pack npm run watch-poll
