USE [master]
GO
/****** Object:  Database [simisoftdb]    Script Date: 17/05/2021 0:28:11 ******/
CREATE DATABASE [simisoftdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'simisoftdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\simisoftdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'simisoftdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\simisoftdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [simisoftdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [simisoftdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [simisoftdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [simisoftdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [simisoftdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [simisoftdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [simisoftdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [simisoftdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [simisoftdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [simisoftdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [simisoftdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [simisoftdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [simisoftdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [simisoftdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [simisoftdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [simisoftdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [simisoftdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [simisoftdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [simisoftdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [simisoftdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [simisoftdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [simisoftdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [simisoftdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [simisoftdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [simisoftdb] SET RECOVERY FULL 
GO
ALTER DATABASE [simisoftdb] SET  MULTI_USER 
GO
ALTER DATABASE [simisoftdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [simisoftdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [simisoftdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [simisoftdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [simisoftdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [simisoftdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'simisoftdb', N'ON'
GO
ALTER DATABASE [simisoftdb] SET QUERY_STORE = OFF
GO
USE [simisoftdb]
GO
/****** Object:  User [mariovq]    Script Date: 17/05/2021 0:28:11 ******/
CREATE USER [mariovq] FOR LOGIN [mariovq] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [mariovq]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 17/05/2021 0:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoria] [nvarchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [nvarchar](50) NOT NULL,
	[idContacto] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[descuento] [decimal](7, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[costo] [decimal](7, 2) NOT NULL,
	[estado] [char](1) NOT NULL,
	[importeTotal] [decimal](7, 2) NOT NULL,
	[importeNeto] [decimal](7, 2) NOT NULL,
	[cantidad] [smallint] NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[idContacto] [int] IDENTITY(1,1) NOT NULL,
	[entidad] [nvarchar](50) NOT NULL,
	[comuna] [nvarchar](50) NOT NULL,
	[calle] [nvarchar](50) NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[telefono] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED 
(
	[idContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleCompras]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleCompras](
	[idDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[idCompra] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[costo] [decimal](7, 2) NOT NULL,
	[descuento] [decimal](7, 2) NOT NULL,
	[importeTotal] [decimal](7, 2) NOT NULL,
	[importeNeto] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_detalleCompras] PRIMARY KEY CLUSTERED 
(
	[idDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleMovimientos]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleMovimientos](
	[idDetalleMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
 CONSTRAINT [PK_detalleMovimientos] PRIMARY KEY CLUSTERED 
(
	[idDetalleMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleVentas]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleVentas](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[precio] [decimal](7, 2) NOT NULL,
	[descuento] [decimal](7, 2) NOT NULL,
	[importeTotal] [decimal](7, 2) NOT NULL,
	[importeNeto] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_detalleVentas] PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[idInventario] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[existencia] [smallint] NOT NULL,
 CONSTRAINT [PK_Inventarios] PRIMARY KEY CLUSTERED 
(
	[idInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[idMunicipio] [int] NOT NULL,
	[nombreLocalidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[tipoMovimiento] [nvarchar](25) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[idEstado] [int] NOT NULL,
	[nombreMunicipio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProducto] [nvarchar](50) NOT NULL,
	[caducidad] [date] NOT NULL,
	[precio] [decimal](7, 2) NOT NULL,
	[descuento] [decimal](7, 2) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productosProveedores]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productosProveedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
 CONSTRAINT [PK_productosProveedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombreProveedor] [nvarchar](50) NOT NULL,
	[idContacto] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[nombreSucursal] [nvarchar](50) NOT NULL,
	[idContacto] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuarios] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[tipoUsuario] [nvarchar](50) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idContacto] [int] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 17/05/2021 0:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [char](1) NOT NULL,
	[precio] [decimal](7, 2) NOT NULL,
	[descuento] [decimal](7, 2) NOT NULL,
	[importeTotal] [decimal](7, 2) NOT NULL,
	[importeNeto] [decimal](7, 2) NOT NULL,
	[cantidad] [smallint] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [simisoftdb] SET  READ_WRITE 
GO
