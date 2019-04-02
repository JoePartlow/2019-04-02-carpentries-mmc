# tidyr

# spread()
# gather
# separate()
# unite()

# Create gap_wide
gap_wide <- gapminder %>%
  gather(key = 'key', value = 'value', c('pop', 'lifeExp', 'gdpPercap')) %>%
  mutate(year_var = paste(key, year, sep = '_')) %>%
  select(country, continent, year_var, value) %>%
  spread(key = 'year_var', value = 'value')

str(gapminder)
skimr::skim(gapminder)
view(gapminder)
view(gap_wide)

gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, starts_with('pop'),
         starts_with('lifeExp'), starts_with('gdpPercap'))
str(gap_long)

str(gap_wide)

gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, -continent, -country)


skimr::skim(gap_long)

view(gap_long)
gap_long %>% head(10)



group_by(gap_long,continent,)
summarise(gap_long, )

group_by(gap_long,continent,obs_type) %>%
summarise(means=mean(gap_long,obs_values )
