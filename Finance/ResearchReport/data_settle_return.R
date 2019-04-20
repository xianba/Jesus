####################################################
# Version: v1.0.0.0
# Date: 2019.04.20
# Author: Xia Xianba
# Contact: 778757080@qq.com
# File: data_settle_return.R
# Describe:
#    1.基于结算价计算的每日涨跌幅
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

# 通过动态方式获取交易品种列表
# w_wset_data <- w.wset("sectorconstituent","date=2019-04-20;sectorid=1000010084000000")
# COMMODITY_VARIETY <- w_wset_data[[2]]$wind_code
COMMODITY_VARIETY <- c('A.DCE','AG.SHF','AL.SHF','AP.CZC','AU.SHF','B.DCE','BB.DCE','BU.SHF',
                       'C.DCE','CF.CZC','CS.DCE','CU.SHF','CY.CZC','EG.DCE','FB.DCE','FG.CZC',
                       'FU.SHF','HC.SHF','I.DCE','J.DCE','JD.DCE','JM.DCE','JR.CZC','L.DCE',
                       'LR.CZC','M.DCE','MA.CZC','NI.SHF','OI.CZC','P.DCE','PB.SHF','PM.CZC',
                       'PP.DCE','RB.SHF','RI.CZC','RM.CZC','RS.CZC','RU.SHF','SC.INE','SF.CZC',
                       'SM.CZC','SN.SHF','SP.SHF','SR.CZC','TA.CZC','V.DCE','WH.CZC','WR.SHF',
                       'Y.DCE','ZC.CZC','ZN.SHF')


# 3.1.代码逻辑:根据结算价获取每日涨跌幅（今天结算价-昨天结算价）/昨天结算价
####################################################
w.start()

w_tdays_data<-w.tdays(BEGIN_DATE,END_DATE)

nrows <- length(w_tdays_data[[2]]$DATETIME)
ncols <- length(COMMODITY_VARIETY)+1

matrix_settle_return <- matrix(NA,nrow=nrows,ncol=ncols)
matrix_settle_return[,1] <- year(w_tdays_data[[2]]$DATETIME)*10000+month(w_tdays_data[[2]]$DATETIME)*100+day(w_tdays_data[[2]]$DATETIME)
# matrix_settle_return[1,2:ncols] <- COMMODITY_VARIETY

w_wsd_data_settle <- w.wsd(COMMODITY_VARIETY, "pct_chg_settlement", BEGIN_DATE, END_DATE, "")

if(w_wsd_data_settle$ErrorCode == 0)
{
  tmp_matrix <- matrix(NA,nrow=nrows,ncol=ncols)
  tmp_matrix <- as.matrix(w_wsd_data_settle[[2]])
  tmp <- tmp_matrix[,-1]
  tmp <- apply(tmp,2,as.numeric)
  
  matrix_settle_return[,2:ncols] <- tmp
}

# 3.2.代码逻辑:获取交易品种的成交量
####################################################
matrix_volume <- matrix(NA,nrow=nrows,ncol=ncols)
matrix_volume[,1] <- year(w_tdays_data[[2]]$DATETIME)*10000+month(w_tdays_data[[2]]$DATETIME)*100+day(w_tdays_data[[2]]$DATETIME)

w_wsd_data_volume <- w.wsd(COMMODITY_VARIETY, "volume", BEGIN_DATE, END_DATE, "")

if(w_wsd_data_volume$ErrorCode == 0)
{
  tmp_matrix <- matrix(NA,nrow=nrows,ncol=ncols)
  tmp_matrix <- as.matrix(w_wsd_data_volume[[2]])
  tmp <- tmp_matrix[,-1]
  tmp <- apply(tmp,2,as.numeric)
  
  matrix_volume[,2:ncols] <- tmp
}

# 4.获得最终结果，导出数据
####################################################
# write.table(matrix_settle_return,'matrix_settle_return_title.csv',sep = ",",col.names = append(COMMODITY_VARIETY,'DATE',0),row.names = F)
write.table(matrix_settle_return,'matrix_settle_return.csv',sep = ",",col.names = F,row.names = F)

# write.table(matrix_volume,'matrix_volume_title.csv',sep = ",",col.names = append(COMMODITY_VARIETY,'DATE',0),row.names = F)
write.table(matrix_volume,'matrix_volume.csv',sep = ",",col.names = F,row.names = F)
