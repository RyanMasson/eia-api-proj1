# data exploration and hypothesis generation process with OR and WA electricity sales from 2020-2022 

library(httr)
library(jsonlite)

orwa_sales_raw = fromJSON(rawToChar(GET('https://api.eia.gov/v2/electricity/retail-sales/data/?frequency=monthly&data[0]=customers&data[1]=price&data[2]=revenue&data[3]=sales&facets[stateid][]=OR&facets[stateid][]=WA&start=2020-01&end=2022-12&sort[0][column]=period&sort[0][direction]=desc&offset=0&length=5000&api_key=Mli1qH27tE9etbjMLrvgZugccBG0gcBwoLbPcZQn')$content))

orwa_sales = data.frame(orwa_sales_raw$response$data)

# in this data frame each observation is the sales to one of the six sector categories (commercial, residential, industrial, transportation, other, all sectors) in a given month from OR or WA.

ggplot(data = orwa_sales) + geom_point(mapping = aes(x = sales, y = revenue)) # line goes up!!
ggplot(data = orwa_sales) + geom_point(mapping = aes(x = sales, y = revenue, color = sectorName)) 

ggplot(data = orwa_sales) + geom_point(mapping = aes(x = period, y = sales, color = sectorName))
ggplot(data = orwa_sales) + geom_point(mapping = aes(x = period, y = sales, color = stateid)) + facet_wrap(~ sectorName)
ggplot(data = orwa_sales) + geom_smooth(mapping = aes(x = period, y = sales, color = sectorName, group = sectorName)) + geom_point(mapping = aes(x = period, y = sales, color = sectorName))

ggplot(data = orwa_sales) + geom_point(mapping = aes(x = period, y = price, color = sectorName)) + facet_grid(stateid ~ sectorName)


