# Phenowatch Dockerfile
# Use a base image with R and tidyverse installed
FROM rocker/tidyverse:latest

WORKDIR /app

# Install necessary R packages --> Other packages for the app
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinyjs', 'shinyscreenshot', 'raster', 'gstat', 'ggpubr', 'gridExtra', 'maps', 'rnpn'), repos = 'http://cran.us.r-project.org', dependencies=TRUE)"

# Copy your local repo into the Docker container
COPY . .

# Start shiny server when container is run
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]