setwd("E:/数据分析/data/assigment_geo")
library(geojsonio)
library(ggplot2)
library(sf)

# 从URL读取GeoJSON数据
data <- geojson_read("https://geo.datav.aliyun.com/areas_v3/bound/340100_full.json", what = "sp")

# 转换为sf对象
data_sf <- st_as_sf(data)

# 使用ggplot2绘制地图
ggplot() +
  geom_sf(data = data_sf)
