-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 09:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `flightbookings`
--

CREATE TABLE `flightbookings` (
  `bookingID` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `cancelled` varchar(20) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `passengers` int(10) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flightbookings`
--

INSERT INTO `flightbookings` (`bookingID`, `username`, `date`, `cancelled`, `origin`, `destination`, `passengers`, `type`) VALUES
(111, 'MMM', '26-07-2024', 'yes', 'Abuja', 'Lagos', 1, 'OneWayFlight'),
(112, 'MMM', '26-07-2024', 'no', 'Abuja', 'Lagos', 1, 'OneWayFlight'),
(113, 'MMM', '26-07-2024', 'no', 'Lagos', 'Kano', 1, 'ReturnTripFlight');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_no` varchar(10) NOT NULL,
  `origin` varchar(25) NOT NULL,
  `destination` varchar(25) NOT NULL,
  `distance` int(10) NOT NULL,
  `fare` float NOT NULL,
  `class` varchar(10) NOT NULL,
  `seats_available` int(5) NOT NULL,
  `departs` varchar(10) NOT NULL,
  `arrives` varchar(10) NOT NULL,
  `operator` varchar(25) NOT NULL,
  `origin_code` varchar(10) NOT NULL,
  `destination_code` varchar(10) NOT NULL,
  `refundable` varchar(20) NOT NULL,
  `noOfBookings` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_no`, `origin`, `destination`, `distance`, `fare`, `class`, `seats_available`, `departs`, `arrives`, `operator`, `origin_code`, `destination_code`, `refundable`, `noOfBookings`) VALUES
('ABV-001', 'Abuja', 'Lagos', 536, 45000, 'Economy', 18, '09:00', '10:30', 'Air Peace', 'ABV', 'LOS', 'Non-Refundable', 2),
('ABV-002', 'Abuja', 'Lagos', 536, 80000, 'Business', 10, '11:00', '12:30', 'Air Peace', 'ABV', 'LOS', 'Refundable', 0),
('ABV-003', 'Abuja', 'Kano', 345, 40000, 'Economy', 18, '08:00', '09:15', 'Azman Air', 'ABV', 'KAN', 'Non-Refundable', 0),
('ABV-004', 'Abuja', 'Kano', 345, 75000, 'Business', 8, '13:00', '14:15', 'Azman Air', 'ABV', 'KAN', 'Refundable', 0),
('ABV-005', 'Abuja', 'Port Harcourt', 593, 52000, 'Economy', 18, '15:00', '16:30', 'Arik Air', 'ABV', 'PHC', 'Non-Refundable', 0),
('ABV-006', 'Abuja', 'Port Harcourt', 593, 95000, 'Business', 9, '09:00', '10:30', 'Arik Air', 'ABV', 'PHC', 'Refundable', 0),
('KAN-001', 'Kano', 'Abuja', 345, 40000, 'Economy', 15, '10:00', '11:15', 'Max Air', 'KAN', 'ABV', 'Non-Refundable', 0),
('KAN-002', 'Kano', 'Abuja', 345, 70000, 'Business', 7, '18:00', '19:15', 'Max Air', 'KAN', 'ABV', 'Refundable', 0),
('KAN-003', 'Kano', 'Lagos', 833, 60000, 'Economy', 18, '06:00', '07:30', 'Max Air', 'KAN', 'LOS', 'Non-Refundable', 0),
('KAN-004', 'Kano', 'Lagos', 833, 105000, 'Business', 5, '13:00', '14:30', 'Max Air', 'KAN', 'LOS', 'Refundable', 1),
('KAN-005', 'Kano', 'Port Harcourt', 762, 55000, 'Economy', 12, '09:00', '10:30', 'Arik Air', 'KAN', 'PHC', 'Non-Refundable', 0),
('KAN-006', 'Kano', 'Port Harcourt', 762, 95000, 'Business', 5, '17:00', '18:30', 'Arik Air', 'KAN', 'PHC', 'Refundable', 0),
('LOS-001', 'Lagos', 'Abuja', 536, 45000, 'Economy', 25, '14:00', '15:30', 'Arik Air', 'LOS', 'ABV', 'Non-Refundable', 0),
('LOS-002', 'Lagos', 'Abuja', 536, 85000, 'Business', 5, '16:00', '17:30', 'Arik Air', 'LOS', 'ABV', 'Refundable', 0),
('LOS-003', 'Lagos', 'Port Harcourt', 436, 50000, 'Economy', 22, '07:00', '08:30', 'Dana Air', 'LOS', 'PHC', 'Non-Refundable', 0),
('LOS-004', 'Lagos', 'Port Harcourt', 436, 90000, 'Business', 12, '19:00', '20:30', 'Dana Air', 'LOS', 'PHC', 'Refundable', 0),
('LOS-005', 'Lagos', 'Kano', 833, 61000, 'Economy', 16, '08:00', '09:30', 'Azman Air', 'LOS', 'KAN', 'Non-Refundable', 0),
('LOS-006', 'Lagos', 'Kano', 833, 106000, 'Business', 7, '15:00', '16:30', 'Azman Air', 'LOS', 'KAN', 'Refundable', 1),
('PHC-001', 'Port Harcourt', 'Lagos', 436, 48000, 'Economy', 20, '10:00', '11:30', 'Air Peace', 'PHC', 'LOS', 'Non-Refundable', 0),
('PHC-002', 'Port Harcourt', 'Lagos', 436, 88000, 'Business', 15, '17:00', '18:30', 'Air Peace', 'PHC', 'LOS', 'Refundable', 0),
('PHC-003', 'Port Harcourt', 'Abuja', 593, 52000, 'Economy', 22, '14:00', '15:30', 'Dana Air', 'PHC', 'ABV', 'Non-Refundable', 0),
('PHC-004', 'Port Harcourt', 'Abuja', 593, 96000, 'Business', 11, '20:00', '21:30', 'Dana Air', 'PHC', 'ABV', 'Refundable', 0),
('PHC-005', 'Port Harcourt', 'Kano', 762, 56000, 'Economy', 14, '11:00', '12:30', 'Max Air', 'PHC', 'KAN', 'Non-Refundable', 0),
('PHC-006', 'Port Harcourt', 'Kano', 762, 96000, 'Business', 4, '19:00', '20:30', 'Max Air', 'PHC', 'KAN', 'Refundable', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotelbookings`
--

CREATE TABLE `hotelbookings` (
  `bookingID` int(10) NOT NULL,
  `hotelName` varchar(50) NOT NULL,
  `date` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `cancelled` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hotelbookings`
--

INSERT INTO `hotelbookings` (`bookingID`, `hotelName`, `date`, `username`, `cancelled`) VALUES
(44, 'Transcorp Hilton Abuja, Federal Capital Territory,', '25-07-2024', 'MMM', 'yes'),
(45, 'Transcorp Hilton Abuja, Federal Capital Territory,', '26-07-2024', 'MMM', 'no'),
(46, 'Tahir Guest Palace,  Ibrahim Natsugune Road,, Kano', '26-07-2024', 'MMM', 'no'),
(47, 'Tahir Guest Palace,  Ibrahim Natsugune Road,, Kano', '26-07-2024', 'MMM', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotelID` int(10) NOT NULL,
  `hotelName` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `locality` varchar(50) NOT NULL,
  `stars` int(5) NOT NULL,
  `rating` varchar(5) NOT NULL,
  `hotelDesc` varchar(1000) NOT NULL,
  `checkIn` varchar(6) NOT NULL,
  `checkOut` varchar(6) NOT NULL,
  `price` int(10) NOT NULL,
  `roomsAvailable` int(5) NOT NULL,
  `wifi` varchar(5) NOT NULL,
  `swimmingPool` varchar(5) NOT NULL,
  `parking` varchar(5) NOT NULL,
  `restaurant` varchar(5) NOT NULL,
  `laundry` varchar(5) NOT NULL,
  `cafe` varchar(5) NOT NULL,
  `mainImage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotelID`, `hotelName`, `city`, `locality`, `stars`, `rating`, `hotelDesc`, `checkIn`, `checkOut`, `price`, `roomsAvailable`, `wifi`, `swimmingPool`, `parking`, `restaurant`, `laundry`, `cafe`, `mainImage`) VALUES
(1, 'Transcorp Hilton Abuja', 'Abuja', 'Federal Capital Territory', 5, '4.6', ' A luxury hotel located in the heart of Abuja, offering premium rooms and suites, multiple dining options, a pool, spa, and fitness center.', '14:00', '00:00', 155000, 120, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/f0/4a/57/hotel-exterior.jpg?w=700&h=-1&s='),
(2, 'Sheraton Hotel', 'Abuja', ' ladi Kwali St', 4, '4.2', 'Known for its convenient location and extensive amenities, including a swimming pool, restaurants, and conference facilities.', '14:00', '00:00', 116250, 100, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Sheraton%2C_Abuja.jpg'),
(3, 'Nordic Hotel Abuja', 'Abuja', 'Shehu Yaradua Wy, Mabushi', 4, '4.5', 'A boutique hotel offering modern and stylish accommodations with a Scandinavian design. Features include a pool, bar, and garden.', '14:00', '00:00', 77500, 50, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/85/13/30/nordic-hotel.jpg?w=700&h=-1&s=1'),
(4, 'Fraser Suites Abuja', 'Abuja', 'Leventis Close, Central Business District', 5, '4.8', ': Offers luxury serviced apartments with kitchen facilities, ideal for long stays. Amenities include a pool, gym, and restaurant.', '14:00', '00:00', 193750, 70, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://www.comabuja.com/data/Photos/OriginalPhoto/15463/1546368/1546368667/photo-abuja-7.JPEG'),
(5, 'The Envoy Hotel', 'Abuja', 'Diplomatic Dr, Central Business District', 5, '4.7', 'A modern hotel located in the diplomatic district, offering elegant rooms, a pool, a fitness center, and international dining.', '14:00', '00:00', 116250, 60, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://theenvoyabuja.com/img/about/banner-mobile.jpg'),
(6, 'Le Méridien Ogeyi Place', 'Port Harcourt', 'Tombia Tombia St, UmuemeSt, Umueme', 4, '4.3', 'Situated in the GRA Phase II district, this hotel offers a blend of traditional and modern luxury, with a pool, gym, and restaurant', '14:00', '00:00', 116250, 50, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//hotelier-images/45/2a/9f2b'),
(7, 'Novotel Port Harcourt', 'Port Harcourt', 'Stadium Rd, Rumuomas', 4, '4.0', 'A mid-range hotel offering comfortable rooms, a pool, fitness facilities, and dining options.', '14:00', '00:00', 77500, 60, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://x.cdrst.com/foto/hotel-sf/91b9a/granderesp/novotel-port-harcourt-general-1219e23c.jpg'),
(8, 'Swiss International Mabisel', 'Port Harcourt', ' Mabisel Avenue, Off Peter Odili Rd', 4, '4.4', ' Features contemporary rooms, a wellness center, pool, and multiple dining options. Located close to business areas.', '14:00', '00:00', 93000, 40, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://swissinternationalhotels.com/wp-content/uploads/2022/02/New-Exterior-Image3-1-scaled.jpg'),
(9, 'Golden Tulip Port Harcourt', 'Port Harcourt', ' Phase 2, 1c Evo Road, GRA,', 4, '4.1', 'Offers a mix of luxury and business-friendly facilities, including meeting rooms, a pool, and a restaurant.', '14:00', '00:00', 100750, 50, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/30/da/f3/home-away-from-home.jpg?w=700&h='),
(10, 'Presidential Hotel', 'Port Harcourt', ' Birabi Street, Port Harcourt - Aba Expy', 5, '4.5', 'Known for its extensive conference facilities, luxury accommodations, pool, and spa. Ideal for business and leisure travelers.', '14:00', '00:00', 193750, 80, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://content.r9cdn.net/rimg/himg/f2/e1/7b/expedia_group-417063-197206557-902892.jpg?width=500&hei'),
(11, 'Bristol Palace Hotel', 'Kano', 'Guda Abdullahi Rd, Street,', 4, '4.4', 'Offers upscale accommodations with modern amenities, including a pool, fitness center, and restaurant.', '14:00', '00:00', 100750, 70, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://bristolpalacehotel.ng/storage/app/uploads/public/626/126/727/626126727a1a7714830683.jpg'),
(12, 'Grand Central Hotel', 'Kano', 'grand central hotel, Bompai Rd, Nassarawa,', 3, '3.9', ' Centrally located, providing comfortable rooms with basic amenities and a restaurant.', '14:00', '00:00', 54250, 60, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/72/c6/d8/central-hotel.jpg?w=700&h=-1&s=1'),
(13, 'Prince Hotel Kano', 'Kano', 'Tamandu Road, off Audu Bako Way', 3, '4.0', ' Known for its friendly service and comfortable accommodations, with amenities including a pool and restaurant.', '14:00', '00:00', 62000, 50, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/66/9e/a8/prince-hotel.jpg?w=700&h=-1&s=1'),
(14, 'Tahir Guest Palace', 'Kano', ' Ibrahim Natsugune Road,', 4, '4.3', 'Offers a blend of traditional hospitality and modern comfort, featuring a pool, gym, and conference facilities.', '14:00', '00:00', 93000, 80, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://c.otcdn.com/imglib/hotelfotos/8/614/hotel-tahir-guest-palace-kano-20231228222934228300.jpg'),
(15, 'Eko Hotels & Suites', 'Lagos', 'Adetokunbo Ademola Street, Victoria Island', 5, '4.5', 'Located in Victoria Island, offering luxury accommodations with multiple restaurants, pools, and a spa.', '14:00', '00:00', 116250, 100, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/91/a3/4d/eko-main-building.jpg?w=700&h=-1'),
(16, 'Radisson Blu Anchorage Hotel', 'Lagos', ' Victoria Island', 5, '4.6', 'Situated along the Lagos Lagoon, known for its contemporary design, pool, and excellent dining options.', '14:00', '00:00', 155000, 90, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/321442003.jpg?k=87c5a2d2a903b4657a44b0a59b8a7b'),
(19, 'The Federal Palace Hotel & Casino', 'Lagos', 'Victoria Island', 4, '4.3', ' Offers a mix of business and leisure facilities, including a casino, pool, and restaurants.', '14:00', '00:00', 139500, 70, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://photos.book5star.com/photos/1057/2443754_150_z.jpg'),
(20, 'Lagos Continental Hotel', 'Lagos', 'Victoria Island', 5, '4.5', 'Known for its panoramic views of the city and lagoon, offering luxury rooms, a pool, and multiple dining options.', '14:00', '00:00', 170500, 80, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://media.premiumtimesng.com/wp-content/files/2019/12/Lagos-Continental-Hotel.jpg'),
(21, 'Sheraton Lagos Hotel', 'Lagos', 'Ikeja', 4, '4.2', ' Offers comfortable accommodations with a pool, gym, and restaurants, located near Murtala Muhammed International Airport.', '14:00', '00:00', 116250, 100, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/15/44/f5/exterior.jpg?w=700&h=-1&s=1'),
(22, 'Asaa Pyramid Hotel', 'Kaduna', 'City Centre,', 4, '4.0', ' Offers comfortable rooms and suites with modern amenities, a pool, gym, and dining options.', '14:00', '00:00', 77500, 50, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'https://pix10.agoda.net/hotelImages/6994929/-1/6ddf04b7835abc7601ea6bb9459beac9.jpg?ca=8&ce=1&s=414x');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(10) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `EMail` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `EMail`, `Phone`, `Username`, `Password`, `AddressLine1`, `AddressLine2`, `City`, `State`, `Date`) VALUES
(18, 'khalifa muhammad', 'khalifa@gmail.com', '070419666', 'MMM', '$2a$08$ltm36wDHQioAyuGOka/aW.nSBPRA9GJ4bdfQzxwnMrHdE8WDxdb1C', 'layout', 'layout', 'katsina', 'katsina', 'Thursday 25th of July 2024 at 09:10:46 AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `flightbookings`
--
ALTER TABLE `flightbookings`
  ADD PRIMARY KEY (`bookingID`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_no`);

--
-- Indexes for table `hotelbookings`
--
ALTER TABLE `hotelbookings`
  ADD PRIMARY KEY (`bookingID`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotelID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flightbookings`
--
ALTER TABLE `flightbookings`
  MODIFY `bookingID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `hotelbookings`
--
ALTER TABLE `hotelbookings`
  MODIFY `bookingID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotelID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
