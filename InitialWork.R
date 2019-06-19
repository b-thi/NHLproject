library(tidyverse)

# Filter for games which are in the playoffs vs regular season
playoffs <- game %>% 
  select(game_id:home_goals) %>% 
  filter(type == "P")

regular_season <- game %>% 
  select(game_id:home_goals) %>% 
  filter(type == "R")

# match the game id's in the plays data to separate the play by play into
# playoffs and regular season
playoffs_plays <- game_plays %>% 
  filter(game_id %in% playoffs$game_id) %>% 
  mutate(goal_diff = goals_home - goals_away)

regular_season_plays <- game_plays %>% 
  filter(game_id %in% regular_season$game_id) %>% 
  mutate(goal_diff = goals_home - goals_away)

