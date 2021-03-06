USE [SMSLib]
GO
/****** Object:  Table [dbo].[smsserver_calls]    Script Date: 03/07/2009 12:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsserver_calls](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[call_date] [datetime] NOT NULL,
	[gateway_id] [nvarchar](64) NOT NULL,
	[caller_id] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_smssvr_calls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[smsserver_in]    Script Date: 03/07/2009 12:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smsserver_in](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[process] [int] NOT NULL,
	[originator] [nvarchar](16) NOT NULL,
	[type] [char](1) NOT NULL,
	[encoding] [char](1) NOT NULL,
	[message_date] [datetime] NOT NULL,
	[receive_date] [datetime] NOT NULL,
	[text] [nvarchar](1000) NOT NULL,
	[original_ref_no] [nvarchar](64) NULL,
	[original_receive_date] [datetime] NULL,
	[gateway_id] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_smssvr_in] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[smsserver_out]    Script Date: 03/22/2009 22:34:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smsserver_out](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [char](1) NOT NULL CONSTRAINT [DF_smsserver_out_type]  DEFAULT ('O'),
	[recipient] [nvarchar](16) NOT NULL,
	[text] [nvarchar](1000) NOT NULL,
	[wap_url] [nvarchar](100) NULL,
	[wap_expiry_date] [datetime] NULL,
	[wap_signal] [char](1) NULL,
	[create_date] [datetime] NOT NULL CONSTRAINT [DF_smssvr_out_create_date]  DEFAULT (getdate()),
	[originator] [nvarchar](16) NOT NULL CONSTRAINT [DF_smssvr_out_from]  DEFAULT (''),
	[encoding] [char](1) NOT NULL CONSTRAINT [DF_smssvr_out_encoding]  DEFAULT ('7'),
	[status_report] [int] NOT NULL CONSTRAINT [DF_smssvr_out_status_report]  DEFAULT ((0)),
	[flash_sms] [int] NOT NULL CONSTRAINT [DF_smssvr_out_flash_sms]  DEFAULT ((0)),
	[src_port] [int] NOT NULL CONSTRAINT [DF_smssvr_out_src_port]  DEFAULT ((-1)),
	[dst_port] [int] NOT NULL CONSTRAINT [DF_smssvr_out_dst_port]  DEFAULT ((-1)),
	[sent_date] [datetime] NULL CONSTRAINT [DF_smssvr_out_dispatch_date]  DEFAULT (NULL),
	[ref_no] [nvarchar](64) NULL CONSTRAINT [DF_smssvr_out_ref_no]  DEFAULT (NULL),
	[priority] [int] NOT NULL CONSTRAINT [DF_smssvr_out_priority]  DEFAULT ((0)),
	[status] [char](1) NOT NULL CONSTRAINT [DF_smssvr_out_status]  DEFAULT ('U'),
	[errors] [int] NOT NULL CONSTRAINT [DF_smssvr_out_errors]  DEFAULT ((0)),
	[gateway_id] [nvarchar](64) NOT NULL CONSTRAINT [DF_smssvr_out_gateway_id]  DEFAULT ('*'),
 CONSTRAINT [PK_smssvr_out] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF