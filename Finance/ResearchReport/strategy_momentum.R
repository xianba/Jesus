####################################################
# Version: v1.0.0.0
# Date: 2019.04.20
# Author: Xia Xianba
# Contact: 778757080@qq.com
# File: strategy_momentum.R
# Describe:
#    1.研究动量与收益率之间的关系
####################################################

# 1.环境准备
####################################################
setwd("D:/git/Zeus/3 Code/1.3 RProject/momentum")
library(WindR)    # 加载依赖包
rm(list=ls())    # 清空历史变量

# 2.设置常用变量
####################################################
BEGIN_DATE <- '2008-12-31'
END_DATE <- Sys.Date()
SEQ_PERIOD <- 5
HOLD_PERIOD <- 5
MIN_VOLUME <-100000

# 3.代码逻辑:回测交易系统
####################################################
w.start()

matrix_settle_return <-as.matrix( read.csv("./matrix_settle_return.csv",header = FALSE))
matrix_settle_return[,2:ncol(matrix_settle_return)] <- matrix_settle_return[,2:ncol(matrix_settle_return)]/100 + 1

matrix_volume <-as.matrix( read.csv("./matrix_volume.csv",header = FALSE))
matrix_volume[,2:ncol(matrix_volume)] <- matrix_volume[,2:ncol(matrix_volume)]

COUNT_ROW <- nrow(matrix_settle_return)
COUNT_COL <- ncol(matrix_settle_return)

matrix_layer <- matrix(NA,nrow = COUNT_ROW, ncol = 3)    # 分层收益统计

for(i in seq(SEQ_PERIOD,COUNT_ROW-HOLD_PERIOD, HOLD_PERIOD))
{
  tmp_vol_matrix<-matrix(NA,nrow =COUNT_COL-1,ncol = 2)
  tmp_mom_matrix<-matrix(NA,nrow =COUNT_COL-1,ncol = 2)
  
  #==========================过滤交易量==============================#
  tmp_vol_matrix[,1]<-1:(COUNT_COL-1)
  tmp_vol_matrix[,2]<-colMeans(matrix_volume[(i-SEQ_PERIOD+1):i,2:COUNT_COL])
  index_volume<-which(tmp_vol_matrix[,2]>MIN_VOLUME)  
  
  #==========================根据动量进行分层测试==============================#
  tmp_mom <- apply(matrix_settle_return[(i-4):i,2:COUNT_COL],2,cumprod)
  tmp_mom_matrix[,1] <- 1:(COUNT_COL-1)
  tmp_mom_matrix[,2] <- tmp_mom[SEQ_PERIOD,]
  index_mom <- which(is.na(tmp_mom_matrix[,2])!=1)
  
  index_valid <- intersect(index_volume,index_mom)
  
  tmp_mom_sort<-matrix(NA,nrow =length(index_valid),ncol = 2)
  tmp_mom_sort[,1]<-index_valid
  tmp_mom_sort[,2]<-tmp_mom_matrix[index_valid,2]
  
  tmp_mom_sort<-tmp_mom_sort[order(tmp_mom_sort[,2],decreasing=T),]
  
  len_index_valid <- length(index_valid)
  head_index_valid <- tmp_mom_sort[1:floor(len_index_valid/3),1]
  mid_index_valid <- tmp_mom_sort[(floor(len_index_valid/3)+1):floor(2*len_index_valid/3),1]
  tail_index_valid <- tmp_mom_sort[(floor(2*len_index_valid/3)+1):len_index_valid,1]
  
  matrix_layer[((i+1):(i+HOLD_PERIOD)),1] <- rowMeans(diff(rbind(1,apply(matrix_settle_return[((i+1):(i+HOLD_PERIOD)),head_index_valid+1],2,cumprod))))
  matrix_layer[((i+1):(i+HOLD_PERIOD)),2] <- rowMeans(diff(rbind(1,apply(matrix_settle_return[((i+1):(i+HOLD_PERIOD)),mid_index_valid+1],2,cumprod))))
  matrix_layer[((i+1):(i+HOLD_PERIOD)),3] <- rowMeans(diff(rbind(1,apply(matrix_settle_return[((i+1):(i+HOLD_PERIOD)),tail_index_valid+1],2,cumprod))))
}

# 4.评价:计算相应的评价指标
####################################################
h_tmp_cumsum <- cumsum(matrix_layer[,1])
h_tmp_cumsum <- h_tmp_cumsum[length(tmp_cumsum)]+1
h_year_rate <- h_tmp_cumsum^(250/COUNT_ROW)-1

h_maxdown <- maxdrawdown(matrix_layer[,1])


# 5.画图:根据收益画出收益曲线
####################################################
matrix_layer[which(is.na(matrix_layer)==1,arr.ind = T)] <- 0

plot(cumsum(matrix_layer[1:nrow(matrix_layer),1]),type="l",ylim = c(-2.0,2.0),xaxt="n")
lines(cumsum(matrix_layer[1:nrow(matrix_layer),2]),type="l",col="red")
lines(cumsum(matrix_layer[1:nrow(matrix_layer),3]),type="l",col="blue")
axis(1,at=1:COUNT_ROW,labels=matrix_settle_return[(1:COUNT_ROW),1])
legend("topleft",legend=c("Head","Mid","Tail"),col=c("black","red","blue"),lty=1)






