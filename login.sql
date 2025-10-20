-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2025 at 05:03 PM
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
-- Database: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `address`, `street`, `city`, `state`, `pincode`, `landmark`) VALUES
(2, 'dzhjdhd', 'jdjhdcxjkdj', 'kjkdzhjdz', 'ghyt', 23698752, 'fdff'),


-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `price` int(10) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `ip_address`, `product_image`, `price`, `name`) VALUES
(24, 18, 62, 1, '::1', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `comments` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `rating`, `comments`, `submission_date`) VALUES
(1, 'Hetal', 'hetaljsolanki01@gmail.com', 5, 'hello', '2025-03-14 16:01:12'),
(2, 'gayatri', 'gayatri@gmail.com', 4, 'it is amamzing and easy to use', '2025-03-14 16:01:52'),


-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  `image_path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `image_path`) VALUES
(1, 'agarbatti', 20, 'this is the product 1', 'https://mangalbhawan.com/public/uploads/all/iNmBDNikuIREOnkTq8XLV91vAwHPha0Zzo6Cucm3.jpg'),
(2, 'floor cleaner', 100, 'this is product 2', 'https://tse1.mm.bing.net/th?id=OIP.Qp7i20NjsETPzSIpEHUOrwHaEK&pid=Api&P=0&h=220'),
(3, 'glass cleaner', 200, 'this is the glass cleaner', 'https://m.media-amazon.com/images/I/91ikgzR3QvL._SL1500_.jpg'),
(4, 'room freshner', 1000, 'this is the room freshner', 'https://images-na.ssl-images-amazon.com/images/I/81p3U14tuzL._AC_SL700_.jpg'),
(5, 'Bidet Toilet Attachment', 2000, 'this is the toilate attachement', 'https://www.sheknows.com/wp-content/uploads/2020/03/luxe-bidet-toilet-seat-attachment-amazon.jpg?w=1024'),
(6, 'Anti-Fatigue Floor Mat\r\n', 2000, 'this is the floor mat', 'https://tse1.mm.bing.net/th?id=OIP.BfgN71gvXCMsLoZNq0uI8AHaHa&pid=Api&P=0&h=220'),
(7, 'Motion-Sensor Nightlights\r\n', 2121, 'this is the nightlights product', 'https://lightcheckup.com/wp-content/uploads/2023/06/Motion-Sensor-Night-Light.jpg'),
(8, 'dustbin', 2211, 'this is the dust bin', 'https://tse2.mm.bing.net/th?id=OIP.zaJek_y51xL5W14IYSgrVAHaJW&pid=Api&P=0&h=220');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `name`, `description`, `price`, `image_path`, `stock_quantity`) VALUES
(1, NULL, 'Aloe Bright Bar', 'Formulated with natural ingredients beneficial for grease.', 195.00, '/herbal/aloesoap.jpg', NULL),
(2, NULL, 'Glass Cleaner', 'It is beneficial for removes all kinds of stains, scratches or dark spots', 135.00, '/herbal/cleaning-3977589_1920.jpg', NULL),
(3, NULL, 'Nirogya Agarbatti', 'Made with camphor & cloves having religious practices like pooja.', 60.00, '/herbal/agarbatti.jpg', NULL),
(4, NULL, 'Detergent Powder', 'Lime & Neem helps to remove tough stains.', 195.00, '/herbal/powder.jpg', NULL),
(5, NULL, 'Steel Lunchbox', 'Keeps the food in eatable condition for a long time.', 650.00, '/herbal/lunch-box-749367_1920.jpg', NULL),
(6, NULL, 'Utensil Cleaner', 'Leaves no scratches or residue on the utensils.', 120.00, '/herbal/utensilcleaner.jpg', NULL),
(7, NULL, 'Glass Cleaner', 'The eco-friendly Glass Cleanser gives a fresh swipe to all the glass.', 135.00, '/herbal/glasscleaner.jpg', NULL),
(8, NULL, 'Neem Dhoop Stick', 'Can use these herbal sticks while meditating or relaxing.', 35.00, '/herbal/dhoop.jpg', NULL),
(9, 'Herbal', 'Anti-Hairfall Shampoo', 'This excellent shampoo makes the hair clean, strong and shiny.', 265.00, 'herbal/shampoo2.jpg', NULL),
(10, 'Herbal', 'Repellent Cream', 'Offers an effective protection from mosquitoes that spread diseases.', 105.00, 'herbal/cream.jpg', NULL),
(11, 'Herbal', 'Icy Hair Oil', 'This oil can help revitalise you by eradicating stress.', 180.00, 'herbal/hairoil.jpg', NULL),
(12, 'Herbal', 'Charcoal Dental Gel', 'Helps in preventing and mitigating bad odour and infections.', 170.00, 'herbal/charcoal.jpg', NULL),
(13, 'Herbal', 'Unisex Deodorant', 'Ozone friendly and containing no gas. It keeps fragrance alive and is skin-friendly.', 250.00, 'herbal/perfume.jpg', NULL),
(14, 'Herbal', 'Pocket Perfume', 'Fight body odour but also boosts your morale and uplifts your confidence level.', 105.00, 'herbal/pocketperfume.jpg', NULL),
(15, 'Herbal', 'Henna Powder', 'Sustainable solution to common hair problems like dryness, dullness, dandruff, itchy scalp.', 130.00, 'herbal/henna.jpg', NULL),
(16, 'Herbal', 'Ayurvedic Soap', 'Makes the skin refreshing and invigorating. Experience youthful, fresh and clear skin.', 75.00, 'herbal/aloesoap.jpg', NULL),
(17, 'Herbal', 'Herbal Aloe Vita', 'Fulfills vitamins & minerals deficiencies, improves fertility, productivity, accelerates growth', 300.00, 'herbal/aloe vita.jpg', NULL),
(18, 'Herbal', 'Herbal Aloe Vical', 'It is helpful in making bones strong in growing animals & increases milk production.', 725.00, 'herbal/aloe vical.jpg', NULL),
(19, 'Agriculture', 'Agro Growth Booster', 'Made with camphor & cloves having religious practices like pooja & hawan', 450.00, 'herbal/booster.jpg', NULL),
(20, 'Agriculture', 'Flower Kare', 'Helps in protecting seeds from pests and diseases grown out of land.', 695.00, 'herbal/seedssss.jpg', NULL),
(21, 'Agriculture', 'Hydrogel', 'Biodegradable absorbent polymer enriched with potassium. Maintains humidity in farms.', 1640.00, 'herbal/hydrogel.jpg', NULL),
(22, 'Agriculture', 'Activator', 'It activates the spray fluid to moisten the leaf surface, uniform spreading.', 650.00, 'herbal/activator.jpg', NULL),
(23, 'Agriculture', 'Promoter Granules', 'Prepared with unique mixture of natural sources, this product is highly beneficial for crops.', 500.00, 'herbal/granule.jpg', NULL),
(24, 'Agriculture', 'Seed Kare', 'It helps in protecting seeds from the pests and diseases grown out of land.', 450.00, 'herbal/seed.jpg', NULL),
(25, 'Baby Care', 'Aloe Talcum Powder', 'It keeps the skin hydrated, fresh and odorless.', 225.00, 'herbal/aloetalcum.webp', NULL),
(26, 'Baby Care', 'Moisturizing Lotion', 'It is an effective product for the delicate skin of the baby.', 275.00, 'herbal/lotion.jpg', NULL),
(27, 'Baby Care', 'Baby Skin Bar', 'Provides the baby’s skin with all the essential nourishing.', 105.00, 'herbal/babysoap.jpg', NULL),
(28, 'Baby Care', 'Baby Wipes', 'It keeps the baby happier and healthier.', 250.00, 'herbal/wipes.jpg', NULL),
(29, 'Baby Care', 'Massage Oil', 'Product that brings strength, protection, and hydration to fragile skin of babies.', 365.00, 'herbal/massageoil.jpg', NULL),
(30, 'Baby Care', 'Baby Hair & Body Wash', 'It helps shield the baby’s body with a layer of protection and washes off attracted germs.', 285.00, 'herbal/shampoo.jpg', NULL),
(31, 'Baby Care', 'Bal Shakti Tonic', 'It catalyzes the development of the child’s mental and physical systems.', 225.00, 'herbal/tonic.jpg', NULL),
(32, 'Baby Care', 'ToothPaste for Babies', 'Fluoride-free ingredients to safely introduce oral hygiene habits.', 100.00, 'herbal/toothbrush.jpg', NULL),
(33, 'Books & Guides', 'Business Plan', 'It describes company\'s core business activities, objectives, plans and guidelines.', 300.00, 'herbal/busniness.jpg', NULL),
(34, 'Books & Guides', 'Rog Nidan', 'Absolutely a ready reckoner to fight with ailments and to live a healthy life.', 100.00, 'herbal/rognidan.jpg', NULL),
(35, 'Books & Guides', 'Karo Ya Maro', 'Highly inspirational, each and every word has the power to encourage you.', 495.00, 'herbal/karoyamaro.jpg', NULL),
(36, 'Books & Guides', 'Executive Diary', 'Executive Diary, a perfect companion for you all around the year.', 295.00, 'herbal/executive.jpg', NULL),
(37, 'Books & Guides', 'Product Guide', 'Detailed information and description of SavvyShopper products.', 50.00, 'herbal/productguide.jpg', NULL),
(38, 'Books & Guides', 'Product Catalogue', 'Includes detailed descriptions which help customers understand & evaluate their offerings.', 195.00, 'herbal/productcatalogue.jpg', NULL),
(39, 'Books & Guides', 'A & V Product Catalogue', 'It typically includes information on seeds, fertilizers, pesticides, and other agricultural products.', 250.00, 'herbal/AV.jpg', NULL),
(40, 'Books & Guides', 'Mini Product Catalogue', 'Concise version of a full-fledged catalogue, showcasing a smaller selection of products.', 25.00, 'herbal/mini.jpg', NULL),
(41, 'FoodCare', 'Turmeric Powder', 'Works wonders for people with acute joint pains, bloating.', 77.00, 'herbal/haldi.jpg', NULL),
(42, 'FoodCare', 'Dhania Powder', 'Does not contain synthetic color or preservatives.', 55.00, 'herbal/dhania.jpg', NULL),
(43, 'FoodCare', 'Anti-Oxidant Tea', 'Help eliminate several health disorders and keep you fit.', 165.00, 'herbal/antioxidant.jpg', NULL),
(44, 'FoodCare', 'Green Tea With Berry & Herbs', 'Packed in tea bags it is quite easy to prepare.', 200.00, 'herbal/greentea.jpg', NULL),
(45, 'FoodCare', 'Green Chilli Pickle', 'Green Chilli Pickle will definitely get the taste buds tickled.', 120.00, 'herbal/chillipickle.jpg', NULL),
(46, 'FoodCare', 'Channa Masala Powder', 'Traditional Indian Seasoning used for chickpeas dishes.', 115.00, 'herbal/channamasala.jpg', NULL),
(47, 'FoodCare', 'Mix Berry Jam', 'Berry Jam is not merely a good stuff to take with bread.', 135.00, 'herbal/berryjam.jpg', NULL),
(48, 'Spices & Condiments', 'Garam Masala Powder', 'Builds immunity, Relieves pain and inflammation.', 130.00, 'herbal/garammasala.jpg', NULL),
(49, 'Health', 'Shri Tulsi', 'It is beneficial for more than 200 diseases like cold, digestive problems etc.', 200.00, 'herbal/tulsi-1539181_1920.jpg', NULL),
(50, 'Personal Care', 'Aloe Digest', 'Helps you to retrieve from digestive disorders like cramps, vomiting, acidity.', 185.00, 'herbal/capsules-1079838_1920.jpg', NULL),
(51, 'Personal Care', 'Plus Eyedrop', 'Prevents from various eye damages such as myopia, cataract, maintains a healthy retina, hypermetropia.', 125.00, 'herbal/test-tube-5065418_1920.jpg', NULL),
(52, 'Health', 'Noni Juice', 'Controls blood sugar & bad cholesterol in cases of weight loss, irregular menstruation.', 650.00, 'herbal/orange juice.jpg', NULL),
(53, 'Health', 'Berry Juice', 'Regulates cholesterol level and aids in weight loss by enhancing metabolism.', 675.00, 'herbal/blueberry-2350367_1920.jpg', NULL),
(54, 'Health', 'Shri Haldi', 'Forces the poisonous substances from existing in your body to come out.', 195.00, 'herbal/turmeric.jpg', NULL),
(55, 'Personal Care', 'Sugar Tablets', 'Fortified with Aloevera, Karela, Leh Berry, Giloy etc.', 825.00, 'herbal/sugar.jpg', NULL),
(56, 'Health', 'Stress Tablets', 'Enriched with the goodness of essential health beneficial herbs.', 195.00, 'herbal/stress.jpg', NULL),
(57, 'Personal Care', 'Aloe Bright Bar', 'Formulated with natural ingredients beneficial for grease.', 195.00, 'herbal/aloesoap.jpg', NULL),
(58, 'Home Cleaning', 'Glass Cleaner', 'Removes all kinds of stains, scratches, or dark spots.', 135.00, 'herbal/cleaning-3977589_1920.jpg', NULL),
(59, 'Home Cleaning', 'Nirogya Agarbatti', 'Made with camphor & cloves, used for religious practices like pooja.', 60.00, 'herbal/agarbatti.jpg', NULL),
(60, 'Home Cleaning', 'Detergent Powder', 'Lime & Neem helps to remove tough stains.', 195.00, 'herbal/powder.jpg', NULL),
(61, 'Kitchen Essentials', 'Steel Lunchbox', 'Keeps the food in eatable condition for a long time.', 650.00, 'herbal/lunch-box-749367_1920.jpg', NULL),
(62, 'Home Cleaning', 'Utensil Cleaner', 'Leaves no scratches or residue on the utensils.', 120.00, 'herbal/utensilcleaner.jpg', NULL),
(63, 'Home Cleaning', 'Glass Cleaner', 'The eco-friendly Glass Cleanser gives a fresh swipe to all the glass.', 135.00, 'herbal/glasscleaner.jpg', NULL),
(64, 'Home Cleaning', 'Neem Dhoop Stick', 'Can use these herbal sticks while meditating or relaxing.', 35.00, 'herbal/dhoop.jpg', NULL),
(65, 'Health', 'Shri Tulsi', 'Beneficial for more than 200 diseases like cold, digestive problems, purifies water, etc.', 200.00, 'herbal/tulsi-1539181_1920.jpg', NULL),
(66, 'Health', 'Aloe Digest', 'Helps retrieve from digestive disorders like cramps, vomiting, stomachache, acidity.', 185.00, 'herbal/digest.jpg', NULL),
(67, 'Health', 'Plus Eyedrop', 'Prevents various eye damages such as myopia, cataract, maintains a healthy retina, hypermetropia.', 125.00, 'herbal/eyedrop.jpg', NULL),
(68, 'Health', 'Noni Juice', 'Controls blood sugar & bad cholesterol in cases of weight loss, irregular menstruation.', 650.00, 'herbal/noni.jpg', NULL),
(69, 'Health', 'Berry Juice', 'Regulates cholesterol level & aids in weight loss by high metabolism.', 675.00, 'herbal/berry smoothie.jpg', NULL),
(70, 'Personal Care', 'Vicco Turmeric', 'Forces the poisonous substances to come out of your body.', 195.00, 'herbal/turmeric.jpg', NULL),
(71, 'Personal Care', 'Aloeberry Cream', 'Keeps the skin spot-free and super soft. It makes the skin shine.', 40.00, 'herbal/aloeberry.jpg', NULL),
(72, 'Personal Care', 'Cleansing Milk', 'For softer & cleansed skin for calm, beautiful radiant & healthy skin.', 50.00, 'herbal/cleansingmilk.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `referral_code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `user_id`, `referral_code`, `created_at`) VALUES
(1, 0, '8sG0IPYS', '2025-03-21 16:04:15'),
(2, 0, 'nXVCbalf', '2025-03-21 16:04:16'),
(3, 0, 'KE4F7lAy', '2025-03-21 16:05:10'),
(4, 123, 'zZdQo10z', '2025-03-21 16:05:30'),
(5, 0, 'jeyO2Sj5', '2025-03-22 10:18:14'),
(6, 0, 'LaOyMn9K', '2025-03-22 10:18:28'),
(7, 0, 'Pmxz5UkK', '2025-03-22 10:18:51'),
(8, 0, 'XCvmGsY9', '2025-03-22 10:19:06'),
(9, 0, '8VGB8RjS', '2025-03-22 10:19:13'),
(10, 0, 'rEqlaJgv', '2025-03-22 10:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `nominee_name` varchar(255) DEFAULT NULL,
  `nominee_relation` varchar(255) DEFAULT NULL,
  `pan_number` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `dob`, `username`, `email`, `age`, `phone_number`, `nominee_name`, `nominee_relation`, `pan_number`, `address`, `password`, `gender`) VALUES
