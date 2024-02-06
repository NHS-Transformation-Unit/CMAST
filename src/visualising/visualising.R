
# Trust level visuals -----------------------------------------------------

# Visualising Trusts in one line chart

ggplot(Trust_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") + 
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom")

# Create small multiples of line charts

ggplot(Trust_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Der_Provider_Code, group = Provider_Name)) +
  geom_line(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Trust_Attendances_Weekly, aes(x = day_of_week, y = Total_attendances, fill = Der_Provider_Code, group = Provider_Name)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Day of the Week",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Trust_Attendances_Hourly, aes(x = hour_of_day, y = Total_attendances, fill = Der_Provider_Code, group = Provider_Name)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Name, scales = "free_x") +
  labs(title = "Mental Health attendances by trust",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))


# Site level visuals ------------------------------------------------------

# Create small multiples of line charts

ggplot(Site_Attendances_Monthly, aes(x = Month, y = Total_attendances, colour = Provider_Site, group = Provider_Site)) +
  geom_line(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Month",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "none",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Site_Attendances_Weekly, aes(x = day_of_week, y = Total_attendances, fill = In_hours, group = Provider_Site)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Day of the Week",
       y = "Total Attendances") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1),
        legend.position = "bottom",
        plot.background = element_rect(fill = "white"))

# Weekly distribution of attendance

ggplot(Site_Attendances_Hourly, aes(x = hour_of_day, y = Total_attendances, fill = Provider_Site, group = Provider_Site)) +
  geom_bar(stat = "identity") +
  facet_wrap(~Provider_Site, scales = "free_x") +
  labs(title = "Mental Health attendances by site",
       caption = "Source: SUS Emergency Care data Apr-19 to Dec-23",
       x = "Hour of the day",
       y = "Total Attendances") +
  scale_x_continuous(breaks = seq(0, 24, by = 6)) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "white"))
