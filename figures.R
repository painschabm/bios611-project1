data <- filter(merged, candidate_name == "Joseph R. Biden Jr." | 
                 is.na(candidate_name))

ggplot(data, aes(x = votes_2010)) + 
  geom_histogram(color = "black", fill = "blue", alpha = 0.5,  
                 binwidth = 1) + 
  labs(x = "Electoral Votes 2010", y = "Number of States")
ggsave("figures/votes_by_state_2010.png")

ggplot(data, aes(x = votes_2020)) + 
  geom_histogram(color = "black", fill = "blue", alpha = 0.5,  
                 binwidth = 1) + 
  labs(x = "Electoral Votes 2020", y = "Number of States")
ggsave("figures/votes_by_state_2020.png")

ggplot(a, aes(x = candidate_name, y = pct_trend_adjusted)) +
  geom_boxplot(notch=TRUE, alpha=0.8) +
  labs(title="Weighted Mean Polling Average By State", x="Candidate", y="Polling Average") +
  ylim(25,75)
ggsave("figures/polling_averages.png")
