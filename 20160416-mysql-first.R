library(RJDBC)
jar.loc <- 'C:\\Program Files\\MySQL\\mysql-connector-java-5.1.38\\mysql-connector-java-5.1.38-bin.jar'
drv <- JDBC("com.mysql.jdbc.Driver",
            jar.loc,
            identifier.quote="`")
conn <- dbConnect(drv, "jdbc:mysql://localhost/appledaily", "root", "test")

dbDisconnect(conn)

dbWriteTable(conn, 'iris', iris)
dbListTables(conn)
dbReadTable(conn, 'iris')

res <- dbGetQuery(conn, "SELECT * FROM iris")
class(res)

