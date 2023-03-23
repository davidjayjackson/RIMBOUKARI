# Load the arules package
library(arules)

# Convert iris to a transactions object
trans <- as(iris, "transactions")

# Mine association rules
rules <- apriori(trans, parameter = list(support = 0.1, confidence = 0.8))

# Inspect the rules
inspect(rules)
rules_df <- as(rules, "data.frame")
View(rules_df)
