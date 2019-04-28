USE [EDB_2]
GO

/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/28/2019 15:30:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OrderDetail](
	[订单编号] [varchar](20) NULL,
	[外部平台单号] [varchar](1000) NOT NULL,
	[店铺名称] [varchar](50) NULL,
	[订单类型] [varchar](50) NOT NULL,
	[处理状态] [varchar](20) NOT NULL,
	[付款状态] [varchar](20) NOT NULL,
	[发货状态] [varchar](20) NOT NULL,
	[电话] [varchar](61) NULL,
	[手机] [varchar](52) NULL,
	[平台发货状态] [varchar](10) NOT NULL,
	[物流公司] [varchar](200) NULL,
	[快递公司名称] [varchar](50) NULL,
	[快递单号] [varchar](50) NOT NULL,
	[产品总金额] [money] NULL,
	[订单总金额] [money] NULL,
	[实收金额] [money] NULL,
	[实收快递费] [money] NULL,
	[实付快递费] [money] NOT NULL,
	[快递代收金额] [money] NULL,
	[订单净重] [numeric](20, 3) NULL,
	[订单毛重] [numeric](9, 3) NOT NULL,
	[付款日期] [char](19) NOT NULL,
	[审单日期] [char](19) NOT NULL,
	[打印日期] [char](19) NOT NULL,
	[验货日期] [char](19) NOT NULL,
	[发货日期] [char](19) NOT NULL,
	[买家ID] [varchar](50) NULL,
	[收货人] [varchar](100) NULL,
	[收货地址] [varchar](1000) NULL,
	[收货省] [varchar](100) NULL,
	[收货市] [varchar](100) NULL,
	[收货县] [varchar](100) NULL,
	[产品编号] [varchar](50) NULL,
	[条形码] [varchar](255) NULL,
	[产品名称] [varchar](1000) NULL,
	[规格] [varchar](255) NULL,
	[网店品名] [varchar](261) NOT NULL,
	[网店规格] [varchar](100) NULL,
	[订货数量] [int] NULL,
	[赠品数量] [int] NOT NULL,
	[产品报价] [money] NULL,
	[产品报价总金额] [money] NULL,
	[产品打折金额] [money] NULL,
	[产品抵扣分摊金额] [money] NULL,
	[产品成交金额] [money] NULL,
	[产品成交单价] [money] NULL,
	[产品重量小计] [numeric](20, 3) NULL,
	[产品缺货状态] [varchar](20) NOT NULL,
	[产品退货到货数量] [int] NOT NULL,
	[签收时间] [char](19) NOT NULL,
	[省区域代码] [varchar](50) NULL,
	[市区域代码] [varchar](50) NULL,
	[区县区域代码] [varchar](50) NULL,
	[旗帜颜色] [varchar](20) NULL,
	[打折金额] [varchar](50) NULL,
	[安装服务商] [varchar](100) NULL,
	[保价] [bit] NULL,
	[订单促销信息] [varchar](200) NULL,
	[买家留言] [varchar](max) NULL,
	[发票抬头] [varchar](255) NULL,
	[客服备注] [varchar](max) NULL,
	[子订单编号] [varchar](1000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


