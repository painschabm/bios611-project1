headtohead <- read.csv("./derived_data/headtohead")

options(scipen = 100000)

pop2019vote2010 <- headtohead %>% 
  mutate(newpop_oldvote = pop_2019/votes_2010) %>% 
  filter(votes_2010>1)

pop2019vote2010 %>%
  mutate(state = fct_reorder(state, poppervote_2010)) %>%
  ggplot(aes(y = state)) + 
  geom_segment(aes(x = poppervote_2010, xend = newpop_oldvote, yend = state, 
                   color = winner)) +
  geom_point(aes(x = poppervote_2010)) +
  geom_point(aes(x = newpop_oldvote, color = "yellow")) +
  scale_color_manual(values = c("blue", "red", "yellow")) +
  labs(x = "Population Per Electoral Vote") +
  theme(axis.title.y=element_blank(), legend.position = "none")
ggsave("figures/state_shifts.png")

ggplot(headtohead, aes(x = votes_2010, fill = trump_clinton)) + 
  geom_histogram(alpha = 0.5, binwidth = 1) + 
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "Electoral Votes 2010", y = "Number of States/Districts", 
       fill = "2016")
ggsave("figures/2016_2010.png")

ggplot(headtohead, aes(x = votes_2020, fill = trump_clinton)) + 
  geom_histogram(alpha = 0.5, binwidth = 1) + 
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "Electoral Votes 2020", y = "Number of States/Districts", 
       fill = "2016")
ggsave("figures/2016_2020")

ggplot(headtohead, aes(x = votes_2010, fill = winner)) + 
  geom_histogram(alpha = 0.5, binwidth = 1) + 
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "Electoral Votes 2010", y = "Number of States/Districts")
ggsave("figures/votes_by_state_2010.png")

ggplot(headtohead, aes(x = votes_2020, fill = winner)) + 
  geom_histogram(alpha = 0.5, binwidth = 1) + 
  scale_fill_manual(values = c("blue", "red")) +
  labs(x = "Electoral Votes 2020", y = "Number of States/Districts")
ggsave("figures/votes_by_state_2020.png")