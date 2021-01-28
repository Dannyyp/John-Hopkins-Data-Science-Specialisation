myapp <- oauth_app("github",
                   key = "9873415f836420f11066",
                   secret = "e00a4ea50bb5e12c0d2009075643d8437ff62b23"
                   )

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)

datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
lib
#datashare

#list(output[[23]]$name, output[[23]]$created_at)