students.url <- "https://learn-us-east-1-prod-fleet02-xythos.learn.cloudflare.blackboardcdn.com/5f0d0e6d23ee0/36095603?X-Blackboard-Expiration=1619028000000&X-Blackboard-Signature=QiJq9WVYn9mbMMs%2Fuv9XFLfxrGbFnr%2Br%2BjbFODcU7WM%3D&X-Blackboard-Client-Id=301940&response-cache-control=private%2C%20max-age%3D21600&response-content-disposition=inline%3B%20filename%2A%3DUTF-8%27%27student-courses.json&response-content-type=application%2Fjson&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20210421T120000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=AKIAZH6WM4PL5SJBSTP6%2F20210421%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=46b147d6ad127bdac22a1502c42364bcb870c2d04148f44350c25d98ee8e272f"
pob.Students <- fromJSON(students.url)


