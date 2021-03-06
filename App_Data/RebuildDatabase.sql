USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'baxtech_clinic')
ALTER DATABASE [baxtech_clinic] SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
DROP DATABASE [baxtech_clinic]
GO

USE [master]
GO
/****** Object:  Database [baxtech_clinic]    Script Date: 02/05/2012 18:48:14 ******/
CREATE DATABASE [baxtech_clinic] ON  PRIMARY 
( NAME = N'baxtech_clinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\baxtech_clinic.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'baxtech_clinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\baxtech_clinic_log.LDF' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [baxtech_clinic] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [baxtech_clinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [baxtech_clinic] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [baxtech_clinic] SET ANSI_NULLS OFF
GO
ALTER DATABASE [baxtech_clinic] SET ANSI_PADDING OFF
GO
ALTER DATABASE [baxtech_clinic] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [baxtech_clinic] SET ARITHABORT OFF
GO
ALTER DATABASE [baxtech_clinic] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [baxtech_clinic] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [baxtech_clinic] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [baxtech_clinic] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [baxtech_clinic] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [baxtech_clinic] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [baxtech_clinic] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [baxtech_clinic] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [baxtech_clinic] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [baxtech_clinic] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [baxtech_clinic] SET  ENABLE_BROKER
GO
ALTER DATABASE [baxtech_clinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [baxtech_clinic] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [baxtech_clinic] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [baxtech_clinic] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [baxtech_clinic] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [baxtech_clinic] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [baxtech_clinic] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [baxtech_clinic] SET  READ_WRITE
GO
ALTER DATABASE [baxtech_clinic] SET RECOVERY FULL
GO
ALTER DATABASE [baxtech_clinic] SET  MULTI_USER
GO
ALTER DATABASE [baxtech_clinic] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [baxtech_clinic] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'baxtech_clinic', N'ON'
GO
USE [baxtech_clinic]
GO
/****** Object:  Table [dbo].[VisitDetails]    Script Date: 02/05/2012 18:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VisitDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Symptoms] [varchar](1000) NOT NULL,
	[Disease] [varchar](1000) NOT NULL,
	[Treatment] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_VisitDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 02/05/2012 18:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[EmergencyContact] [varchar](255) NOT NULL,
	[DateOfRegistration] [datetime] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 02/05/2012 18:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BedType]    Script Date: 02/05/2012 18:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BedType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BedTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bed]    Script Date: 02/05/2012 18:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BedName] [varchar](50) NOT NULL,
	[RatePerDay] [money] NOT NULL,
	[BedTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Bed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddPatient]    Script Date: 02/05/2012 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddPatient]
(
	@Name [varchar](100),
	@Address [varchar](255),
	@DateOfBirth [date],
	@Phone [varchar](20),
	@EmergencyContact [varchar](255))
AS
BEGIN
	INSERT INTO [Patient] (Name, Address, DateOfBirth, Phone, EmergencyContact)
	VALUES (@Name, @Address, @DateOfBirth, @Phone, @EmergencyContact)
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatients]    Script Date: 02/05/2012 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatients]
AS
BEGIN
	SELECT * from [Patient]
END
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 02/05/2012 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DateOfVisit] [datetime] NOT NULL,
	[BedId] [int] NULL,
	[DateOfDischarge] [datetime] NULL,
	[DetailsId] [int] NULL,
 CONSTRAINT [PK_InPatient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ActiveVisits]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ActiveVisits]
AS
SELECT     Id, DoctorId, PatientId, DateOfVisit, BedId, DateOfDischarge, DetailsId
FROM         dbo.Visit
WHERE     (DateOfDischarge IS NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Visit"
            Begin Extent = 
               Top = 225
               Left = 185
               Bottom = 333
               Right = 347
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ActiveVisits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ActiveVisits'
GO
/****** Object:  StoredProcedure [dbo].[DischargeVisit]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DischargeVisit]
(@VisitID int)
AS
BEGIN
	UPDATE [Visit]
	SET DateOfDischarge = GETDATE()
	WHERE Id = @VisitID
END
GO
/****** Object:  View [dbo].[OutPatients]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OutPatients]
AS
SELECT     dbo.Visit.Id, dbo.Doctor.Id AS DoctorId, dbo.Visit.DateOfVisit, dbo.Visit.DateOfDischarge, dbo.Patient.Name AS PatientName, dbo.Doctor.Name AS DoctorName, 
                      dbo.Bed.BedName, dbo.Visit.DetailsId
FROM         dbo.Visit INNER JOIN
                      dbo.Patient ON dbo.Visit.PatientId = dbo.Patient.Id INNER JOIN
                      dbo.Doctor ON dbo.Visit.DoctorId = dbo.Doctor.Id LEFT OUTER JOIN
                      dbo.Bed ON dbo.Visit.BedId = dbo.Bed.Id
WHERE     (dbo.Visit.DateOfDischarge IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Visit"
            Begin Extent = 
               Top = 6
               Left = 438
               Bottom = 114
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Patient"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bed"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OutPatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OutPatients'
GO
/****** Object:  View [dbo].[OccupiedBedsView]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OccupiedBedsView]
AS
SELECT     dbo.Bed.Id, dbo.Bed.BedName, dbo.Visit.PatientId, dbo.Patient.Name, dbo.Bed.RatePerDay
FROM         dbo.Bed INNER JOIN
                      dbo.Visit ON dbo.Bed.Id = dbo.Visit.BedId INNER JOIN
                      dbo.Patient ON dbo.Visit.PatientId = dbo.Patient.Id
WHERE     (dbo.Visit.DateOfDischarge IS NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Bed"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Visit"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 389
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient"
            Begin Extent = 
               Top = 6
               Left = 427
               Bottom = 114
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OccupiedBedsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OccupiedBedsView'
GO
/****** Object:  StoredProcedure [dbo].[OccupiedBeds]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[OccupiedBeds]
AS
BEGIN
	SELECT Bed.Id, Bed.BedName, Bed.RatePerDay, Visit.PatientId, Patient.Name
	FROM Bed
	INNER JOIN  Visit ON Bed.Id = Visit.BedId
	INNER JOIN  Patient ON Visit.PatientId = Patient.Id
	WHERE Visit.DateOfDischarge IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[NewOutPatient]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NewOutPatient]
(@PatientId int,
@DoctorId int)
AS
BEGIN
	DECLARE @now datetime
	SET @now = GETDATE()
	INSERT INTO [Visit] (DoctorId, PatientId, DateOfVisit, DateOfDischarge)
	VALUES (@DoctorId, @PatientId, @now, @now)
	
	return SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[RecordVisitDetails]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RecordVisitDetails](
	@VisitId int,
	@Symptoms [varchar](1000),
	@Disease [varchar](1000),
	@Treatment [varchar](1000))
AS
BEGIN
	DECLARE @IdToUse int
	
	SELECT @IdToUse = Visit.DetailsId
	FROM Visit
	WHERE Visit.Id = @VisitId
	
	IF (@IdToUse IS NULL)
	BEGIN
		INSERT INTO VisitDetails (Symptoms, Disease, Treatment)
		VALUES (@Symptoms, @Disease, @Treatment)
		
		UPDATE Visit
		SET Visit.DetailsId = SCOPE_IDENTITY()
		WHERE Visit.Id = @VisitId
	END
	ELSE
	BEGIN
		UPDATE VisitDetails
		SET Symptoms = @Symptoms, Disease = @Disease, Treatment = @Treatment
		WHERE VisitDetails.Id = @IdToUse
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[FindVisit]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FindVisit]
(@VisitId int)
AS
BEGIN
	select COUNT(Visit.Id) from Visit
	where Visit.Id = @VisitId
END
GO
/****** Object:  StoredProcedure [dbo].[VisitDetailsForVisit]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[VisitDetailsForVisit]
(@VisitId int)
AS
BEGIN
	SELECT * From [VisitDetails]
	WHERE Id = (SELECT Visit.DetailsId FROM [Visit] WHERE Visit.Id = @VisitId)
END
GO
/****** Object:  StoredProcedure [dbo].[FreeBeds]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[FreeBeds]
AS
BEGIN
	SELECT Bed.Id, Bed.BedName, Bed.RatePerDay, BedType.Description
	FROM Bed
	INNER JOIN  BedType ON Bed.BedTypeId = BedType.Id
	WHERE Bed.Id NOT IN (SELECT Id FROM OccupiedBedsView)
END
GO
/****** Object:  StoredProcedure [dbo].[GetOutPatients]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOutPatients]
AS
BEGIN
	SELECT * from [OutPatients]
END
GO
/****** Object:  StoredProcedure [dbo].[PastVisitsToDoctor]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PastVisitsToDoctor]
(@DoctorID int)
AS
BEGIN
	SELECT * from [OutPatients]
	WHERE DoctorId = @DoctorID
END
GO
/****** Object:  StoredProcedure [dbo].[NewInPatient]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NewInPatient]
(@PatientId int,
@DoctorId int,
@BedId int)
AS
BEGIN
	INSERT INTO [Visit] (DoctorId, PatientId, BedId, DateOfVisit)
	VALUES (@DoctorId, @PatientId, @BedId, GETDATE())
	
	DECLARE @ScopeIdentity int
	SET @ScopeIdentity = SCOPE_IDENTITY()
	EXEC RecordVisitDetails @ScopeIdentity, 'None yet recorded', 'Unknown', 'Currently under observation'
END
GO
/****** Object:  View [dbo].[InPatients]    Script Date: 02/05/2012 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InPatients]
AS
SELECT     dbo.ActiveVisits.Id, dbo.ActiveVisits.DoctorId, dbo.ActiveVisits.PatientId, dbo.ActiveVisits.BedId, dbo.ActiveVisits.DetailsId, dbo.Patient.Name AS PatientName, 
                      dbo.Doctor.Name AS DoctorName, dbo.ActiveVisits.DateOfVisit, dbo.Bed.BedName
FROM         dbo.ActiveVisits INNER JOIN
                      dbo.Doctor ON dbo.ActiveVisits.DoctorId = dbo.Doctor.Id INNER JOIN
                      dbo.Patient ON dbo.ActiveVisits.PatientId = dbo.Patient.Id INNER JOIN
                      dbo.Bed ON dbo.ActiveVisits.BedId = dbo.Bed.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Doctor"
            Begin Extent = 
               Top = 20
               Left = 396
               Bottom = 128
               Right = 547
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient"
            Begin Extent = 
               Top = 133
               Left = 463
               Bottom = 241
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bed"
            Begin Extent = 
               Top = 140
               Left = 296
               Bottom = 248
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ActiveVisits"
            Begin Extent = 
               Top = 44
               Left = 30
               Bottom = 152
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InPatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InPatients'
GO
/****** Object:  UserDefinedFunction [dbo].[CountDoctorVisits]    Script Date: 02/05/2012 18:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CountDoctorVisits]
(@DoctorId int)
RETURNS int
AS
BEGIN
	DECLARE @VisitCount int = 0
	SELECT @VisitCount = COUNT(Id) from [InPatients]
	WHERE [InPatients].DoctorId = @DoctorID
	RETURN @VisitCount
END
GO
/****** Object:  StoredProcedure [dbo].[ActiveTreatmentsByDoctor]    Script Date: 02/05/2012 18:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActiveTreatmentsByDoctor]
(@DoctorID int)
AS
BEGIN
	SELECT * from [InPatients]
	WHERE [InPatients].DoctorId = @DoctorID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInPatients]    Script Date: 02/05/2012 18:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInPatients]
AS
BEGIN
	SELECT * from [InPatients]
END
GO
/****** Object:  View [dbo].[Doctors]    Script Date: 02/05/2012 18:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctors]
AS
SELECT     Id, Name, Address, Phone, dbo.CountDoctorVisits(Id) AS PatientsInCare
FROM         dbo.Doctor
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Doctor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Doctors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Doctors'
GO
/****** Object:  StoredProcedure [dbo].[GetDoctors]    Script Date: 02/05/2012 18:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDoctors]
AS
BEGIN
	SELECT * from [Doctors]
END
GO
/****** Object:  Default [DF_Patient_DateOfRegistration]    Script Date: 02/05/2012 18:48:15 ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_DateOfRegistration]  DEFAULT (getdate()) FOR [DateOfRegistration]
GO
/****** Object:  Default [DF_Visit_DateOfVisit]    Script Date: 02/05/2012 18:48:17 ******/
ALTER TABLE [dbo].[Visit] ADD  CONSTRAINT [DF_Visit_DateOfVisit]  DEFAULT (getdate()) FOR [DateOfVisit]
GO
/****** Object:  ForeignKey [FK_Bed_BedType]    Script Date: 02/05/2012 18:48:15 ******/
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD  CONSTRAINT [FK_Bed_BedType] FOREIGN KEY([BedTypeId])
REFERENCES [dbo].[BedType] ([Id])
GO
ALTER TABLE [dbo].[Bed] CHECK CONSTRAINT [FK_Bed_BedType]
GO
/****** Object:  ForeignKey [FK_Visit_Bed]    Script Date: 02/05/2012 18:48:17 ******/
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Bed] FOREIGN KEY([BedId])
REFERENCES [dbo].[Bed] ([Id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Bed]
GO
/****** Object:  ForeignKey [FK_Visit_Doctor]    Script Date: 02/05/2012 18:48:17 ******/
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Doctor]
GO
/****** Object:  ForeignKey [FK_Visit_Patient]    Script Date: 02/05/2012 18:48:17 ******/
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Patient]
GO
/****** Object:  ForeignKey [FK_Visit_VisitDetails]    Script Date: 02/05/2012 18:48:17 ******/
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_VisitDetails] FOREIGN KEY([DetailsId])
REFERENCES [dbo].[VisitDetails] ([Id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_VisitDetails]
GO
