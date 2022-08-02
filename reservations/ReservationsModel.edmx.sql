
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/19/2019 12:27:32
-- Generated from EDMX file: E:\notes\studia\bd\adminprog\reservations\reservations\ReservationsModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ReservationReservationSlot]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservationSlots] DROP CONSTRAINT [FK_ReservationReservationSlot];
GO
IF OBJECT_ID(N'[dbo].[FK_ParkingPlaceReservation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReservationSlots] DROP CONSTRAINT [FK_ParkingPlaceReservation];
GO
IF OBJECT_ID(N'[dbo].[FK_ParkingParkingPlace]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ParkingPlaces] DROP CONSTRAINT [FK_ParkingParkingPlace];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Reservations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservations];
GO
IF OBJECT_ID(N'[dbo].[ReservationSlots]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReservationSlots];
GO
IF OBJECT_ID(N'[dbo].[ParkingPlaces]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ParkingPlaces];
GO
IF OBJECT_ID(N'[dbo].[Parkings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parkings];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Reservations'
CREATE TABLE [dbo].[Reservations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TimeOfReservation] datetime  NOT NULL,
    [RegistrationNumber] nvarchar(max)  NULL,
    [Token] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ReservationSlots'
CREATE TABLE [dbo].[ReservationSlots] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ParkingPlaceID] int  NOT NULL,
    [TimeFrom] datetime  NOT NULL,
    [TimeTo] datetime  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [ReservationID] int  NULL
);
GO

-- Creating table 'ParkingPlaces'
CREATE TABLE [dbo].[ParkingPlaces] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [ParkingID] int  NOT NULL
);
GO

-- Creating table 'Parkings'
CREATE TABLE [dbo].[Parkings] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [PK_Reservations]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ReservationSlots'
ALTER TABLE [dbo].[ReservationSlots]
ADD CONSTRAINT [PK_ReservationSlots]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ParkingPlaces'
ALTER TABLE [dbo].[ParkingPlaces]
ADD CONSTRAINT [PK_ParkingPlaces]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Parkings'
ALTER TABLE [dbo].[Parkings]
ADD CONSTRAINT [PK_Parkings]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ReservationID] in table 'ReservationSlots'
ALTER TABLE [dbo].[ReservationSlots]
ADD CONSTRAINT [FK_ReservationReservationSlot]
    FOREIGN KEY ([ReservationID])
    REFERENCES [dbo].[Reservations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReservationReservationSlot'
CREATE INDEX [IX_FK_ReservationReservationSlot]
ON [dbo].[ReservationSlots]
    ([ReservationID]);
GO

-- Creating foreign key on [ParkingPlaceID] in table 'ReservationSlots'
ALTER TABLE [dbo].[ReservationSlots]
ADD CONSTRAINT [FK_ParkingPlaceReservation]
    FOREIGN KEY ([ParkingPlaceID])
    REFERENCES [dbo].[ParkingPlaces]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParkingPlaceReservation'
CREATE INDEX [IX_FK_ParkingPlaceReservation]
ON [dbo].[ReservationSlots]
    ([ParkingPlaceID]);
GO

-- Creating foreign key on [ParkingID] in table 'ParkingPlaces'
ALTER TABLE [dbo].[ParkingPlaces]
ADD CONSTRAINT [FK_ParkingParkingPlace]
    FOREIGN KEY ([ParkingID])
    REFERENCES [dbo].[Parkings]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParkingParkingPlace'
CREATE INDEX [IX_FK_ParkingParkingPlace]
ON [dbo].[ParkingPlaces]
    ([ParkingID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------