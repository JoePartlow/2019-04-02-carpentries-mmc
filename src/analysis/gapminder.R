library(here)

# pre-dplyr
gapminder <- readr::read_csv(here("data/gapminder/raw/gapminder_data.csv"))

mean(gapminder$gdpPercap [gapminder$continent == "Africa"])
mean(gapminder$gdpPercap [gapminder$continent == "Americas"])

#post dplyr
library(tidyverse)
year_country_gdp <- select(gapminder, year, country, gdpPercap)
#head(year_country_gdp)

year_country_gdp <- gapminder %>%
  select(lifeExp,country,year,continent) %>%
    filter(continent =="Africa")
nrow(year_country_gdp)

year_country_gdp <- gapminder %>%
   filter(continent =="Africa") %>% 
  select(lifeExp,country,year,continent)
nrow(year_country_gdp)

#group by
year_country_gdp <- 
  gapminder %>%
  group_by(continent) %>%
  summarise(mean_val = mean(gdpPercap))

#Average life exp by country
gapminder %>%
  group_by(country) %>%
  summarise(mean_val = mean(lifeExp)) %>%
  filter(mean_lifeExp = mean(lifeExp)  | m)
#  arrange(lifeExp)

##ggplot
ggplot(data=gapminder, aes(x= year,y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap( ~ country)
  

gapminder %>%
    filter(continent == "Africa") %>%
    
ggplot(data=gapminder, aes(x= year,y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap( ~ country)





