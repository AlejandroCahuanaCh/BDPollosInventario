USE [master]
GO
/****** Object:  Database [Inventarios]    Script Date: 3/04/2024 10:19:45 ******/
CREATE DATABASE [Inventarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inventarios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inventarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inventarios.ldf' , SIZE = 66560KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Inventarios] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventarios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventarios] SET RECOVERY FULL 
GO
ALTER DATABASE [Inventarios] SET  MULTI_USER 
GO
ALTER DATABASE [Inventarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventarios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inventarios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inventarios] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Inventarios] SET QUERY_STORE = OFF
GO
USE [Inventarios]
GO
/****** Object:  Table [dbo].[almacen]    Script Date: 3/04/2024 10:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen](
	[idalmacen] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_almacen] PRIMARY KEY CLUSTERED 
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comprobante]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comprobante](
	[idcomprobante] [int] NOT NULL,
	[idserie] [int] NOT NULL,
	[numero_comprobante] [int] NOT NULL,
	[identidad_emisor] [int] NOT NULL,
	[identidad_receptor] [int] NOT NULL,
	[fecha_emision] [datetime] NOT NULL,
	[fecha_vencimiento] [datetime] NOT NULL,
	[idcondicionpago] [int] NOT NULL,
	[idformapago] [int] NOT NULL,
	[tipoaplicacion] [smallint] NOT NULL,
	[observaciones] [varchar](500) NULL,
 CONSTRAINT [PK_comprobante] PRIMARY KEY CLUSTERED 
(
	[idcomprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[condicion_pago]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[condicion_pago](
	[idcondicionpago] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_condicion_pago] PRIMARY KEY CLUSTERED 
(
	[idcondicionpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_comprobante]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_comprobante](
	[iddetallecomprobante] [int] IDENTITY(1,1) NOT NULL,
	[idcomprobante] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[cantidad] [decimal](12, 5) NOT NULL,
	[peso] [decimal](12, 5) NOT NULL,
	[valor_unitario] [decimal](12, 5) NOT NULL,
	[valor_total] [decimal](12, 5) NOT NULL,
	[precio_unitario] [decimal](12, 5) NOT NULL,
	[precio_total] [decimal](12, 5) NOT NULL,
	[descuento] [decimal](12, 5) NOT NULL,
	[total] [decimal](12, 5) NOT NULL,
	[idalmacen] [int] NOT NULL,
	[igv] [decimal](12, 5) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_detalle_comprobante_1] PRIMARY KEY CLUSTERED 
(
	[iddetallecomprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_movimiento]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_movimiento](
	[iddetallemovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idmovimiento] [int] NOT NULL,
	[iddetallecomprobante] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[idproductoalmacen] [int] NOT NULL,
	[cantidad] [decimal](12, 5) NOT NULL,
	[peso] [decimal](12, 5) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_detalle_movimiento] PRIMARY KEY CLUSTERED 
(
	[iddetallemovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entidad]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidad](
	[identidad] [int] IDENTITY(1,1) NOT NULL,
	[idtipodocumento] [int] NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[razon_social] [varchar](200) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido_paterno] [varchar](50) NOT NULL,
	[apellido_materno] [varchar](50) NOT NULL,
	[direccion] [varchar](500) NULL,
	[tipo] [int] NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_entidad] PRIMARY KEY CLUSTERED 
(
	[identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entidad_comprobante]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidad_comprobante](
	[identidadcompronte] [int] IDENTITY(1,1) NOT NULL,
	[idcomprobante] [int] NOT NULL,
	[idtipoentidad] [int] NOT NULL,
	[identidad] [int] NOT NULL,
	[razon_social] [varchar](200) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_entidad_comprobante] PRIMARY KEY CLUSTERED 
(
	[identidadcompronte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forma_pago]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_pago](
	[idformapago] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_forma_pago] PRIMARY KEY CLUSTERED 
(
	[idformapago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimiento]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento](
	[idmovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idcomprobante] [int] NOT NULL,
	[idtipo_movimiento] [int] NOT NULL,
	[idalmacenorigen] [int] NOT NULL,
	[idalmacendestino] [int] NULL,
	[fecha_movimiento] [datetime] NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_movimiento] PRIMARY KEY CLUSTERED 
(
	[idmovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](20) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[unidad] [varchar](200) NOT NULL,
	[precio] [decimal](12, 5) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_almacen]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_almacen](
	[idproductoalmacen] [int] IDENTITY(1,1) NOT NULL,
	[idproducto] [int] NOT NULL,
	[idalmacen] [int] NOT NULL,
	[cantidad] [decimal](12, 5) NOT NULL,
	[peso] [decimal](12, 5) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_producto_almacen] PRIMARY KEY CLUSTERED 
(
	[idproductoalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_precio]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_precio](
	[idproductoprecio] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[idtipo_precio] [int] NOT NULL,
	[tipo_descuento] [tinyint] NOT NULL,
	[valor] [decimal](12, 5) NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_producto_precio] PRIMARY KEY CLUSTERED 
(
	[idproductoprecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serie]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serie](
	[idserie] [int] IDENTITY(1,1) NOT NULL,
	[identidad] [int] NOT NULL,
	[descripcion] [varchar](4) NOT NULL,
	[idtipo_comprobante] [int] NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_serie] PRIMARY KEY CLUSTERED 
(
	[idserie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_comprobante]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_comprobante](
	[idtipocomprobante] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tipo_comprobante] PRIMARY KEY CLUSTERED 
(
	[idtipocomprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_documento](
	[idtipodocumento] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tipo_documento] PRIMARY KEY CLUSTERED 
(
	[idtipodocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_movimiento]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_movimiento](
	[idtipomovimiento] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[tipo] [tinyint] NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tipo_movimiento] PRIMARY KEY CLUSTERED 
(
	[idtipomovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_precio]    Script Date: 3/04/2024 10:19:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_precio](
	[idtipoprecio] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[log_usuario_creacion] [varchar](50) NOT NULL,
	[log_usuario_modificacion] [varchar](50) NOT NULL,
	[log_fecha_creacion] [datetime] NOT NULL,
	[log_fecha_modificacion] [datetime] NOT NULL,
	[log_estado] [tinyint] NOT NULL,
 CONSTRAINT [PK_tipo_precio] PRIMARY KEY CLUSTERED 
(
	[idtipoprecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comprobante]  WITH CHECK ADD  CONSTRAINT [FK_comprobante_condicion_pago] FOREIGN KEY([idcondicionpago])
REFERENCES [dbo].[condicion_pago] ([idcondicionpago])
GO
ALTER TABLE [dbo].[comprobante] CHECK CONSTRAINT [FK_comprobante_condicion_pago]
GO
ALTER TABLE [dbo].[comprobante]  WITH CHECK ADD  CONSTRAINT [FK_comprobante_forma_pago] FOREIGN KEY([idformapago])
REFERENCES [dbo].[forma_pago] ([idformapago])
GO
ALTER TABLE [dbo].[comprobante] CHECK CONSTRAINT [FK_comprobante_forma_pago]
GO
ALTER TABLE [dbo].[comprobante]  WITH CHECK ADD  CONSTRAINT [FK_comprobante_serie] FOREIGN KEY([idserie])
REFERENCES [dbo].[serie] ([idserie])
GO
ALTER TABLE [dbo].[comprobante] CHECK CONSTRAINT [FK_comprobante_serie]
GO
ALTER TABLE [dbo].[detalle_comprobante]  WITH CHECK ADD  CONSTRAINT [FK_detalle_comprobante_almacen] FOREIGN KEY([idalmacen])
REFERENCES [dbo].[almacen] ([idalmacen])
GO
ALTER TABLE [dbo].[detalle_comprobante] CHECK CONSTRAINT [FK_detalle_comprobante_almacen]
GO
ALTER TABLE [dbo].[detalle_comprobante]  WITH CHECK ADD  CONSTRAINT [FK_detalle_comprobante_comprobante] FOREIGN KEY([idcomprobante])
REFERENCES [dbo].[comprobante] ([idcomprobante])
GO
ALTER TABLE [dbo].[detalle_comprobante] CHECK CONSTRAINT [FK_detalle_comprobante_comprobante]
GO
ALTER TABLE [dbo].[detalle_comprobante]  WITH CHECK ADD  CONSTRAINT [FK_detalle_comprobante_producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[detalle_comprobante] CHECK CONSTRAINT [FK_detalle_comprobante_producto]
GO
ALTER TABLE [dbo].[detalle_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_detalle_movimiento_detalle_comprobante] FOREIGN KEY([iddetallecomprobante])
REFERENCES [dbo].[detalle_comprobante] ([iddetallecomprobante])
GO
ALTER TABLE [dbo].[detalle_movimiento] CHECK CONSTRAINT [FK_detalle_movimiento_detalle_comprobante]
GO
ALTER TABLE [dbo].[detalle_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_detalle_movimiento_movimiento] FOREIGN KEY([idmovimiento])
REFERENCES [dbo].[movimiento] ([idmovimiento])
GO
ALTER TABLE [dbo].[detalle_movimiento] CHECK CONSTRAINT [FK_detalle_movimiento_movimiento]
GO
ALTER TABLE [dbo].[detalle_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_detalle_movimiento_producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[detalle_movimiento] CHECK CONSTRAINT [FK_detalle_movimiento_producto]
GO
ALTER TABLE [dbo].[detalle_movimiento]  WITH CHECK ADD  CONSTRAINT [FK_detalle_movimiento_producto_almacen] FOREIGN KEY([idproductoalmacen])
REFERENCES [dbo].[producto_almacen] ([idproductoalmacen])
GO
ALTER TABLE [dbo].[detalle_movimiento] CHECK CONSTRAINT [FK_detalle_movimiento_producto_almacen]
GO
ALTER TABLE [dbo].[entidad]  WITH CHECK ADD  CONSTRAINT [FK_entidad_tipo_documento] FOREIGN KEY([idtipodocumento])
REFERENCES [dbo].[tipo_documento] ([idtipodocumento])
GO
ALTER TABLE [dbo].[entidad] CHECK CONSTRAINT [FK_entidad_tipo_documento]
GO
ALTER TABLE [dbo].[entidad_comprobante]  WITH CHECK ADD  CONSTRAINT [FK_entidad_comprobante_comprobante] FOREIGN KEY([idcomprobante])
REFERENCES [dbo].[comprobante] ([idcomprobante])
GO
ALTER TABLE [dbo].[entidad_comprobante] CHECK CONSTRAINT [FK_entidad_comprobante_comprobante]
GO
ALTER TABLE [dbo].[entidad_comprobante]  WITH CHECK ADD  CONSTRAINT [FK_entidad_comprobante_entidad] FOREIGN KEY([identidad])
REFERENCES [dbo].[entidad] ([identidad])
GO
ALTER TABLE [dbo].[entidad_comprobante] CHECK CONSTRAINT [FK_entidad_comprobante_entidad]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen] FOREIGN KEY([idalmacenorigen])
REFERENCES [dbo].[almacen] ([idalmacen])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_almacen]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen1] FOREIGN KEY([idalmacendestino])
REFERENCES [dbo].[almacen] ([idalmacen])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_almacen1]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_comprobante] FOREIGN KEY([idcomprobante])
REFERENCES [dbo].[comprobante] ([idcomprobante])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_comprobante]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_tipo_movimiento] FOREIGN KEY([idtipo_movimiento])
REFERENCES [dbo].[tipo_movimiento] ([idtipomovimiento])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_tipo_movimiento]
GO
ALTER TABLE [dbo].[producto_almacen]  WITH CHECK ADD  CONSTRAINT [FK_producto_almacen_almacen] FOREIGN KEY([idalmacen])
REFERENCES [dbo].[almacen] ([idalmacen])
GO
ALTER TABLE [dbo].[producto_almacen] CHECK CONSTRAINT [FK_producto_almacen_almacen]
GO
ALTER TABLE [dbo].[producto_almacen]  WITH CHECK ADD  CONSTRAINT [FK_producto_almacen_producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[producto_almacen] CHECK CONSTRAINT [FK_producto_almacen_producto]
GO
ALTER TABLE [dbo].[producto_precio]  WITH CHECK ADD  CONSTRAINT [FK_producto_precio_producto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[producto_precio] CHECK CONSTRAINT [FK_producto_precio_producto]
GO
ALTER TABLE [dbo].[producto_precio]  WITH CHECK ADD  CONSTRAINT [FK_producto_precio_tipo_precio] FOREIGN KEY([idtipo_precio])
REFERENCES [dbo].[tipo_precio] ([idtipoprecio])
GO
ALTER TABLE [dbo].[producto_precio] CHECK CONSTRAINT [FK_producto_precio_tipo_precio]
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD  CONSTRAINT [FK_serie_entidad] FOREIGN KEY([identidad])
REFERENCES [dbo].[entidad] ([identidad])
GO
ALTER TABLE [dbo].[serie] CHECK CONSTRAINT [FK_serie_entidad]
GO
ALTER TABLE [dbo].[serie]  WITH CHECK ADD  CONSTRAINT [FK_serie_tipo_comprobante] FOREIGN KEY([idtipo_comprobante])
REFERENCES [dbo].[tipo_comprobante] ([idtipocomprobante])
GO
ALTER TABLE [dbo].[serie] CHECK CONSTRAINT [FK_serie_tipo_comprobante]
GO
USE [master]
GO
ALTER DATABASE [Inventarios] SET  READ_WRITE 
GO
