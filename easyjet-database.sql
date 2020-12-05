-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 03:10 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyjet-database`
--

-- --------------------------------------------------------

--
-- Table structure for table `ez_account`
--

CREATE TABLE `ez_account` (
  `AccountID` int(11) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `AccountFirstName` varchar(255) NOT NULL,
  `AccountLastName` varchar(255) NOT NULL,
  `AccountPassword` varbinary(255) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `EasyJetPlusNumber` int(11) DEFAULT NULL,
  `DeparturePreferenceID` int(11) NOT NULL,
  `EasyJetOffersUpdates` tinyint(1) NOT NULL,
  `PartnerOffersUpdates` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_address`
--

CREATE TABLE `ez_address` (
  `AddressID` int(11) NOT NULL,
  `BuildingNumber` int(11) NOT NULL,
  `BuildingName` varchar(255) DEFAULT NULL,
  `StreetName1` varchar(255) NOT NULL,
  `StreetName2` varchar(255) DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  `Postcode` varchar(255) NOT NULL,
  `County` varchar(255) DEFAULT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_aircraftseating`
--

CREATE TABLE `ez_aircraftseating` (
  `AircraftSeatID` int(11) NOT NULL,
  `SeatID` int(11) NOT NULL,
  `AircraftID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_aircrafttype`
--

CREATE TABLE `ez_aircrafttype` (
  `AircraftID` int(11) NOT NULL,
  `TypeDescription` varchar(255) NOT NULL,
  `SeatingCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_airports`
--

CREATE TABLE `ez_airports` (
  `AirportID` int(11) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `AirportCode` varchar(3) NOT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_basicbaggage`
--

CREATE TABLE `ez_basicbaggage` (
  `BasicBaggageID` int(11) NOT NULL,
  `BaggageType` varchar(255) NOT NULL,
  `BaggageWeight` int(11) DEFAULT NULL,
  `BaggageCost` double(12,2) NOT NULL,
  `ExcessWeightFee` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_booking`
--

CREATE TABLE `ez_booking` (
  `BookingID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `BookingRefNumber` varchar(255) NOT NULL,
  `BookingDateRef` date NOT NULL,
  `AddressID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `TotalCost` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_cities`
--

CREATE TABLE `ez_cities` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(255) NOT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_contactdetails`
--

CREATE TABLE `ez_contactdetails` (
  `ContactID` int(11) NOT NULL,
  `DialCodeID` int(11) NOT NULL,
  `TelephoneNumber1` varchar(255) NOT NULL,
  `TelephoneNumber2` int(11) DEFAULT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_countries`
--

CREATE TABLE `ez_countries` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_diallingcode`
--

CREATE TABLE `ez_diallingcode` (
  `DialCodeID` int(11) NOT NULL,
  `DiallingCode` varchar(255) NOT NULL,
  `CountryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_flightdays`
--

CREATE TABLE `ez_flightdays` (
  `FlightDayID` int(11) NOT NULL,
  `FlightDay` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_flightpassengerseat`
--

CREATE TABLE `ez_flightpassengerseat` (
  `FlightSeatID` int(11) NOT NULL,
  `AircraftSeatID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `BookingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_flights`
--

CREATE TABLE `ez_flights` (
  `FlightID` int(11) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `AircraftID` int(11) NOT NULL,
  `EstFlightTime` time NOT NULL,
  `FlightBasicPrice` decimal(12,2) NOT NULL,
  `FlightStatusID` int(11) NOT NULL,
  `FlightDayID` int(11) NOT NULL,
  `FlightDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_flightstatus`
--

CREATE TABLE `ez_flightstatus` (
  `FlightStatusID` int(11) NOT NULL,
  `FlightStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_gender`
--

CREATE TABLE `ez_gender` (
  `GenderID` int(11) NOT NULL,
  `GenderDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_lineitem`
--

CREATE TABLE `ez_lineitem` (
  `LineItemID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `ItemDescription` varchar(255) NOT NULL,
  `ItemCost` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_nationality`
--

CREATE TABLE `ez_nationality` (
  `NationalityID` int(11) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `NationalityType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_passenger`
--

CREATE TABLE `ez_passenger` (
  `PassengerID` int(11) NOT NULL,
  `PassengerFirstName` varchar(255) NOT NULL,
  `PassengerLastName` varchar(255) NOT NULL,
  `TitleID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `FlightPassengerSeatID` int(11) NOT NULL,
  `PassengerTypeID` int(11) NOT NULL,
  `TravelPurposeID` int(11) NOT NULL,
  `PassportInfoID` int(11) NOT NULL,
  `PassengerBaggageID` int(11) NOT NULL,
  `PassengerSpecialAssistanceID` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_passengerbaggage`
--

CREATE TABLE `ez_passengerbaggage` (
  `PassengerBaggageID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `BasicBaggageID` int(11) NOT NULL,
  `SportsEquipmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_passengerspecialassistanceid`
--

CREATE TABLE `ez_passengerspecialassistanceid` (
  `PassengerSpecialAssistanceID` int(11) NOT NULL,
  `SpecialAssistanceID` int(11) DEFAULT NULL,
  `PassengerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_passengertype`
--

CREATE TABLE `ez_passengertype` (
  `PassengerTypeID` int(11) NOT NULL,
  `TypeDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_passportinfo`
--

CREATE TABLE `ez_passportinfo` (
  `PassportInfoID` int(11) NOT NULL,
  `GenderID` int(11) NOT NULL,
  `NationalityID` int(11) NOT NULL,
  `PassportFirstName` varchar(255) NOT NULL,
  `PassportLastName` varchar(255) NOT NULL,
  `PassportNumber` varbinary(255) NOT NULL,
  `ExpiryDate` date NOT NULL,
  `IssueCountryID` int(11) NOT NULL,
  `DateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_payment`
--

CREATE TABLE `ez_payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentMethodID` int(11) NOT NULL,
  `PaymentStatusID` int(11) NOT NULL,
  `ProtectionPromise` tinyint(1) NOT NULL,
  `TimeOfPurchase` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_paymentcardtype`
--

CREATE TABLE `ez_paymentcardtype` (
  `CardTypeID` int(11) NOT NULL,
  `CardTypeDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_paymentmethod`
--

CREATE TABLE `ez_paymentmethod` (
  `PaymentMethodID` int(11) NOT NULL,
  `CardTypeID` int(11) NOT NULL,
  `CardHolderName` varchar(255) NOT NULL,
  `CardNumber` varbinary(255) NOT NULL,
  `CardExpiryDate` date NOT NULL,
  `CardCVV` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_paymentstatus`
--

CREATE TABLE `ez_paymentstatus` (
  `PaymentStatusID` int(11) NOT NULL,
  `StatusDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_routes`
--

CREATE TABLE `ez_routes` (
  `RouteID` int(11) NOT NULL,
  `RouteName` varchar(255) NOT NULL,
  `DepartureAirportID` int(11) NOT NULL,
  `ArrivalAirportID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_seatcolumnletter`
--

CREATE TABLE `ez_seatcolumnletter` (
  `SeatColumnID` int(11) NOT NULL,
  `SeatColumnLetter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_seatingplan`
--

CREATE TABLE `ez_seatingplan` (
  `SeatID` int(11) NOT NULL,
  `SeatName` varchar(255) NOT NULL,
  `SeatTypeID` int(11) NOT NULL,
  `SeatRowID` int(11) NOT NULL,
  `SeatColumnID` int(11) NOT NULL,
  `RestrictedSeat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_seatingtype`
--

CREATE TABLE `ez_seatingtype` (
  `SeatingTypeID` int(11) NOT NULL,
  `TypeDescription` varchar(255) NOT NULL,
  `TypePrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_seatrownumber`
--

CREATE TABLE `ez_seatrownumber` (
  `SeatRowID` int(11) NOT NULL,
  `SeatRowNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_specialassistance`
--

CREATE TABLE `ez_specialassistance` (
  `SpecialAssistanceID` int(11) NOT NULL,
  `AssistanceType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_sportsequipment`
--

CREATE TABLE `ez_sportsequipment` (
  `SportsEquipmentID` int(11) NOT NULL,
  `EquipmentType` varchar(255) NOT NULL,
  `SportsCost` double(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_title`
--

CREATE TABLE `ez_title` (
  `TitleID` int(11) NOT NULL,
  `TitleType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ez_travelpurpose`
--

CREATE TABLE `ez_travelpurpose` (
  `TravelPurposeID` int(11) NOT NULL,
  `TravelPurposeDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ez_account`
--
ALTER TABLE `ez_account`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `FK_AccountAddress` (`AddressID`),
  ADD KEY `FK_AccountContact` (`ContactID`),
  ADD KEY `FK_AccountDeparturePref` (`DeparturePreferenceID`),
  ADD KEY `FK_AccountTitle` (`TitleID`);

--
-- Indexes for table `ez_address`
--
ALTER TABLE `ez_address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_AddressCountry` (`CountryID`),
  ADD KEY `FK_AddressCity` (`CityID`);

--
-- Indexes for table `ez_aircraftseating`
--
ALTER TABLE `ez_aircraftseating`
  ADD PRIMARY KEY (`AircraftSeatID`),
  ADD KEY `FK_AircraftType` (`AircraftID`),
  ADD KEY `FK_SeatReference` (`SeatID`);

--
-- Indexes for table `ez_aircrafttype`
--
ALTER TABLE `ez_aircrafttype`
  ADD PRIMARY KEY (`AircraftID`);

--
-- Indexes for table `ez_airports`
--
ALTER TABLE `ez_airports`
  ADD PRIMARY KEY (`AirportID`),
  ADD KEY `FK_AirportCity` (`CityID`);

--
-- Indexes for table `ez_basicbaggage`
--
ALTER TABLE `ez_basicbaggage`
  ADD PRIMARY KEY (`BasicBaggageID`);

--
-- Indexes for table `ez_booking`
--
ALTER TABLE `ez_booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `FK_BookingAccount` (`AccountID`),
  ADD KEY `FK_BookingAddress` (`AddressID`),
  ADD KEY `FK_BookingPayment` (`PaymentID`);

--
-- Indexes for table `ez_cities`
--
ALTER TABLE `ez_cities`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `FK_CityCountry` (`CountryID`);

--
-- Indexes for table `ez_contactdetails`
--
ALTER TABLE `ez_contactdetails`
  ADD PRIMARY KEY (`ContactID`),
  ADD KEY `FK_ContactCountry` (`CountryID`),
  ADD KEY `FK_ContactDialCode` (`DialCodeID`);

--
-- Indexes for table `ez_countries`
--
ALTER TABLE `ez_countries`
  ADD PRIMARY KEY (`CountryID`);

--
-- Indexes for table `ez_diallingcode`
--
ALTER TABLE `ez_diallingcode`
  ADD PRIMARY KEY (`DialCodeID`),
  ADD KEY `FK_DialCodeCountry` (`CountryID`);

--
-- Indexes for table `ez_flightdays`
--
ALTER TABLE `ez_flightdays`
  ADD PRIMARY KEY (`FlightDayID`);

--
-- Indexes for table `ez_flightpassengerseat`
--
ALTER TABLE `ez_flightpassengerseat`
  ADD PRIMARY KEY (`FlightSeatID`),
  ADD KEY `FK_FlightAircraftSeat` (`AircraftSeatID`),
  ADD KEY `FK_FlightPassengerFlight` (`FlightID`),
  ADD KEY `FK_FlightPassengerBooking` (`BookingID`);

--
-- Indexes for table `ez_flights`
--
ALTER TABLE `ez_flights`
  ADD PRIMARY KEY (`FlightID`),
  ADD KEY `FK_FlightRoute` (`RouteID`),
  ADD KEY `FK_FlightAircraft` (`AircraftID`),
  ADD KEY `FK_FlightStatus` (`FlightStatusID`),
  ADD KEY `FK_FlightDay` (`FlightDayID`);

--
-- Indexes for table `ez_flightstatus`
--
ALTER TABLE `ez_flightstatus`
  ADD PRIMARY KEY (`FlightStatusID`);

--
-- Indexes for table `ez_gender`
--
ALTER TABLE `ez_gender`
  ADD PRIMARY KEY (`GenderID`);

--
-- Indexes for table `ez_lineitem`
--
ALTER TABLE `ez_lineitem`
  ADD PRIMARY KEY (`LineItemID`),
  ADD KEY `EZ_LineItemBooking` (`BookingID`);

--
-- Indexes for table `ez_nationality`
--
ALTER TABLE `ez_nationality`
  ADD PRIMARY KEY (`NationalityID`),
  ADD KEY `FK_NationalityCountry` (`CountryID`);

--
-- Indexes for table `ez_passenger`
--
ALTER TABLE `ez_passenger`
  ADD PRIMARY KEY (`PassengerID`),
  ADD KEY `FK_PassengerType` (`PassengerTypeID`),
  ADD KEY `FK_PassengerTitle` (`TitleID`),
  ADD KEY `FK_PassengerPurpose` (`TravelPurposeID`),
  ADD KEY `FK_PassengerBooking` (`BookingID`),
  ADD KEY `FK_PassengerContact` (`ContactID`),
  ADD KEY `FK_PassengerAddress` (`AddressID`),
  ADD KEY `FK_PassengerAccount` (`AccountID`),
  ADD KEY `FK_PassengerPassport` (`PassportInfoID`),
  ADD KEY `FK_PassengerBaggage` (`PassengerBaggageID`),
  ADD KEY `FK_FlightPassengerSeat` (`FlightPassengerSeatID`);

--
-- Indexes for table `ez_passengerbaggage`
--
ALTER TABLE `ez_passengerbaggage`
  ADD PRIMARY KEY (`PassengerBaggageID`),
  ADD KEY `FK_PassengerBaggageBasic` (`BasicBaggageID`),
  ADD KEY `FK_BaggageBooking` (`BookingID`),
  ADD KEY `FK_BaggageSports` (`SportsEquipmentID`);

--
-- Indexes for table `ez_passengerspecialassistanceid`
--
ALTER TABLE `ez_passengerspecialassistanceid`
  ADD PRIMARY KEY (`PassengerSpecialAssistanceID`),
  ADD KEY `FK_SpecialAssistance` (`SpecialAssistanceID`),
  ADD KEY `FK_SpecialAssistancePassenger` (`PassengerID`);

--
-- Indexes for table `ez_passengertype`
--
ALTER TABLE `ez_passengertype`
  ADD PRIMARY KEY (`PassengerTypeID`);

--
-- Indexes for table `ez_passportinfo`
--
ALTER TABLE `ez_passportinfo`
  ADD PRIMARY KEY (`PassportInfoID`),
  ADD KEY `FK_PassportGender` (`GenderID`),
  ADD KEY `FK_PassportNationality` (`NationalityID`),
  ADD KEY `FK_IssueCountry` (`IssueCountryID`);

--
-- Indexes for table `ez_payment`
--
ALTER TABLE `ez_payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `FK_PaymentMethod` (`PaymentMethodID`),
  ADD KEY `FK_PaymentStatus` (`PaymentStatusID`);

--
-- Indexes for table `ez_paymentcardtype`
--
ALTER TABLE `ez_paymentcardtype`
  ADD PRIMARY KEY (`CardTypeID`);

--
-- Indexes for table `ez_paymentmethod`
--
ALTER TABLE `ez_paymentmethod`
  ADD PRIMARY KEY (`PaymentMethodID`),
  ADD KEY `FK_PaymentMethodCardType` (`CardTypeID`);

--
-- Indexes for table `ez_paymentstatus`
--
ALTER TABLE `ez_paymentstatus`
  ADD PRIMARY KEY (`PaymentStatusID`);

--
-- Indexes for table `ez_routes`
--
ALTER TABLE `ez_routes`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `FK_RouteDeparture` (`DepartureAirportID`),
  ADD KEY `FK_RouteArrival` (`ArrivalAirportID`);

--
-- Indexes for table `ez_seatcolumnletter`
--
ALTER TABLE `ez_seatcolumnletter`
  ADD PRIMARY KEY (`SeatColumnID`);

--
-- Indexes for table `ez_seatingplan`
--
ALTER TABLE `ez_seatingplan`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `FK_SeatingType` (`SeatTypeID`),
  ADD KEY `FK_SeatingColumn` (`SeatColumnID`),
  ADD KEY `FK_SeatingRow` (`SeatRowID`);

--
-- Indexes for table `ez_seatingtype`
--
ALTER TABLE `ez_seatingtype`
  ADD PRIMARY KEY (`SeatingTypeID`);

--
-- Indexes for table `ez_seatrownumber`
--
ALTER TABLE `ez_seatrownumber`
  ADD PRIMARY KEY (`SeatRowID`);

--
-- Indexes for table `ez_specialassistance`
--
ALTER TABLE `ez_specialassistance`
  ADD PRIMARY KEY (`SpecialAssistanceID`);

--
-- Indexes for table `ez_sportsequipment`
--
ALTER TABLE `ez_sportsequipment`
  ADD PRIMARY KEY (`SportsEquipmentID`);

--
-- Indexes for table `ez_title`
--
ALTER TABLE `ez_title`
  ADD PRIMARY KEY (`TitleID`);

--
-- Indexes for table `ez_travelpurpose`
--
ALTER TABLE `ez_travelpurpose`
  ADD PRIMARY KEY (`TravelPurposeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ez_account`
--
ALTER TABLE `ez_account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_address`
--
ALTER TABLE `ez_address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_aircraftseating`
--
ALTER TABLE `ez_aircraftseating`
  MODIFY `AircraftSeatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_aircrafttype`
--
ALTER TABLE `ez_aircrafttype`
  MODIFY `AircraftID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_airports`
--
ALTER TABLE `ez_airports`
  MODIFY `AirportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_basicbaggage`
--
ALTER TABLE `ez_basicbaggage`
  MODIFY `BasicBaggageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_booking`
--
ALTER TABLE `ez_booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_cities`
--
ALTER TABLE `ez_cities`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_contactdetails`
--
ALTER TABLE `ez_contactdetails`
  MODIFY `ContactID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_countries`
--
ALTER TABLE `ez_countries`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_diallingcode`
--
ALTER TABLE `ez_diallingcode`
  MODIFY `DialCodeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_flightdays`
--
ALTER TABLE `ez_flightdays`
  MODIFY `FlightDayID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_flightpassengerseat`
--
ALTER TABLE `ez_flightpassengerseat`
  MODIFY `FlightSeatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_flights`
--
ALTER TABLE `ez_flights`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_flightstatus`
--
ALTER TABLE `ez_flightstatus`
  MODIFY `FlightStatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_gender`
--
ALTER TABLE `ez_gender`
  MODIFY `GenderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_lineitem`
--
ALTER TABLE `ez_lineitem`
  MODIFY `LineItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_nationality`
--
ALTER TABLE `ez_nationality`
  MODIFY `NationalityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_passenger`
--
ALTER TABLE `ez_passenger`
  MODIFY `PassengerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_passengerbaggage`
--
ALTER TABLE `ez_passengerbaggage`
  MODIFY `PassengerBaggageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_passengerspecialassistanceid`
--
ALTER TABLE `ez_passengerspecialassistanceid`
  MODIFY `PassengerSpecialAssistanceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_passengertype`
--
ALTER TABLE `ez_passengertype`
  MODIFY `PassengerTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_passportinfo`
--
ALTER TABLE `ez_passportinfo`
  MODIFY `PassportInfoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_payment`
--
ALTER TABLE `ez_payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_paymentcardtype`
--
ALTER TABLE `ez_paymentcardtype`
  MODIFY `CardTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_paymentmethod`
--
ALTER TABLE `ez_paymentmethod`
  MODIFY `PaymentMethodID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_paymentstatus`
--
ALTER TABLE `ez_paymentstatus`
  MODIFY `PaymentStatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_routes`
--
ALTER TABLE `ez_routes`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_seatcolumnletter`
--
ALTER TABLE `ez_seatcolumnletter`
  MODIFY `SeatColumnID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_seatingplan`
--
ALTER TABLE `ez_seatingplan`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_seatingtype`
--
ALTER TABLE `ez_seatingtype`
  MODIFY `SeatingTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_seatrownumber`
--
ALTER TABLE `ez_seatrownumber`
  MODIFY `SeatRowID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_specialassistance`
--
ALTER TABLE `ez_specialassistance`
  MODIFY `SpecialAssistanceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_sportsequipment`
--
ALTER TABLE `ez_sportsequipment`
  MODIFY `SportsEquipmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_title`
--
ALTER TABLE `ez_title`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ez_travelpurpose`
--
ALTER TABLE `ez_travelpurpose`
  MODIFY `TravelPurposeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ez_account`
--
ALTER TABLE `ez_account`
  ADD CONSTRAINT `FK_AccountAddress` FOREIGN KEY (`AddressID`) REFERENCES `ez_address` (`AddressID`),
  ADD CONSTRAINT `FK_AccountContact` FOREIGN KEY (`ContactID`) REFERENCES `ez_contactdetails` (`ContactID`),
  ADD CONSTRAINT `FK_AccountDeparturePref` FOREIGN KEY (`DeparturePreferenceID`) REFERENCES `ez_airports` (`AirportID`),
  ADD CONSTRAINT `FK_AccountTitle` FOREIGN KEY (`TitleID`) REFERENCES `ez_title` (`TitleID`);

--
-- Constraints for table `ez_address`
--
ALTER TABLE `ez_address`
  ADD CONSTRAINT `FK_AddressCity` FOREIGN KEY (`CityID`) REFERENCES `ez_cities` (`CityID`),
  ADD CONSTRAINT `FK_AddressCountry` FOREIGN KEY (`CountryID`) REFERENCES `ez_countries` (`CountryID`);

--
-- Constraints for table `ez_aircraftseating`
--
ALTER TABLE `ez_aircraftseating`
  ADD CONSTRAINT `FK_AircraftType` FOREIGN KEY (`AircraftID`) REFERENCES `ez_aircrafttype` (`AircraftID`),
  ADD CONSTRAINT `FK_SeatReference` FOREIGN KEY (`SeatID`) REFERENCES `ez_seatingplan` (`SeatID`);

--
-- Constraints for table `ez_airports`
--
ALTER TABLE `ez_airports`
  ADD CONSTRAINT `FK_AirportCity` FOREIGN KEY (`CityID`) REFERENCES `ez_cities` (`CityID`);

--
-- Constraints for table `ez_booking`
--
ALTER TABLE `ez_booking`
  ADD CONSTRAINT `FK_BookingAccount` FOREIGN KEY (`AccountID`) REFERENCES `ez_account` (`AccountID`),
  ADD CONSTRAINT `FK_BookingAddress` FOREIGN KEY (`AddressID`) REFERENCES `ez_address` (`AddressID`),
  ADD CONSTRAINT `FK_BookingPayment` FOREIGN KEY (`PaymentID`) REFERENCES `ez_payment` (`PaymentID`);

--
-- Constraints for table `ez_cities`
--
ALTER TABLE `ez_cities`
  ADD CONSTRAINT `FK_CityCountry` FOREIGN KEY (`CountryID`) REFERENCES `ez_countries` (`CountryID`);

--
-- Constraints for table `ez_contactdetails`
--
ALTER TABLE `ez_contactdetails`
  ADD CONSTRAINT `FK_ContactCountry` FOREIGN KEY (`CountryID`) REFERENCES `ez_countries` (`CountryID`),
  ADD CONSTRAINT `FK_ContactDialCode` FOREIGN KEY (`DialCodeID`) REFERENCES `ez_diallingcode` (`DialCodeID`);

--
-- Constraints for table `ez_diallingcode`
--
ALTER TABLE `ez_diallingcode`
  ADD CONSTRAINT `FK_DialCodeCountry` FOREIGN KEY (`CountryID`) REFERENCES `ez_countries` (`CountryID`);

--
-- Constraints for table `ez_flightpassengerseat`
--
ALTER TABLE `ez_flightpassengerseat`
  ADD CONSTRAINT `FK_FlightAircraftSeat` FOREIGN KEY (`AircraftSeatID`) REFERENCES `ez_aircraftseating` (`AircraftSeatID`),
  ADD CONSTRAINT `FK_FlightPassengerBooking` FOREIGN KEY (`BookingID`) REFERENCES `ez_booking` (`BookingID`),
  ADD CONSTRAINT `FK_FlightPassengerFlight` FOREIGN KEY (`FlightID`) REFERENCES `ez_flights` (`FlightID`);

--
-- Constraints for table `ez_flights`
--
ALTER TABLE `ez_flights`
  ADD CONSTRAINT `FK_FlightAircraft` FOREIGN KEY (`AircraftID`) REFERENCES `ez_aircrafttype` (`AircraftID`),
  ADD CONSTRAINT `FK_FlightDay` FOREIGN KEY (`FlightDayID`) REFERENCES `ez_flightdays` (`FlightDayID`),
  ADD CONSTRAINT `FK_FlightRoute` FOREIGN KEY (`RouteID`) REFERENCES `ez_routes` (`RouteID`),
  ADD CONSTRAINT `FK_FlightStatus` FOREIGN KEY (`FlightStatusID`) REFERENCES `ez_flightstatus` (`FlightStatusID`);

--
-- Constraints for table `ez_lineitem`
--
ALTER TABLE `ez_lineitem`
  ADD CONSTRAINT `EZ_LineItemBooking` FOREIGN KEY (`BookingID`) REFERENCES `ez_booking` (`BookingID`);

--
-- Constraints for table `ez_nationality`
--
ALTER TABLE `ez_nationality`
  ADD CONSTRAINT `FK_NationalityCountry` FOREIGN KEY (`CountryID`) REFERENCES `ez_countries` (`CountryID`);

--
-- Constraints for table `ez_passenger`
--
ALTER TABLE `ez_passenger`
  ADD CONSTRAINT `FK_FlightPassengerSeat` FOREIGN KEY (`FlightPassengerSeatID`) REFERENCES `ez_flightpassengerseat` (`FlightSeatID`),
  ADD CONSTRAINT `FK_PassengerAccount` FOREIGN KEY (`AccountID`) REFERENCES `ez_account` (`AccountID`),
  ADD CONSTRAINT `FK_PassengerAddress` FOREIGN KEY (`AddressID`) REFERENCES `ez_address` (`AddressID`),
  ADD CONSTRAINT `FK_PassengerBaggage` FOREIGN KEY (`PassengerBaggageID`) REFERENCES `ez_passengerbaggage` (`PassengerBaggageID`),
  ADD CONSTRAINT `FK_PassengerBooking` FOREIGN KEY (`BookingID`) REFERENCES `ez_booking` (`BookingID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_PassengerContact` FOREIGN KEY (`ContactID`) REFERENCES `ez_contactdetails` (`ContactID`),
  ADD CONSTRAINT `FK_PassengerPassport` FOREIGN KEY (`PassportInfoID`) REFERENCES `ez_passportinfo` (`PassportInfoID`),
  ADD CONSTRAINT `FK_PassengerPurpose` FOREIGN KEY (`TravelPurposeID`) REFERENCES `ez_travelpurpose` (`TravelPurposeID`),
  ADD CONSTRAINT `FK_PassengerTitle` FOREIGN KEY (`TitleID`) REFERENCES `ez_title` (`TitleID`),
  ADD CONSTRAINT `FK_PassengerType` FOREIGN KEY (`PassengerTypeID`) REFERENCES `ez_passengertype` (`PassengerTypeID`);

--
-- Constraints for table `ez_passengerbaggage`
--
ALTER TABLE `ez_passengerbaggage`
  ADD CONSTRAINT `FK_BaggageBooking` FOREIGN KEY (`BookingID`) REFERENCES `ez_booking` (`BookingID`),
  ADD CONSTRAINT `FK_BaggageSports` FOREIGN KEY (`SportsEquipmentID`) REFERENCES `ez_sportsequipment` (`SportsEquipmentID`),
  ADD CONSTRAINT `FK_PassengerBaggageBasic` FOREIGN KEY (`BasicBaggageID`) REFERENCES `ez_basicbaggage` (`BasicBaggageID`);

--
-- Constraints for table `ez_passengerspecialassistanceid`
--
ALTER TABLE `ez_passengerspecialassistanceid`
  ADD CONSTRAINT `FK_SpecialAssistance` FOREIGN KEY (`SpecialAssistanceID`) REFERENCES `ez_specialassistance` (`SpecialAssistanceID`),
  ADD CONSTRAINT `FK_SpecialAssistancePassenger` FOREIGN KEY (`PassengerID`) REFERENCES `ez_passenger` (`PassengerID`);

--
-- Constraints for table `ez_passportinfo`
--
ALTER TABLE `ez_passportinfo`
  ADD CONSTRAINT `FK_IssueCountry` FOREIGN KEY (`IssueCountryID`) REFERENCES `ez_countries` (`CountryID`),
  ADD CONSTRAINT `FK_PassportGender` FOREIGN KEY (`GenderID`) REFERENCES `ez_gender` (`GenderID`),
  ADD CONSTRAINT `FK_PassportNationality` FOREIGN KEY (`NationalityID`) REFERENCES `ez_nationality` (`NationalityID`);

--
-- Constraints for table `ez_payment`
--
ALTER TABLE `ez_payment`
  ADD CONSTRAINT `FK_PaymentMethod` FOREIGN KEY (`PaymentMethodID`) REFERENCES `ez_paymentmethod` (`PaymentMethodID`),
  ADD CONSTRAINT `FK_PaymentStatus` FOREIGN KEY (`PaymentStatusID`) REFERENCES `ez_paymentstatus` (`PaymentStatusID`);

--
-- Constraints for table `ez_paymentmethod`
--
ALTER TABLE `ez_paymentmethod`
  ADD CONSTRAINT `FK_PaymentMethodCardType` FOREIGN KEY (`CardTypeID`) REFERENCES `ez_paymentcardtype` (`CardTypeID`);

--
-- Constraints for table `ez_routes`
--
ALTER TABLE `ez_routes`
  ADD CONSTRAINT `FK_RouteArrival` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `ez_airports` (`AirportID`),
  ADD CONSTRAINT `FK_RouteDeparture` FOREIGN KEY (`DepartureAirportID`) REFERENCES `ez_airports` (`AirportID`);

--
-- Constraints for table `ez_seatingplan`
--
ALTER TABLE `ez_seatingplan`
  ADD CONSTRAINT `FK_SeatingColumn` FOREIGN KEY (`SeatColumnID`) REFERENCES `ez_seatcolumnletter` (`SeatColumnID`),
  ADD CONSTRAINT `FK_SeatingRow	` FOREIGN KEY (`SeatRowID`) REFERENCES `ez_seatrownumber` (`SeatRowID`),
  ADD CONSTRAINT `FK_SeatingType` FOREIGN KEY (`SeatTypeID`) REFERENCES `ez_seatingtype` (`SeatingTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
