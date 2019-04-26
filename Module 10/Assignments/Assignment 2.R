edges = read.csv("edges.csv")

users = read.csv("users.csv")

str(users)
str(edges)
292/59=4.95
table(users$locale, users$school)
table(users$gender, users$school)
install.packages("igraph")

library(igraph)
?graph.data.frame
g = graph.data.frame(edges, FALSE, users)
table(degree(g) >= 10)
V(g)$size = degree(g)/2+2
plot(g, vertex.label=NA)
summary(degree(g))
18/2+2=11
0/2+2=2
V(g)$gender
V(g)$school
V(g)$locale
V(g)$color = "black"

V(g)$color[V(g)$gender == "A"] = "red"

V(g)$color[V(g)$gender == "B"] = "gray"
plot(g, vertex.label=NA)
V(g)$color = "black"

V(g)$color[V(g)$school == "A"] = "red"

V(g)$color[V(g)$school == "AB"] = "gray"

plot(g, vertex.label=NA)
install.packages("rgl")
library(rgl)
rglplot(g, vertex.label=NA)
plot(g, edge.width=2, vertex.label=NA) 

