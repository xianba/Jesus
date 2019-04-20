####################################################
# Version: v1.0.0.0
# Date: 2019.04.20
# Author: Xia Xianba
# Contact: 778757080@qq.com
# File: research_momentum.R
# Describe:
#    1.研究动量与收益率之间的相关性
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

# 3.1.代码逻辑:通过IC指标研究动量与收益率之间的关系
####################################################
w.start()

matrix_settle_return <-as.matrix( read.csv("./matrix_settle_return.csv",header = FALSE))
matrix_settle_return[,2:ncol(matrix_settle_return)] <- matrix_settle_return[,2:ncol(matrix_settle_return)]/100 + 1

COUNT_ROW <- nrow(matrix_settle_return)
COUNT_COL <- ncol(matrix_settle_return)

matrix_momentum <- matrix(NA,nrow=COUNT_ROW,ncol=COUNT_COL)
matrix_momentum[,1] <- matrix_settle_return[,1]

matrix_profit <- matrix(NA,nrow=COUNT_ROW,ncol=COUNT_COL)
matrix_profit[,1] <- matrix_settle_return[,1]

for(i in SEQ_PERIOD:(COUNT_ROW-HOLD_PERIOD))
{
  for(j in 2:COUNT_COL)
  {
    tmp_mom <- cumprod(matrix_settle_return[(i-4):i,j])
    matrix_momentum[i,j] <- tmp_mom[length(tmp_mom)]
    matrix_momentum[i,j] <- matrix_momentum[i,j] -1
    
    tmp_pro <- cumprod(matrix_settle_return[i:(i+2),j])
    matrix_profit[i,j] <- tmp_pro[length(tmp_pro)]
    matrix_profit[i,j] <- matrix_profit[i,j] -1
  }
}

matrix_cor <- matrix(NA,nrow=2,ncol=COUNT_COL)

for(k in 2:COUNT_COL)
{
  matrix_cor[1,k] <- cor(matrix_momentum[,k],matrix_profit[,k],use="pairwise.complete.obs",method="spearman")
  matrix_cor[2,k] <- cor(matrix_momentum[,k],matrix_profit[,k],use="complete.obs")
}


