# Visualising Sites

ggplot(Site_Attendances, aes(x = Month, y = Total_attendances, fill = Provider_Site, group = Provider_Site)) +
  geom_line(stat = "identity") + 
  labs(title = "Mental Health attendances by site",
       caption = "Source: ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom") +
  scale_fill_viridis_d()

# Visualising Trusts in one line chart

ggplot(Trust_Attendances, aes(x = Month, y = Total_attendances, fill = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") + 
  labs(title = "Mental Health attendances by trust",
       caption = "Source: ECDS",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom")

# Create small multiples of line charts

ggplot(Trust_Attendances, aes(x = Month, y = Total_attendances, colour = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom",
        plot.background = element_rect(fill = "white")) +
  scale_colour_manual(values = c('RBS' = "blue",
                                 'RJN' = "red",
                                 'RWW' = "pink",
                                 'RBT' = "green",
                                 'RJR' = "purple",
                                 'RBL' = "orange",
                                 'REM' = "cyan",
                                 'RBN' = "magenta"))
