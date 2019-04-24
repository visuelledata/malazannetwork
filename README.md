# Data 

characters folder 
- Contains the manually extracted character information as text files. 

alias.csv
- Contains the cleaned alias data. 

network_data.csv
- The cleaned network data. 

occurrence_data.csv
- Contains the cleaned occurrence data with single names (matches that can't be used to create edges.

pov-data.csv
- Contains the cleaned pov-data. 

pre_network_data 
- Contains the network data, but without splitting it into 2 columns.

# Scripts

extract-names.R
- This script contains most of the code to extract the co-occurrence data from the novels. 

extract-names.rmd
- This notebook contains most of the initial data cleaning and pre-processing. 

import_alias.R
- This script pulls the data from Google Sheets and formats it, then writes it to a file. 

import_books.R
- This script loads in the novels and does some data cleaning and pre-processing. 

import_characters.R 
- This script loads in the character name text files and gets it into a usable format. 

import_pov_data.R 
- This script pulls the data from Google Sheets and formats it, then writes it to a file. 

standardize_names.R
- This script contains most of the code that formats the names and standardizes them. Mostly just a bunch of regex and str_replace calls. 

writeup.rmd
- This is the rmd file that I used to generate the pdf report. 

# Bibliography

- Erikson, S. (1999). Gardens of the Moon. London: Bantam.

- Erikson, S. (2000). Deadhouse Gates. London: Bantam.

- Erikson, S. (2001). Memories of Ice. London: Bantam.

- Erikson, S. (2002). House of Chains. London: Bantam.

- Erikson, S. (2004). Midnight Tides. London: Bantam.

- Erikson, S. (2006). The Bonehunters. London: Bantam.

- Erikson, S. (2007). Reaper's Gale. London: Bantam.

- Erikson, S. (2008). Toll the Hounds. London: Bantam.

- Erikson, S. (2009). Dust of Dreams. London: Bantam.

- Erikson, S. (2011). The Crippled God. London: Bantam.

- Nielsen, Å. (2011, March). AFINN Sentiment Lexicon. Retrieved from http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010

- Mohammad, S., & Turney, P. (n.d.). NRC Emotion Lexicon. Retrieved from https://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm

- Malazan Wiki. (n.d.). Retrieved from https://malazan.fandom.com/wiki/Malazan_Wiki

- R/Malazan - Main series character POV data. Data from https://www.reddit.com/r/Malazan/comments/a1ukxk/main_series_character_pov_data/

- R/Malazan - Malazan alias data. Data created by me. Some aliases crowd-sourced from https://www.reddit.com/r/Malazan/comments/alaknz/spoilers_what_are_aliases_are_there_in_this_series/ 

