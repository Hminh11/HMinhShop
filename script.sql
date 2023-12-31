USE [master]
GO
/****** Object:  Database [AssPRJ]    Script Date: 17/07/2023 13:38:27 ******/
CREATE DATABASE [AssPRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssPRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\AssPRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssPRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\AssPRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AssPRJ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssPRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssPRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssPRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssPRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssPRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssPRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssPRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssPRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssPRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssPRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssPRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssPRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssPRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssPRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssPRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssPRJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssPRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssPRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssPRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssPRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssPRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssPRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssPRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssPRJ] SET RECOVERY FULL 
GO
ALTER DATABASE [AssPRJ] SET  MULTI_USER 
GO
ALTER DATABASE [AssPRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssPRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssPRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssPRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssPRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssPRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssPRJ', N'ON'
GO
ALTER DATABASE [AssPRJ] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssPRJ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AssPRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17/07/2023 13:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[admin] [bit] NULL,
	[seller] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17/07/2023 13:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderdetail]    Script Date: 17/07/2023 13:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetail](
	[oid] [int] NULL,
	[pid] [int] NULL,
	[quanity] [float] NULL,
	[price] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderp]    Script Date: 17/07/2023 13:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderp](
	[id] [int] NOT NULL,
	[acc_id] [int] NULL,
	[date] [date] NULL,
	[totalmoney] [money] NULL,
	[addr] [varchar](100) NULL,
	[pay] [varchar](100) NULL,
	[number] [int] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/07/2023 13:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[price] [float] NULL,
	[image] [varchar](500) NULL,
	[category_id] [int] NULL,
	[seller_id] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [password], [email], [admin], [seller]) VALUES (1, N'zin2', N'zin123', N'minhvhhe170320@fpt.edu.vn', 1, 0)
