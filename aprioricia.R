df_groceries <- read.csv("~/project/datamining/R programs/groceries.csv")
str(df_groceries)

df_sorted <- df_groceries[order(df_groceries$Member_number),]
df_sorted$Member_number <- as.numeric(df_sorted$Member_number)

df_sorted$itemDescription <- as.factor(df_sorted$itemDescription)

str(df_sorted)

if(sessionInfo()['basePkgs']=="dplyr" | sessionInfo()['otherPkgs']=="dplyr"){
  detach(package:dplyr, unload=TRUE)
}

library(plyr)
df_itemList <- ddply(df_groceries, c("Member_number","Date"), function(df1)paste(df1$itemDescription,collapse = ","))

df_itemList$Member_number <- NULL
df_itemList$Date <- NULL

colnames(df_itemList) <- c("itemList")
write.csv(df_itemList,"~/project/datamining/R programs/ItemList.csv", quote = FALSE, row.names = TRUE)

library(arules)

txn = read.transactions(file="~/project/datamining/R programs/ItemList.csv", rm.duplicates= FALSE, format="basket",sep=",",cols=1);

txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels)

basket_rules <- apriori(txn,parameter = list(minlen=2,sup = 0.001, conf = 0.01, target="rules"))
#basket_rules <- apriori(txn,parameter = list(minlen=2,sup = 0.00001, conf = 0.01, target="rules"),appearance = list(lhs = "CLEMENTINES")))

#check if tm is attched; if yes then detach
if(sessionInfo()['basePkgs']=="tm" | sessionInfo()['otherPkgs']=="tm"){
  detach(package:sentiment, unload=TRUE)
  detach(package:tm, unload=TRUE)
}

#view rules
inspect(basket_rules)