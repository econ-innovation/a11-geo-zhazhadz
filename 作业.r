library(geojsonsf)
library(rjson)
library(rlist)
library(dplyr)
library(stringr)
library(sf)
library(tmap)
library(readr)
library(maps)
library(readr)
setwd("E:/数据分析/data/assigment_geo")
dv_zone1 <- read_sf(dsn = "G342020合肥高新技术产业开发区区块二.txt")
dv_zone2 <- read_sf(dsn = "G342020合肥高新技术产业开发区区块一.txt")
dv_zone1_sf <- st_as_sf(dv_zone1)
dv_zone2_sf <- st_as_sf(dv_zone2)


df <- read.table("hefei.txt", header = TRUE, sep = "\t")





# 将数据框转换为sf对象
points <- st_as_sf(df, coords = c("lng", "lat"), crs = 4326)


library(sf)
library(purrr)

# 创建一个列表
zones <- list(dv_zone1, dv_zone2)

distances1 <- map(zones, ~st_distance(points, dv_zone1))

print(lapply(distances, head, 5))
distances2 <- map(zones, ~st_distance(points, dv_zone2))

# 计算distances1为0的元素的个数
zero_counts1<- lapply(distances1, function(x) sum(x == set_units(0, units(x))))

# 打印结果
print(zero_counts1)

# 计算distances1为0的元素的个数
zero_counts2<- lapply(distances1, function(x) sum(x == set_units(0, units(x))))

# 打印结果
print(zero_counts2)
