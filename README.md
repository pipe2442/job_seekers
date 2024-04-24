# Job Seeker Project

## Description

This enhanced Rails-based project efficiently identifies qualified job candidates based on their location and availability. It utilizes a highly optimized SQL query, ActiveRecord, and leverages Redis caching to manage and query large datasets with high efficiency. The database is carefully indexed to speed up query execution, and Redis is used to cache query results, drastically reducing response times and improving overall performance.

Input Specifications:

```
Job ID: x
Role ID: 23
Location: Specified by latitude and longitude.
Dates: March 14, 15, and 18, 2024.
```

Output Requirements:

```
Produce a list of up to 1,000 job seekers who:
Are interested in the role (role_id 23).
Are located within 30 miles of the specified coordinates.
Are available on all the specified dates.
The list should be ordered by the job seekers' ratings for the role in descending order, prioritizing the most qualified candidates.
```

System Requirements

- Ruby (version 3.2.2 or higher recommended)
- Rails
- Redis
- Bundler

Installation

Follow these steps to set up and run the project:

- Clone the Repository

```
git clone https://github.com/pipe2442/job-seeker-project.git
cd job-seeker-project
```

Verify Ruby and Bundler Installation
Ensure Ruby and Bundler are installed:

```
ruby -v
bundler -v
```

If Bundler is not installed:

```
gem install bundler
```

Install Redis
Make sure Redis is installed and running on your system. Installation details can be found at Redis's official website [here](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/)

Start Redis

```
redis-server
```

Bundle Install
Install the necessary Ruby gems:

```
bundle install
```

Setup Database
Configure your database settings and run migrations:

```
rails db:create
rails db:migrate
rails db:seed
```

Start the Rails Server

Run the server:

```
rails server
```

Running the Tasks

To process job seekers based on the specified criteria, you can run two custom rake tasks:

- Find Qualified Candidates
  This task fetches job seekers who meet the given criteria using an optimized query:

```
rake job_seekers:find_qualified_candidates
```

Performance Test
Run a performance test to see how efficiently the system handles queries with Redis caching:

```
rake performance:test
```

These tasks utilize indexed database queries and Redis caching to demonstrate high performance in processing and retrieving data.
