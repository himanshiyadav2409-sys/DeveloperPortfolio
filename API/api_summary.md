# API Interaction Summary

## 1. What is a REST API?

A REST API is a way for different applications to communicate with each other over the internet using HTTP methods. It allows users to request and exchange data between a client and a server. The data is commonly transferred in JSON format.

## 2. HTTP Status Codes

- **200 OK:** This status code means that the request was successful and the server returned the requested data.
- **404 Not Found:** This status code means that the requested resource could not be found on the server.

## 3. jq Filter Used

Command:

```bash
cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'
```

Explanation:

- `cat API/github_profile.json` reads the GitHub profile JSON file.
- `|` passes the output to jq.
- `jq` is a command-line tool used to process JSON data.
- `name:.name` extracts the GitHub user's name.
- `repos:.public_repos` extracts the number of public repositories.
- `followers:.followers` extracts the number of followers.
- `joined:.created_at` extracts the account creation date.

## 4. API Sources

- GitHub REST API: https://api.github.com/users/himanshiyadav2409-sys
- JSONPlaceholder: https://jsonplaceholder.typicode.com/posts
