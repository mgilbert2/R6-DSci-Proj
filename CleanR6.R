library(tidyverse)
library(stringr)

 View(my_table)
 colnames(my_table)
# [1] "Name"                 "Type"                 "Operator"            
# [4] "Team"                 "CTU"                  "Damage (Suppressed*)"
# [7] "ROF"                  "Magazine"             "Suppressor"          
# [10] "ACOG"                 ""                    
colnames(my_table)[11] <- "Range"
# 
# df<-my_table
# #   
# # df <- df %>%
# #   mutate(Operators = str_split(Operator, "(?=[A-Z])")) %>%
# #   unnest(Operators)

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


high_pick <- c("Finka", "Iana", "Sledge", "Thatcher", "Twitch", "Alibi", "Jager", "Melusi", "Mute")
average_pick <- c("Valkyrie", "Thunderbird", "Smoke", "Bandit", "Kaid", "Wamai", "Mozzie", "Azami", "Lesion", "Kapkan", "Aruni", "Oryx", "Jackal", "Ace", "Thermite", "Zofia", "Maverick", "Hibana", "Ash", "Nomad")
low_pick <- c("Buck", "Osa", "Nokk", "Flores", "Amaru", "IQ", "Zero", "Montagne", "Dokkaebi", "Blackbeard", "Lion", "Blitz", "Kali", "Capitao", "Fuze", "Ying", "Gridlock", "Glaz", "Sens", "Vigil", "Doc", "Ela", "Mira", "Goyo", "Frost", "Thorn", "Maestro", "Pulse", "Rook", "Castle", "Clash", "Warden", "Caveira", "Echo", "Tachanka")

my_table_long <- my_table_split %>%
  mutate(PickRate = case_when(
    Operator %in% high_pick ~ "High Pick Rate",
    Operator %in% average_pick ~ "Average Pick Rate",
    Operator %in% low_pick ~ "Low Pick Rate",
    TRUE ~ NA_character_
  ))

# View the modified table with the new PickRate column
glimpse(my_table_long)

my_table_long <- my_table_long %>%
  rename(Weapon = Name)

library(ggplot2)

# Filter for High Pick Rate weapons
high_pick_rate_weapons <- my_table_long %>% filter(`PickRate` == 'High Pick Rate')

# Create the ggplot
ggplot(high_pick_rate_weapons, aes(x = Weapon)) +
  geom_bar() +
  coord_flip() +  # Flipping the axis for better visualization
  labs(title = "Weapons associated with 'High Pick Rate' Operators", 
       x = "Weapons", 
       y = "Count") +
  theme_minimal()



#not handgun
# Filter out rows where Type is "handgun"
filtered_table <- my_table_long %>% filter(Type != "Handgun")

# Get the unique weapons from the Weapon column after filtering
unique_weapons <- unique(filtered_table$Weapon)

# Count the number of unique weapons
number_of_unique_weapons <- length(unique_weapons)

# Print the result
print(number_of_unique_weapons)

view(unique_weapons)

