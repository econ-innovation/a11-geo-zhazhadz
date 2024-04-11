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

# 将distances1转换为数据框
distances_f1 <- do.call(rbind, distances1)

# 计算为0的结果的个数
zero_counts1 <- sum(distances_f1 == 0)

distances2 <- map(zones, ~st_distance(points, dv_zone2))
# 将distances1转换为数据框
distances_f2 <- do.call(rbind, distances2)

# 计算为0的结果的个数
zero_counts2 <- sum(distances_f2 == 0)

# 打印结果
print(zero_counts1)
print(zero_counts2)
