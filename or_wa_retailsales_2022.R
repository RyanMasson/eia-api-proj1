# data exploration and hypothesis generation process with OR and WA electricity sales from 2022 

library(httr)
library(jsonlite)

orwa_sales2022_response = fromJSON(rawToChar(GET('https://api.eia.gov/v2/electricity/retail-sales/data/?frequency=monthly&data[0]=customers&data[1]=price&data[2]=revenue&data[3]=sales&facets[stateid][]=OR&facets[stateid][]=WA&start=2022-01&end=2022-12&sort[0][column]=period&sort[0][direction]=desc&offset=0&length=5000&api_key=Mli1qH27tE9etbjMLrvgZugccBG0gcBwoLbPcZQn')$content))

orwa_sales2022 = data.frame(orwa_sales2022_response$response$data)