INSERT [dbo].[Account] ([id], [name], [password], [email], [admin], [seller]) VALUES (2, N'zin', N'zin123', N'minhvhhe170320@fpt.edu.vn', 1, 1)
INSERT [dbo].[Account] ([id], [name], [password], [email], [admin], [seller]) VALUES (3, N'minh', N'zin123', N'minhvhhe170320@fpt.edu.vn', 0, 0)
INSERT [dbo].[Account] ([id], [name], [password], [email], [admin], [seller]) VALUES (4, N'minh1', N'zin123', N'minhvhhe170320@fpt.edu.vn', 0, 1)
INSERT [dbo].[Account] ([id], [name], [password], [email], [admin], [seller]) VALUES (5, N'minh2', N'zin123', N'minhvhhe170320@fpt.edu.vn', 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (1, N'Dior', N'Christian Dior là thương hiệu nước hoa đến từ Pháp, được sáng lập bởi nhà thiết kế Christian Dior vào năm 1946. 
Christian Dior là nhà mốt xa xỉ bậc nhất tại Pháp, lừng danh trên khắp thế giới với phong cách Haute 
Couture đậm tính kiến trúc và sự quyến rũ')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (2, N'Gucci', N'Gucci là thương hiệu nước hoa nổi tiếng toàn cầu, không khó hiểu khi Gucci được nhiều người yêu nước hoa Việt Nam ưa chuộng. 
Sản phẩm dầu thơm của hãng Gucci mang đến cảm giác sang trọng, ngọt ngào, tao nhã nhưng không kém phần quý tộc.')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (3, N'Calvin Klein ', N'Với hương thơm đặc biệt, cá tính bất cứ tín đồ nước hoa nào cũng phải mê mẩn trước sản phẩm của Calvin Klein. 
Đặc trưng nước hoa Calvin Klein là sự hiện đại, gợi cảm, quyến rũ. Nhiều người 
đánh giá hãng nước hoa này là dấu ấn thu hút khó quên, là thương hiệu ca ngợi vẻ đẹp say lòng với sức hấp dẫn đặc biệt.')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (4, N'Hermes', N'Nước hoa của Hermes được mệnh danh là hãng nước hoa tinh tế và hoàn hảo. Với gần 200 năm lịch sử, Hermes luôn là 
cái tên danh giá bậc nhất trong thị trường nước hoa thế giới. Tại Việt Nam, 
nước hoa Hermes được yêu thích bởi sự tinh tế trong chất lượng và từng mẫu thiết kế.')
INSERT [dbo].[Category] ([category_id], [name], [description]) VALUES (5, N'Chanel', N'Là tín đồ nước hoa thực thụ, chắc hẳn bạn không còn quá xa lạ với Chanel. Đây là một trong những hãng nước hoa nổi tiếng nhất thế giới được đông đảo khách hàng ưa chuộng. Có thể nói rằng, bất cứ ai thành đạt luôn sở hữu cho mình nước hoa Chanel. Đặc trưng của nước hoa Chanel là hương thơm không dừng lại ở mức dễ chịu, 
hấp dẫn, mà nó còn phản ánh được tính cách của người sử dụng. Đó cũng là lý do chính cho sự thịnh hành của nước hoa Chanel trong suốt thời gian qua.')
GO
INSERT [dbo].[Orderdetail] ([oid], [pid], [quanity], [price]) VALUES (149396, 4, 1, 2600000)
INSERT [dbo].[Orderdetail] ([oid], [pid], [quanity], [price]) VALUES (418305, 5, 1, 2199999)
INSERT [dbo].[Orderdetail] ([oid], [pid], [quanity], [price]) VALUES (702014, 10, 1, 1950000)
INSERT [dbo].[Orderdetail] ([oid], [pid], [quanity], [price]) VALUES (782837, 5, 1, 2199999)
INSERT [dbo].[Orderdetail] ([oid], [pid], [quanity], [price]) VALUES (993903, 2, 12, 35999988)
GO
INSERT [dbo].[Orderp] ([id], [acc_id], [date], [totalmoney], [addr], [pay], [number], [status]) VALUES (149396, 2, CAST(N'2023-07-13' AS Date), 2620000.0000, N'abcde', N'
                                               Paypal', 534423423, N'Cancelled')
INSERT [dbo].[Orderp] ([id], [acc_id], [date], [totalmoney], [addr], [pay], [number], [status]) VALUES (418305, 3, CAST(N'2023-07-13' AS Date), 2219999.0000, N'abcde', N'Bank Transfer', 353423, N'Confirmed')
INSERT [dbo].[Orderp] ([id], [acc_id], [date], [totalmoney], [addr], [pay], [number], [status]) VALUES (702014, 5, CAST(N'2023-07-13' AS Date), 1970000.0000, N'hihhii', N'
                                               Paypal', 423423, N'Cancelled')
INSERT [dbo].[Orderp] ([id], [acc_id], [date], [totalmoney], [addr], [pay], [number], [status]) VALUES (782837, 2, CAST(N'2023-07-13' AS Date), 2219999.0000, N'utyuty', N'
                                               Paypal', 85663523, N'Confirmed')
INSERT [dbo].[Orderp] ([id], [acc_id], [date], [totalmoney], [addr], [pay], [number], [status]) VALUES (993903, 5, CAST(N'2023-07-13' AS Date), 36019988.0000, N'hanoi', N'Bank Transfer', 342423423, N'Confirmed')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (1, N'Hermes Voyage', N'Hương nước hoa chủ yếu của chai Hermes Voyage chính 
	là hương chanh kết hợp cùng với hương hổ phách. Mùi hương này sẽ đem lại cho bạn cảm giác thoải mái, 
	dễ chịu, thoải mái. Mùi hương này có thể dùng được cho cả nam và nữ, dùng được cho mùa xuân hạ và cả ban ngày lẫn ban đêm nhé', 2300000, N'https://assets.hermes.com/is/image/hermesproduct/voyage-d-hermes-parfum--107569V0-worn-9-0-0-800-800_g.jpg', 4, 2, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (2, N'Hermes Jour D’hermes', N'Nước hoa Hermes Jour D’Hermes là sản phẩm được thiết kế dành riêng cho nữ. 
Sản phẩm mang đến cho mọi cô gái một vẻ gợi cảm, hạnh phúc và tươi tắn. Jour D’Hermes sở hữu thiết kế đơn giản với chai thủy tinh trong suốt có phần đế dày. Thân chai được in tên sản phẩm với màu vàng đồng sang trọng. 
Jour D’Hermes là sự kết hợp hài hòa của mùi hương hoa cỏ, mang đến sự nhẹ nhàng, thanh khiết. Tầng hương đầu đánh thức mọi giác quan với hương bưởi và chanh vàng. 
Kế tiếp là mùi hương ngọt ngào của hoa nhài, hoa hồng, lily, hoa sơn chi. Tầng hương cuối ấm áp với mùi xạ hương và gỗ.', 2999999, N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/nuoc-hoa-nu-hermes-jour-d-hermes-edp-85ml-620a1eaa5a378-14022022161938.jpg', 4, 2, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (3, N'Hermes Jour D’hermes', N'Nước hoa Hermes Jour D’Hermes là sản phẩm được thiết kế dành riêng cho nữ. 
Sản phẩm mang đến cho mọi cô gái một vẻ gợi cảm, hạnh phúc và tươi tắn. Jour D’Hermes sở hữu thiết kế đơn giản với chai thủy tinh trong suốt có phần đế dày. Thân chai được in tên sản phẩm với màu vàng đồng sang trọng. 
Jour D’Hermes là sự kết hợp hài hòa của mùi hương hoa cỏ, mang đến sự nhẹ nhàng, thanh khiết. Tầng hương đầu đánh thức mọi giác quan với hương bưởi và chanh vàng. 
Kế tiếp là mùi hương ngọt ngào của hoa nhài, hoa hồng, lily, hoa sơn chi. Tầng hương cuối ấm áp với mùi xạ hương và gỗ.', 2999999, N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/nuoc-hoa-nu-hermes-jour-d-hermes-edp-85ml-620a1eaa5a378-14022022161938.jpg', 4, 2, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (4, N'Dior Hypnotic Poison', N'Mùi hương tỏa ra mang sắc thái từ Vani ngọt ngào được sáng chế bởi Annick Menardo. Điểm nhấn nổi bật xuất phát từ hương hoa nhài, huệ và hồng. Mỗi lớp hương mang nét đẹp rù quến từ ngọt ngào đến khi lắng dần lại mang vẻ đẹp thanh thoát. Như mùi hương chính hãng thì Hypnotic Poison mang 3 tầng hương tuyệt vời', 2600000, N'https://orchard.vn/wp-content/uploads/2014/06/Dior-Hypnotic-Poison.jpg', 1, 4, 0)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (5, N'Hermes Elixir Des Merveilles Eau De Parfum', N'Hương nước hoa Hermes Elixir Des Merveilles Eau De Parfum mang đến sự thanh mát, nhẹ nhàng của cây dương xỉ. Nhà sáng chế đã phải cân đo cẩn thận những liều lượng để tạo ra một hương thơm mang phong cách riêng.
Mở đầu chính là hương vỏ cam hơi cay nhẹ. Tuy nhiên, sẽ được bù đắp bởi hương ngọt ngào, đầy màu sắc của hương giữa, 
Kết thúc mùi hương này chính là hương thơm nồng ấm, mặn mà rất sang trọng và quyến rũ.', 2199999, N'https://assets.hermes.com/is/image/hermesproduct/elixir-des-merveilles-eau-de-parfum--107253V0-worn-9-0-0-800-800_g.jpg', 4, 3, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (6, N'Dior Addict EDP', N'Dior Addict EDP đã ra mắt tiếp bản mới hơn với 
hương hoa cỏ phương Đông nồng nàn. Chai nước hoa được thiết kế nhỏ gọn với màu xanh huyền bị trông rất sang trọng cùng điểm nhấn chi tiết bằng bạc.
Đặc biệt, độ lưu hương của dòng Dior nay lên đến 12h cho bạn thoải mái và luôn tự tin.Mẫu nước hoa này mở đầu bằng hương thơm tươi 
tát của quý và hoa cam Tunisian. Hương giữa là sự mạnh mẽ của hoa nhài.
Hương cuối chính là chất vani nhẹ nhàng và gợi cảm như đêm hè ấm áp', 2991138, N'https://nuochoachietchinhhang.com/wp-content/uploads/2022/06/dior-addict-edp.jpg', 1, 2, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (7, N'Chanel Chance EDP', N'Nước hoa Chanel Chance EDP Mang nét mềm mại, tinh khiết như những giọt sương ban mai, Hương thơm của Chanel 
Chance EDP phảng phất hòa trong gió và len lỏi vào từng ký ức, tạo ra ánh sáng lung linh, 
huyền ảo. Tưởng chừng vô hình mà hữu hình khiến cho mọi xúc cảm tự thăng hoa.', 2199999, N'https://product.hstatic.net/1000025647/product/2_a267e71b7d9b49e68ed70db480b724cb_grande.jpg', 5, 3, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (8, N'Dior J"Adore', N'Lọ 50ml Tôn vinh nét đẹp nữ tính dịu dàng mang hơi hướng hiện đại, phù hợp với những cô gái có cá tính mạnh, luôn tự tin với khả năng mình
có được và sỡ hữu sự đam mê cháy bỏng muốn thể hiện cái tôi của bản thân nhưng vẫn còn thiếu chất xúc tác cần thiết.', 2450000, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/184/925/products/307460360-1962060210658976-8048919295630016694-n-b6607793-50e3-46f0-a035-9fc7ad34afe5.jpg?v=1664082573827', 1, 5, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (9, N'Calvin Klein One EDT – Unisex', N'Nước hoa CK One ra mắt lần đầu tiên vào năm 1994 và đặc biệt dùng được cho cả nam và nữ. 
Trong giai đoạn những năm 90s, sản phẩm trở thành tượng đài mới của giới trẻ. Bởi hương thơm tươi mát, nhẹ nhàng lan tỏa trên cơ thể, mang đến một cảm
giác thật gần gũi và thoải mái. Nước hoa CK One với nhóm hương cam chanh thảo mộc cho bạn trẻ tự tin để bắt đầu một ngày mới', 1350000, N'https://pos.nvncdn.net/d2ee7c-22042/ps/20200312_DEIGRZC4yohhC4B90ZeamlP1.jpg', 3, 4, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (10, N'Calvin Klein Defy', N'Calvin Klein Defy được nhà mốt đến từ Mỹ thiết kế mùi hương theo một hướng đi mới, 
đánh mạnh vào sự nam tính, hiện đại và mạnh mẽ. Một hương thơm hiện đại không cần phải quá phức tạp, mà thay vào đó cần tối 
giản, mà vẫn nổi bật lên được cá tính cho người mặc. Và Defy được thiết kế như thế, chỉ với Hoa Oải hương thư thái quen thuộc tô điểm cho nét nam tính, phủ lên cái tươi thanh của 
Cam Bergamot và hòa hợp đồng điệu với những rung động ấm áp của Gỗ từ Cỏ hương bài và Nhựa hổ phách', 1950000, N'https://product.hstatic.net/1000340570/product/calvin-klein-defy-30ml_4fe7606a4878471d82ba12b0ee241847_master.jpg', 3, 4, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (11, N'Hermes Twilly d’Hermès Eau De Parfum', N'Được lấy cảm hứng từ chiếc khăn lụa mềm mại nhiều màu sắc, đây cũng chính là biểu tượng của những cô gái tại phương Tây. 
Mùi hương của chai nước hoa này sẽ tạo cho ta sự bất ngờ khi sử dụng Gừng. 
Hoa huệ và hoa cam cũng không thể đánh bại được mùi hương này.', 2300000, N'https://product.hstatic.net/1000340570/product/hermes-twilly-d_hermes-eau-de-parfum-85ml_69a22ce1a7cd4fb18d8e4fec4b40ec67_master.jpg', 4, 5, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (12, N'Gucci Bloom EDP', N'Những nốt hương đầu tiên mình cảm nhận được là vị tươi xanh của lá và mùi của hoa huệ, 
hoa nhài khá rõ rệt. Một lúc sau thì chỉ còn lại cảm giác dễ chịu, thư thái của các loài hoa trắng. 
Và đến cuối cùng, hương vani bật lên làm tổng thể trở nên ngọt ngào, quyến rũ hơn. Mùi hương của em nước hoa Gucci nữ 
này khiến mình nghĩ ngay đến những cô gái độ tuổi đôi mươi, năng động, 
nhiệt huyết và tràn đầy sức sống. Không chỉ vậy nó còn thể hiện đúng vibe trẻ trung như ở độ tuổi của cô gái đó vậy', 3000000, N'https://product.hstatic.net/1000340570/product/gucci-bloom-eau-de-parfum-for-her-100ml_391f58375b274745b6f087386a8e4197_master.jpg', 2, 2, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (13, N'Gucci Bamboo EDT', N'Với nốt hương chủ đạo của hoa ly casablanca, hoa cam và cam bergamot. 
Gucci Bamboo dẫn dắt ta từ sự ngọt, mát ban đầu cho đến sự tinh tế, nhã nhặn và cuối cùng dừng lại 
với nốt hương gỗ ấm áp. Một trải nghiệm khá là thú vị dành cho những cô gái “hay ho”. 
Không phải kiểu nước hoa nồng nàn, nóng bỏng đến mê hoặc. Gucci Bamboo là cô gái trẻ năng động, nhiệt huyết và vô cùng bản lĩnh', 2999999, N'https://yperfume.net/wp-content/uploads/2021/08/gucci-bamboo-eau-de-toilette_cafa77a5fd844c0d8af5909e89c506f3_master.jpg', 2, 3, 1)
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [image], [category_id], [seller_id], [status]) VALUES (14, N'Hermes Voyage', N'Hương nước hoa chủ yếu của chai Hermes Voyage chính 
là hương chanh kết hợp cùng với hương hổ phách. Mùi hương này sẽ đem lại cho bạn cảm giác thoải mái, 
dễ chịu, thoải mái. Mùi hương này có thể dùng được cho cả nam và nữ, dùng được cho mùa xuân hạ và cả ban ngày lẫn ban đêm nhé', 2300000, N'https://assets.hermes.com/is/image/hermesproduct/voyage-d-hermes-parfum--107569V0-worn-9-0-0-800-800_g.jpg', 4, 2, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__72E12F1BE37A1E49]    Script Date: 17/07/2023 13:38:27 ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD FOREIGN KEY([oid])
REFERENCES [dbo].[Orderp] ([id])
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Orderp]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([seller_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [AssPRJ] SET  READ_WRITE 
GO
