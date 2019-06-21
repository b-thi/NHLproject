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

# Exploratory analysis
playoffs_hits_per_game <- length(which(playoffs_plays$event == "Hit"))/length(unique(playoffs$game_id))
regular_hits_per_game <- length(which(regular_season_plays$event == "Hit"))/length(unique(regular_season$game_id))

playoffs_blocked_shots_per_game <- length(which(playoffs_plays$event == "Blocked Shot"))/length(unique(playoffs$game_id))
regular_blocked_shots_per_game <- length(which(regular_season_plays$event == "Blocked Shot"))/length(unique(regular_season$game_id))

playoffs_shots_per_game <- length(which(playoffs_plays$event == "Shot"))/length(unique(playoffs$game_id))
regular_shots_per_game <- length(which(regular_season_plays$event == "Shot"))/length(unique(regular_season$game_id))

playoffs_missed_shots_per_game <- length(which(playoffs_plays$event == "Missed Shot"))/length(unique(playoffs$game_id))
regular_missed_shots_per_game <- length(which(regular_season_plays$event == "Missed Shot"))/length(unique(regular_season$game_id))

playoffs_giveaways_per_game <- length(which(playoffs_plays$event == "Giveaway"))/length(unique(playoffs$game_id))
regular_giveaways_per_game <- length(which(regular_season_plays$event == "Giveaway"))/length(unique(regular_season$game_id))

playoffs_takeaways_per_game <- length(which(playoffs_plays$event == "Takeaway"))/length(unique(playoffs$game_id))
regular_takeaways_per_game <- length(which(regular_season_plays$event == "Takeaway"))/length(unique(regular_season$game_id))

playoffs_penalties_per_game <- length(which(playoffs_plays$event == "Penalty"))/length(unique(playoffs$game_id))
regular_penalties_per_game <- length(which(regular_season_plays$event == "Penalty"))/length(unique(regular_season$game_id))

playoffs_hits <- playoffs_plays %>% 
  filter(event == "Shot")

ggplot(playoffs_hits, aes( x = x, y = y)) + geom_point()


