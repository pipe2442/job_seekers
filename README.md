# Job Seeker Project

## Description

This project uses Ruby to identify qualified job candidates based on their location and availability. It includes a Ruby script that leverages ActiveRecord, Geocoder, and Benchmark-ips to perform data manipulation and querying directly in memory using SQLite3.

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

## Requirements

- Ruby (version 3.2.2 or higher recommended)
- Bundler

## Installation

To run this project, follow these steps:

Clone this repository to your local machine:

```
git clone https://github.com/pipe2442/job-seeker-project.git
cd job-seeker-project
```

Ensure that Ruby and Bundler are installed on your system. You can check your Ruby and Bundler version by running:

```
ruby -v
bundler -v
```

And install Bundler if it's not installed:

```
gem install bundler
```

To run the script, navigate to the project directory and execute:

```
ruby job_seekers.rb
```
