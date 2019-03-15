#' @title: GSW Shot Charts 
#' @description: to create the shot charts for each five GSW players
#' @inputs: five data sets
#' @outputs: shot charts for each five GSW players

library(ggplot2)
library(jpeg)
library(grid)

# Shot Charts

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"

# create raste object
court_image <- rasterGrob( 
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))


# Shot Chart for Andre Iguodala
andre_shot_chart <- ggplot(data = andre) + 
     annotation_custom(court_image, -250, 250, -50, 420) + 
     geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
     ylim(-50, 420) +
     ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
     theme_minimal()

# save the plots in PDF format
pdf(file = "../images/andre-iguodala-shot-chart.pdf",
    width = 6.5, height = 5)
andre_shot_chart
dev.off()


# Shot Chart for Graymond Green
green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Graymond Green (2016 season)') + 
  theme_minimal()

# save the plots in PDF format
pdf(file = "../images/graymond-green-shot-chart.pdf",
    width = 6.5, height = 5)
green_shot_chart
dev.off()


# Shot Chart for Kevin Durant
kevin_shot_chart <- ggplot(data = kevin) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

# save the plots in PDF format
pdf(file = "../images/kevin-durant-shot-chart.pdf",
    width = 6.5, height = 5)
kevin_shot_chart
dev.off()


# Shot Chart for Klay Thompson
klay_shot_chart <- ggplot(data = klay) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

# save the plots in PDF format
pdf(file = "../images/klay-thompson-shot-chart.pdf",
    width = 6.5, height = 5)
klay_shot_chart
dev.off()


# Shot Chart for Stephen Curry
curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

# save the plots in PDF format
pdf(file = "../images/stephen-curry-shot-chart.pdf",
    width = 6.5, height = 5)
curry_shot_chart
dev.off()


# Facetted Shot Chart
gsw_shot_charts <- ggplot(data = shots_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  facet_wrap( ~ name) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + 
  theme_minimal()
  
# save the plots in PDF format
pdf(file = "../images/gsw-shot-charts.pdf",
    width = 8, height = 7)
gsw_shot_charts
dev.off()

# save the plots in PNG format
png(filename = "../images/gsw-shot-charts.png",
    width = 8, height = 7, units = "in", res = 300)
gsw_shot_charts
dev.off()








