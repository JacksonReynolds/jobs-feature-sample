# Jobs Feature Sample

This is a repository that holds the jobs feature I built as a coding screening for IQTalentPartners for the Full Stack Engineer Position. It utilizes a Vue frontend on a Rails API backend with a Postgres database. It's basically a single model CRUD platform that allows the user to create and edit some Job listings with a filter feature. This was my first attempt at buidling a complete frontend with Vue, so I made the most of it without getting in over my head. I sure there are some blunders, feel free to create issues and roast me. 

## Jobs Frontend

As mentioned above, the front was built using Vue, and was templated using the Vue CLI and the create functionality included with that. There are no fancy packages as the goal of this assignment was to demonstrate strong fundamentals with JavaScript. There is another README in the `jobs-frontend` directory that further explains how to get it up and running.

## Job Backend

A pretty simple single model Rails API built with a SQlite3 db at first, then switched to Postgres after realizing that I needed to store an array of values for a single field in each record. Again, nothing fancy here. Nothing was spec'd for the API past being a REST interface as it wasn't _exactly_ part of the assignment. But what the hey. Again, there is another README in the `jobs-backend` directory that more specifically explains dependencies and server startup instructions.

### Author

Author: Jackson Reynolds
[Github](https://github.com/JacksonReynolds) - [LinkedIn](https://www.linkedin.com/in/jackson-reynolds-8175a0196/)