(17, 'ddd', 'ddd', 'dddd', '2003-11-12', 'ddd', 'dddd', 12, '2235485888', 'ddddddddddd', 'dddddd', 'fdfdf', 'dddd', '000', 'prefer_not'),
(18, 'tanvi', 'suresh', 'shriyan', '2004-08-04', 'tanvi20', 'tanvi81@gmail.com', 22, '9876543210', 'suresh', 'father', 'hdfsg5234d', 'xc d', '111', 'female'),
(19, 'ffffff', 'fffffffffff', 'fffffffffff', '2006-12-02', 'fdrdfvdr', 'ffffffff', 19, '3333333333', 'cxv fz', 'vcxfrf', 'dsvcxsdvcs', 'ascecasz', '111', 'prefer_not'),
(20, 'jinu', 'jay', 'bhul', '2004-12-14', 'jinu_20', 'jinujaybul@gmail.com', 20, '9876543210', 'jay', 'son', 'HGFDE3564J', 'borivali', '98765432', 'male'),
(21, 'khushi', 'jaynil', 'chavda', '2006-11-03', 'khushijaynil11', 'khushijaynil@gmail.com', 18, '1234567890', 'jaynil', 'wife', 'HGFDR2365K', 'delhi', 'khushi@@123', 'female'),
(22, 'eee', 'eee', 'eee', '2002-11-07', 'eee', 'eee@gmail.com', 22, '7900139238', 'eee', 'eee', 'HGFRE5689S', 'eee', '12345678', 'female'),
(23, 'eeed', 'eeed', 'eee', '2002-11-07', 'eeewww', 'eewwwe@gmail.com', 22, '7900139238', 'eee', 'eee', 'HGFRE5689E', 'eee', '12345678', 'female'),
(24, 'eeedee', 'eeedrrr', 'eeehhh', '2002-11-07', 'eeewwwrr', 'eewwrrwe@gmail.com', 22, '7900139238', 'eee', 'eee', 'HGFRE5089E', 'eee', '12345678', 'female'),
(26, 'hetal', 'jayesh', 'solanki', '2002-11-07', 'hetal_11', 'hetalproject11@gmail.com', 25, '7900139238', 'jayesh', 'daughter', 'HGFRD1235W', 'Borivali', '9876543', 'female'),
(27, 'reva', 'sukhdev', 'rampal', '2002-11-07', 'revasukhdev_11', 'revasukhdev@gmail.com', 22, '8828110036', 'sukhdev', 'wife', 'UYHGT2365E', 'Rajasthan', '12345678', 'female'),
(29, 'ddddd', 'reft', 'gth', '2002-11-07', 'hdteg', 'hegtehd@gmail.com', 22, '1234567890', 'gfhh', 'hgt', 'HGEFD1253D', 'hgte', '12345678', 'male'),
(30, 'gtr', 'fgr', 'gt', '2002-11-07', 'hty', 'ghy@gmail.com', 22, '9876543210', 'gfrt', 'gt', 'HDGDF1235E', 'hgty', '12345678', 'prefer_not'),
(32, 'ghtf', 'dgtr', 'fht', '2002-11-02', 'hytty', 'hetaljsolanki01@gmail.com', 23, '7894562345', 'hty', 'hfy', 'GHTED5364E', 'hyte', '12345678', 'female'),
(33, 'harshita', 'ddd', 'ss', '2003-12-08', 'jhjghffgf', 'bfjhdh@gmail.com', 22, '230659876', 'jhsdhjdhj', 'jhhgh', 'HGTS1235H', 'jhbashbjb', '123456', 'female'),
(34, 'ddd', 'dd', 'Hetal', '2001-02-11', 'htjbh66', 'tanvi781@gmail.com', 23, '1236458790', 'hgjuy', 'vxcfdvx', 'DSERE1235W', 'cxfvzc x', '98765432', 'female'),
(35, 'hdvtdv h', 'dvbht vht', 'fbvhdezrh', '2002-11-07', 'ythey11', 'hetalkdhjcd@gmail.com', 22, '7900139238', 'htygert', 'ygdygdgs', 'FGTEF1234T', 'hgdhhd', '12345678', 'female'),
(36, 'cfdc zegr', 'fdxdg', ' xbf bf', '2002-11-02', ' vfd ', ' cvzfd@gmail.com', 23, '7900139238', 'dsvdc v', 'jhxsz', 'GHTYE2365D', 'hjgcjg', '98765432', 'prefer_not'),
(37, 'dchcgjd', 'vsdvd', 'vds dv', '2002-11-02', 'dvs23', 'hetyoudt@gmail.com', 22, '8080499324', 'hgtyref', 'ghyterf', 'GHTED4567W', 'ghytef', '98765432', 'female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"login\",\"table\":\"cart\"},{\"db\":\"login\",\"table\":\"products\"},{\"db\":\"login\",\"table\":\"users\"},{\"db\":\"login\",\"table\":\"product\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-03-23 16:03:02', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
