# Global Emissions and GDP: Exploring the decoupling effects accross countries

## Introduction

Can a country reduce emissions while growing its GDP? This question has gained significant attention in recent years as all countries globally are trying to achieve the economic development with maintaining environmental sustainability. In this assignment, we examine global power-sector emissions and GDP data from more than 200 countries to explore whether sustained economic growth can occur alongside meaningful emission reductions.

## Background

Economic growth and greenhouse gas emissions have traditionally been closely linked. The increase in GDP is often accompanied by higher emissions rate due to higher energy consumption, increasing industrial activities and infrastructure growth. However, the recent trend shows that some countries are beginning to break this pattern. By analyzing emissions alongside GDP, we can identify which countries are achieving ‘decoupling’ where economic growth increases without a corresponding rise in emissions. This decoupling can be a result of combination of multiple factors such as clean energy, improvements in energy efficiency, technological innovation and effective climate policies. The study of these trends provides valuable insights into how countries can pursue sustainable development, balancing economic progress with environmental responsibility. It can serve as a guide for other nations who are aiming to reduce their carbon footprint while maintaining their economic growth.

## Data Description

Here, we will work with the following data sets:

### GDP data

The data set comes from the [World Bank](https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=1W) and uses the indicator NY.GDP.MKTP.CD, which reports national gross domestic product (GDP) in current U.S. dollars. It measures the total value of all goods and services produced in a country in a given year, converted into U.S. dollars using that year’s official exchange rate. As it is a ‘current’ GDP, the values reflect the prices and exchange rates of the respective year, not adjusted for inflation or purchasing-power differences.

### Global emissions data

This data set is retrieved from [Climate TRACE](https://climatetrace.org/data). It provides a detailed, open-access global inventory of greenhouse gas and air pollution emissions. It aggregates data from hundreds of millions of emission sources worldwide including power plants, industrial facilities, transportation, agriculture, and more, allowing emissions to be broken down by country, sector, sub-sector and time period. The data cover emissions over multiple years, starting from 2015 for annual country-level data, and with monthly and source level records available since 2021 .

In this analysis, we focus specifically on the power sector data, which provides detailed emissions estimates, allowing us to examine trends and impacts within one of the largest sources of global greenhouse-gas emissions.

## Repository Structure

```
global-emission-gdp-energy-dynamics
└───.gitignore
    └───data
        └───API_NY.GDP.MKTP.CD_DS2_en_csv_v2_280632
            └── API_NY.GDP.MKTP.CD_DS2_en_csv_v2_280632.csv
        └───power
            └───ABOUT THE DATA
                └─── about_the_data_v5_1_0.pdf
            └───DATA
                └───electricity-generation_country_emissions_v5_1_0.csv
                └───heat-plants_country_emissions_v5_1_0.csv
                └───other-energy-use_country_emissions_v5_1_0.csv
└───global-emission-gdp-energy-dynamics.Rproj
└───README.md
└───emissions_gdp.qmd

```
## Course Information

-   **Course Title:** [EDS 222: Statistics for Environmental Data Science](https://eds-222-stats-f25.github.io/)
-   **Term:** Fall 2025
-   **Program:** [UCSB Masters in Environmental Data
    Science](https://bren.ucsb.edu/masters-programs/master-environmental-data-science).

Teaching Team:

-   **Instructor:** Dr. Max Czapanskiy 
-   **Teaching Assistant:** Nathan Grimes 

This repository contains the details of the [final project](https://eds-222-stats-f25.github.io/final-project.html) for the course EDS 222: Statistics for Environmental Data Science for the Master of Environmental Data Science (MEDS) program.

### **Author**: Aakriti Poudel

