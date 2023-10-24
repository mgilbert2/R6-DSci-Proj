library(tidyverse)
library(stringr)
library(dplyr)
 View(my_table)
 colnames(my_table)
# [1] "Name"                 "Type"                 "Operator"            
# [4] "Team"                 "CTU"                  "Damage (Suppressed*)"
# [7] "ROF"                  "Magazine"             "Suppressor"          
# [10] "ACOG"                 ""                    
colnames(my_table)[11] <- "Range"

df<-my_table
#   
# df <- df %>%
#   mutate(Operators = str_split(Operator, "(?=[A-Z])")) %>%
#   unnest(Operators)

library(dplyr)
library(tidyr)
library(stringr)

# Splitting the operator column based on uppercase letters
# Split the Operator column and unnest the result
my_table_split <- my_table %>%
  # Use str_extract_all to find all uppercase followed by lowercase strings (operators' names)
  mutate(Operator = str_extract_all(Operator, "[A-Z][a-z]+")) %>%
  # Unnest the list column to separate rows
  unnest(Operator)

# View the result
print(my_table_split)
view(my_table_split)