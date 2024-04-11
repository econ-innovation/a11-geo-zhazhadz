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

dv_zone1 <- read_sf(dsn = "G342020合肥高新技术产业开发区区块二.txt")
dv_zone2 <- read_sf(dsn = "G342020合肥高新技术产业开发区区块一.txt")
dv_zone1_sf <- st_as_sf(dv_zone1)
dv_zone2_sf <- st_as_sf(dv_zone2)

df <- read.table("hefei.txt", header = TRUE, sep = "\t")
points <- st_as_sf(df, coords = c("lng", "lat"), crs = 4326)
# 使用ggplot2绘制地图
ggplot() +
  geom_sf(data = data_sf)+  geom_sf(data = points, color = "blue",alpha = 0.5)
  geom_sf(data = dv_zone1_sf, fill = "red", alpha = 0.5) +
  geom_sf(data = dv_zone2_sf, fill = "red", alpha = 0.5)
 
