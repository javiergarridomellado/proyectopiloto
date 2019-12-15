-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-12-2019 a las 16:30:41
-- Versión del servidor: 10.1.43-MariaDB-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectopiloto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fechadealta` datetime NOT NULL,
  `anio` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `director` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci,
  `actores` longtext COLLATE utf8_unicode_ci,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `votaciontotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `usuario_id`, `fechadealta`, `anio`, `nombre`, `director`, `descripcion`, `actores`, `path`, `votaciontotal`) VALUES
(8, NULL, '2019-12-14 20:53:05', 1992, 'Desafio Total', 'Spielberg', 'pelicula de accion', 'Swarzenagger', '8-73.jpg', 7.5),
(9, NULL, '2019-12-15 11:52:29', 1945, '2d00f43f07911355d4151f13925ff292', '0f46c64b74a6c964c674853a89796c8e', 'pelicula de prueba', '7b4c1f1b8d265b23fe6013bc9e739f1b', '9.jpg', 4),
(10, NULL, '2019-12-15 11:52:29', 1927, 'e5b294b70c9647dcf804d7baa1903918', '2ecd2bd94734e5dd392d8678bc64cdab', 'pelicula de prueba', '03765dca976a78d7009fe0e38782c4ae', '10.jpg', 5.5),
(11, NULL, '2019-12-15 11:52:30', 1949, '36ac8e558ac7690b6f44e2cb5ef93322', 'ec8b57b0be908301f5748fb04b0714c7', 'pelicula de prueba', 'f4229e0ca72d200e4f31816c7d30f8e2', '11.jpg', 6.5),
(12, NULL, '2019-12-15 11:52:30', 1974, '3d863b367aa379f71c7afc0c9cdca41d', 'd38ee19a4815c4aeba48227913092a6e', 'pelicula de prueba', '2a0fafc3574be483dd5b1c15c322a234', '12.jpg', 5.5),
(13, NULL, '2019-12-15 11:52:30', 1993, 'c5a4e7e6882845ea7bb4d9462868219b', 'a8ef1979aeec2737ae3830ec543ed0df', 'pelicula de prueba', '8f05f0ef490352472eb985eb9650bbe9', '13.jpg', 3.5),
(14, NULL, '2019-12-15 11:52:30', 1968, '98c7242894844ecd6ec94af67ac8247d', 'f95ec3de395b4bce25b39ef6138da871', 'pelicula de prueba', '67f22a489c5e6699f2c64eb45d81b486', '14.jpg', 4.5),
(15, NULL, '2019-12-15 11:52:30', 1943, 'c3395dd46c34fa7fd8d729d8cf88b7a8', '429e4a44bec547a527df987730b19aab', 'pelicula de prueba', '0ab273154514a9f471653d2ea5677426', '15.jpg', 5),
(16, NULL, '2019-12-15 11:52:30', 1988, '9d7311ba459f9e45ed746755a32dcd11', '1138d90ef0a0848a542e57d1595f58ea', 'pelicula de prueba', 'b198378623418756a65be01e2559d1bb', '16.jpg', 6.5),
(17, NULL, '2019-12-15 11:52:30', 1942, '519c84155964659375821f7ca576f095', '635440afdfc39fe37995fed127d7df4f', 'pelicula de prueba', '4d387590ca8bb25130b5b1d9b35358fc', '17.jpg', 7.5),
(18, NULL, '2019-12-15 11:52:30', 1946, '1f71e393b3809197ed66df836fe833e5', '68abef8ee1ac9b664a90b0bbaff4f770', 'pelicula de prueba', 'de353d9e1716d28025f9ab718d409932', '18.jpg', 5.5),
(19, NULL, '2019-12-15 11:52:30', 2017, '8d8818c8e140c64c743113f563cf750f', '8e0384779e58ce2af40eb365b318cc32', 'pelicula de prueba', '85ff0457ff952bd23e90db8a94bb0182', '19.jpg', 3.5),
(20, NULL, '2019-12-15 11:52:30', 1971, 'de73998802680548b916f1947ffbad76', 'ac4e7a4f341e7281b0f6f274f9ec3905', 'pelicula de prueba', '797f3f9a00f9bc59a48ff0be0452770f', '20.jpg', 8),
(21, NULL, '2019-12-15 11:52:31', 1925, '0950ca92a4dcf426067cfd2246bb5ff3', '8cb94e7a9661ea20b1293c589216d396', 'pelicula de prueba', '95dedabafd2246f8b8fb01a3ba6fac21', '21.jpg', 5.5),
(22, NULL, '2019-12-15 11:52:31', 1921, '9f6992966d4c363ea0162a056cb45fe5', '6abcc8f24321d1eb8c95855eab78ee95', 'pelicula de prueba', '4bd618f68e7503999a8f1a3424801c53', '22.jpg', 1.5),
(23, NULL, '2019-12-15 11:52:31', 1998, 'c5b2cebf15b205503560c4e8e6d1ea78', 'c2ba1bc54b239208cb37b901c0d3b363', 'pelicula de prueba', '64a2798ef78b39b5c2116c2f15f2ebb3', '23.jpg', 5.5),
(24, NULL, '2019-12-15 11:52:31', 1962, '95f6870ff3dcd442254e334a9033d349', 'cbf8710b43df3f2c1553e649403426df', 'pelicula de prueba', '6a9e158bf2fce48601487ec1c1d218a0', '24.jpg', 7.5),
(25, NULL, '2019-12-15 11:52:31', 1956, 'e3408432c1a48a52fb6c74d926b38886', '34306d99c63613fad5b2a140398c0420', 'pelicula de prueba', '575fcb345085f65d72067271e3768616', '25.jpg', 2),
(26, NULL, '2019-12-15 11:52:31', 1947, 'de03beffeed9da5f3639a621bcab5dd4', '63bfd6e8f26d1d3537f4c5038264ef36', 'pelicula de prueba', 'd8558cdb2f036224c0a1e00ccff24bc6', '26.jpg', 3),
(27, NULL, '2019-12-15 11:52:31', 1954, '5a7f963e5e0504740c3a6b10bb6d4fa5', '586f9b4035e5997f77635b13cc04984c', 'pelicula de prueba', 'dfc4cfef9f019064b964d1b73480bc95', '27.jpg', 3.5),
(28, NULL, '2019-12-15 11:52:31', 1969, '4d8556695c262ab91ff51a943fdd6058', 'eb76c035d5d0a2bd2a0d0834b93c9c26', 'pelicula de prueba', '5d7f5dda82f5ef2ac33d8b99eea2a77a', '28.jpg', 6.5),
(29, NULL, '2019-12-15 11:52:31', 1964, '39dcaf7a053dc372fbc391d4e6b5d693', 'aa6b7ad9d68bf3443c35d23de844463b', 'pelicula de prueba', '2c5e2dbdb3027efedad456faa6890eac', '29.jpg', 7.5),
(30, NULL, '2019-12-15 11:52:31', 1951, '6a508a60aa3bf9510ea6acb021c94b48', '16d11e9595188dbad0418a85f0351aba', 'pelicula de prueba', '8df94ad9c226cd9bb990007e4c9a9f53', '30.jpg', 8),
(31, NULL, '2019-12-15 11:52:32', 1935, '8d55a249e6baa5c06772297520da2051', '6950aa02ae8613af620668146dd11840', 'pelicula de prueba', 'cc4b0ef481f3a736ad91637271331afa', '31.jpg', 4),
(32, NULL, '2019-12-15 11:52:32', 1974, '3d863b367aa379f71c7afc0c9cdca41d', '0233f3bb964cf325a30f8b1c2ed2da93', 'pelicula de prueba', 'e8e292b311e36f56b994516115cfa304', '32.jpg', 5),
(33, NULL, '2019-12-15 11:52:32', 2004, 'b8b4b727d6f5d1b61fff7be687f7970f', '3c8a49145944fed2bbcaade178a426c4', 'pelicula de prueba', '085a3efa6a158c0aefce402c2b634208', '33.jpg', 6.5),
(34, NULL, '2019-12-15 11:52:32', 1922, '333222170ab9edca4785c39f55221fe7', '9425be43ba92c2b4454ca7bf602efad8', 'pelicula de prueba', 'e6454240a396d9ef288d6c19cd48420c', '34.jpg', 4),
(35, NULL, '2019-12-15 11:52:32', 1940, '95e6834d0a3d99e9ea8811855ae9229d', '6f1d0705c91c2145201df18a1a0c7345', 'pelicula de prueba', '198c28f217794d066c23cb4b10aaef0f', '35.jpg', 5),
(36, NULL, '2019-12-15 11:52:32', 1989, '4a3e00961a08879c34f91ca0070ea2f5', 'ee8fe9093fbbb687bef15a38facc44d2', 'pelicula de prueba', '2531c727a1db649dba951863bb64c822', '36.jpg', 1.5),
(37, NULL, '2019-12-15 11:52:32', 1941, '7af6266cc52234b5aa339b16695f7fc4', '50a074e6a8da4662ae0a29edde722179', 'pelicula de prueba', '8fa0523553a64364bf6e07231e419895', '37.jpg', 7),
(38, NULL, '2019-12-15 11:52:32', 1986, '8c249675aea6c3cbd91661bbae767ff1', 'e833e042f509c996b1b25324d56659fb', 'pelicula de prueba', '99ae812521e161a0a6ea708cb918ce6f', '38.jpg', 3.5),
(39, NULL, '2019-12-15 11:52:32', 1966, '3683af9d6f6c06acee72992f2977f67e', '8cff9bf6694dccfc3b6a613d05d51d16', 'pelicula de prueba', '1e892dce8007ee7c2349c37fdb591cf0', '39.jpg', 1.5),
(40, NULL, '2019-12-15 11:52:33', 1948, '7ca57a9f85a19a6e4b9a248c1daca185', '60a70bb05b08d6cd95deb3bdb750dce8', 'pelicula de prueba', '4a123b1387e6f6939176250cafd8a333', '40.jpg', 5.5),
(41, NULL, '2019-12-15 11:52:33', 1951, '6a508a60aa3bf9510ea6acb021c94b48', 'cfbc6c5cfb8a3e10fab12aa3512153df', 'pelicula de prueba', 'ca903ab57e15e0cfbc37913cd44087a7', '41.jpg', 5),
(42, NULL, '2019-12-15 11:52:33', 1972, 'c4de8ced6214345614d33fb0b16a8acd', '3e77a14629775492504515dc4b23deda', 'pelicula de prueba', '547c0202f025920dc9ee90664abd4c3f', '42.jpg', 5.5),
(43, NULL, '2019-12-15 11:52:33', 1994, '008bd5ad93b754d500338c253d9c1770', 'f3b7e5d3eb074cde5b76e26bc0fb5776', 'pelicula de prueba', '21310f7841a900ab77908824f3a5e495', '43.jpg', 8.5),
(44, NULL, '2019-12-15 11:52:33', 1923, '414e773d5b7e5c06d564f594bf6384d0', 'f14bc21be7eaeed046fed206a492e652', 'pelicula de prueba', '1a1aeb00db699e23541bfecb59cda08d', '44.jpg', 2),
(45, NULL, '2019-12-15 11:52:33', 2015, '65d2ea03425887a717c435081cfc5dbb', '59112692262234e3fad47fa8eabf03a4', 'pelicula de prueba', 'bba70dfb84ef42a733a1704f83b38550', '45.jpg', 1.5),
(46, NULL, '2019-12-15 11:52:34', 1943, 'c3395dd46c34fa7fd8d729d8cf88b7a8', '0fd4b8a8354a77a3fa75e3d97e7a34e6', 'pelicula de prueba', '63d61e03aa82ee6775fd62ca68c2936e', '46.jpg', 6),
(47, NULL, '2019-12-15 11:52:34', 1958, 'd77f00766fd3be3f2189c843a6af3fb2', 'c2964caac096f26db222cb325aa267cb', 'pelicula de prueba', '1d46b2a47a86bc795c0cfed081b4fd0f', '47.jpg', 7.5),
(48, NULL, '2019-12-15 11:52:34', 2003, 'a591024321c5e2bdbd23ed35f0574dde', 'dbab2adc8f9d078009ee3fa810bea142', 'pelicula de prueba', 'ec25f6f5ecfcf61aed8564c3c811f62e', '48.jpg', 5),
(49, NULL, '2019-12-15 11:52:34', 1941, '7af6266cc52234b5aa339b16695f7fc4', '8d6a06b2f1208b59454a9a749928b0c0', 'pelicula de prueba', '90c29f2a0ac256b61ee52896b12f937d', '49.jpg', 2),
(50, NULL, '2019-12-15 11:52:34', 1931, '15d185eaa7c954e77f5343d941e25fbd', 'cbf22ab286e2ad4900bdf5d6a2e47009', 'pelicula de prueba', '300d65b5d7b1d3ec5e8ee03610f84946', '50.jpg', 6.5),
(51, NULL, '2019-12-15 11:52:34', 1973, 'deb54ffb41e085fd7f69a75b6359c989', '2cfa8f9e50e0f510ede9d12338a5f564', 'pelicula de prueba', 'a883251d6db4758e987774a9b508495b', '51.jpg', 7),
(52, NULL, '2019-12-15 11:52:34', 2018, '84ddfb34126fc3a48ee38d7044e87276', '9001ca429212011f4a4fda6c778cc318', 'pelicula de prueba', 'd5a3e2c4784909ce6abdd73109838887', '52.jpg', 8),
(53, NULL, '2019-12-15 11:52:35', 2008, 'ef8446f35513a8d6aa2308357a268a7e', '4ea83d951990d8bf07a68ec3e50f9156', 'pelicula de prueba', 'b63e8add079007f747725c4e263c1547', '53.jpg', 4.5),
(54, NULL, '2019-12-15 11:52:35', 1994, '008bd5ad93b754d500338c253d9c1770', '0e4ceef65add6cf21c0f3f9da53b71c0', 'pelicula de prueba', '643340a1c3f8453ee7e78dc2f775692e', '54.jpg', 8.5),
(55, NULL, '2019-12-15 11:52:35', 1951, '6a508a60aa3bf9510ea6acb021c94b48', '23d2e1578544b172cca332ff74bddf5f', 'pelicula de prueba', '88d073e0007d16dd97f6400eb3fef16b', '55.jpg', 4.5),
(56, NULL, '2019-12-15 11:52:35', 2001, 'd0fb963ff976f9c37fc81fe03c21ea7b', '0cd6a652ed1f7811192db1f700c8f0e7', 'pelicula de prueba', 'dc36d8307966926372d84a0ad73c08b1', '56.jpg', 1.5),
(57, NULL, '2019-12-15 11:52:35', 1923, '414e773d5b7e5c06d564f594bf6384d0', '1d94108e907bb8311d8802b48fd54b4a', 'pelicula de prueba', '3cf0c6e0f1d1f6b5e60d4f443d10746f', '57.jpg', 4.5),
(58, NULL, '2019-12-15 11:52:36', 1923, '414e773d5b7e5c06d564f594bf6384d0', '743394beff4b1282ba735e5e3723ed74', 'pelicula de prueba', '21a6bc9fa3f21548107249b6dc781074', '58.jpg', 8),
(59, NULL, '2019-12-15 11:52:36', 1977, '4afd521d77158e02aed37e2274b90c9c', 'bf499a12e998d178afd964adf64a60cb', 'pelicula de prueba', '640848630ce4c259085346b1a263c1bd', '59.jpg', 9),
(60, NULL, '2019-12-15 11:52:36', 2014, 'cee8d6b7ce52554fd70354e37bbf44a2', '9e406957d45fcb6c6f38c2ada7bace91', 'pelicula de prueba', '87347a8d8064760a35cd059d1d8daa1f', '60.jpg', 1.5),
(61, NULL, '2019-12-15 11:52:36', 1943, 'c3395dd46c34fa7fd8d729d8cf88b7a8', '69f357fcc8e6d119f3d95f33cedb5915', 'pelicula de prueba', '5b597a1fc9ccd5c5b6c662544ff39201', '61.jpg', 5),
(62, NULL, '2019-12-15 11:52:36', 1962, '95f6870ff3dcd442254e334a9033d349', 'f6b5f8c32c65fee991049a55dc97d1ce', 'pelicula de prueba', 'b621d22a6c88bff3bdfb136ccd004034', '62.jpg', 8),
(63, NULL, '2019-12-15 11:52:37', 1971, 'de73998802680548b916f1947ffbad76', '4a8423d5e91fda00bb7e46540e2b0cf1', 'pelicula de prueba', 'd388d6ce9a2b53aa22a0c7dc0cdc78af', '63.jpg', 7),
(64, NULL, '2019-12-15 11:52:37', 1944, '6f2688a5fce7d48c8d19762b88c32c3b', '706608cfdbcc1886bb7eea5513f90133', 'pelicula de prueba', '98972466cccb35b080a704020e2ad7b6', '64.jpg', 3.5),
(65, NULL, '2019-12-15 11:52:37', 1941, '7af6266cc52234b5aa339b16695f7fc4', '229754d7799160502a143a72f6789927', 'pelicula de prueba', '65add4f8f69b2026aa4d9e39c846618f', '65.jpg', 4),
(66, NULL, '2019-12-15 11:52:37', 1972, 'c4de8ced6214345614d33fb0b16a8acd', 'd3157f2f0212a80a5d042c127522a2d5', 'pelicula de prueba', '0154f8be44be8d022e63de8569d85bbb', '66.jpg', 5.5),
(67, NULL, '2019-12-15 11:52:38', 1990, 'dc513ea4fbdaa7a14786ffdebc4ef64e', '211ed78fe91938b90f84a51944b08d5a', 'pelicula de prueba', '76b842667bb8b81a405557b0c2a4dc8f', '67.jpg', 8.5),
(68, NULL, '2019-12-15 11:52:38', 1920, '44968aece94f667e4095002d140b5896', 'ee0b86d2e127f776eaaa97d77e078e41', 'pelicula de prueba', '89ad1e3ed63ad4db6b3fb04249acab6c', '68.jpg', 9),
(69, NULL, '2019-12-15 11:52:38', 1932, '52d2752b150f9c35ccb6869cbf074e48', '475d66314dc56a0df8fb8f7c5dbbaf78', 'pelicula de prueba', 'f61bed4eaec3f183a218c03b072cfebd', '69.jpg', 2),
(70, NULL, '2019-12-15 11:52:38', 1928, '5bce843dd76db8c939d5323dd3e54ec9', '859b00aec8885efc83d1541b52a1220d', 'pelicula de prueba', 'fab63c2a6b8eba3dc8da766e4f677d8f', '70.jpg', 3),
(71, NULL, '2019-12-15 11:52:38', 2007, 'a00e5eb0973d24649a4a920fc53d9564', 'c2e06e9a80370952f6ec5463c77cbace', 'pelicula de prueba', '4855dbb65388fb0b6d8962ad526ad775', '71.jpg', 3.5),
(72, NULL, '2019-12-15 11:52:38', 1988, '9d7311ba459f9e45ed746755a32dcd11', 'a546203962b88771bb06faf8d6ec065e', 'pelicula de prueba', '5f51b05de26327b5c4fc5598c1e37821', '72.jpg', 3.5),
(73, NULL, '2019-12-15 11:52:39', 1946, '1f71e393b3809197ed66df836fe833e5', '9ee70b7987a735c046ac30a1556272c8', 'pelicula de prueba', '5ade5cc335e8e4722d9dcd61b219456c', '73.jpg', 9.5),
(74, NULL, '2019-12-15 11:52:39', 1984, '1b36ea1c9b7a1c3ad668b8bb5df7963f', '4dc3ed26a29c9c3df3ec373524377a5b', 'pelicula de prueba', '0e58d81aacdc0f77107e02b4e46aa26d', '74.jpg', 5),
(75, NULL, '2019-12-15 11:52:39', 2008, 'ef8446f35513a8d6aa2308357a268a7e', 'c2964caac096f26db222cb325aa267cb', 'pelicula de prueba', '1d46b2a47a86bc795c0cfed081b4fd0f', '75.jpg', 5.5),
(76, NULL, '2019-12-15 11:52:39', 1920, '44968aece94f667e4095002d140b5896', '7d265aa7147bd3913fb84c7963a209d1', 'pelicula de prueba', '38945ba7d382ca97bc99429d295db87b', '76.jpg', 4),
(77, NULL, '2019-12-15 11:52:40', 1930, '29530de21430b7540ec3f65135f7323c', '2119b8d43eafcf353e07d7cb5554170b', 'pelicula de prueba', '78c1fd8bde479df114665694e4e4ef0e', '77.jpg', 4),
(78, NULL, '2019-12-15 11:52:40', 1994, '008bd5ad93b754d500338c253d9c1770', '05edf455cb266ccb3ea3ac2715f87326', 'pelicula de prueba', '7d9e165a427f9c09700dbe4a15f559b8', '78.jpg', 4.5),
(79, NULL, '2019-12-15 11:52:40', 1941, '7af6266cc52234b5aa339b16695f7fc4', 'dbb422937d7ff56e049d61da730b3e11', 'pelicula de prueba', '2951fdb690ef0149c1b01a033a7efead', '79.jpg', 6.5),
(80, NULL, '2019-12-15 11:52:40', 2013, '8038da89e49ac5eabb489cfc6cea9fc1', '8e1ad7941398486f8cede7799b886b58', 'pelicula de prueba', '732088dc6c6b16e2f5d021ea1ccfa8cf', '80.jpg', 3),
(81, NULL, '2019-12-15 11:52:40', 1954, '5a7f963e5e0504740c3a6b10bb6d4fa5', '66121d1f782d29b62a286909165517bc', 'pelicula de prueba', 'cc14b4b48d6541bbb6f8fcf84bc37438', '81.jpg', 6),
(82, NULL, '2019-12-15 11:52:41', 1980, 'f80bf05527157a8c2a7bb63b22f49aaa', '0530e22dea41e24a039563139cdc215e', 'pelicula de prueba', 'ad4a924e35d92049f263e92012654a04', '82.jpg', 2.5),
(83, NULL, '2019-12-15 11:52:41', 1998, 'c5b2cebf15b205503560c4e8e6d1ea78', '14f2ebeab937ca128186e7ba876faef9', 'pelicula de prueba', '6c079b336aa4c736e4120932d7848394', '83.jpg', 3.5),
(84, NULL, '2019-12-15 11:52:41', 2007, 'a00e5eb0973d24649a4a920fc53d9564', '2eb5657d37f474e4c4cf01e4882b8962', 'pelicula de prueba', '87022e620a0f7cd259b8871cbef1a13c', '84.jpg', 6),
(85, NULL, '2019-12-15 11:52:42', 1953, 'a38b16173474ba8b1a95bcbc30d3b8a5', 'ca1d3153a1cf0ed998d4879fbb50d9ab', 'pelicula de prueba', 'a2fdaddc819d340fc5c4526f71327965', '85.jpg', 0.5),
(86, NULL, '2019-12-15 11:52:42', 2003, 'a591024321c5e2bdbd23ed35f0574dde', 'a00e5eb0973d24649a4a920fc53d9564', 'pelicula de prueba', '44e0816289072af8a15b75f494506dc2', '86.jpg', 5),
(87, NULL, '2019-12-15 11:52:42', 1993, 'c5a4e7e6882845ea7bb4d9462868219b', '8f125da0b3432ed853c0b6f7ee5aaa6b', 'pelicula de prueba', 'c086743c688090fe502f24b45b7091b6', '87.jpg', 2),
(88, NULL, '2019-12-15 11:52:42', 1990, 'dc513ea4fbdaa7a14786ffdebc4ef64e', 'e97c864e8ac67f7aed5ce53ec28638f5', 'pelicula de prueba', 'e7e1fd7d723fa773234e2c7043207b51', '88.jpg', 2.5),
(89, NULL, '2019-12-15 11:52:43', 1991, '96055f5b06bf9381ac43879351642cf5', 'bf40f0ab4e5e63171dd16036913ae828', 'pelicula de prueba', '0f9fd659145b5de21606576a8d60c1bf', '89.jpg', 6.5),
(90, NULL, '2019-12-15 11:52:43', 1992, 'd5c186983b52c4551ee00f72316c6eaa', '6754e06e46dfa419d5afe3c9781cecad', 'pelicula de prueba', '0558a596a0bda08a949eebbe80c6d776', '90.jpg', 1.5),
(91, NULL, '2019-12-15 11:52:43', 2009, 'f1981e4bd8a0d6d8462016d2fc6276b3', '8217bb4e7fa0541e0f5e04fea764ab91', 'pelicula de prueba', '4e110ff3bf6eb914086246eb8445e150', '91.jpg', 4.5),
(92, NULL, '2019-12-15 11:52:43', 2011, 'c8758b517083196f05ac29810b924aca', 'b837305e43f7e535a1506fc263eee3ed', 'pelicula de prueba', '6f0dafc93a8a9b1b34eafa72775f7aa1', '92.jpg', 3.5),
(93, NULL, '2019-12-15 11:52:43', 1925, '0950ca92a4dcf426067cfd2246bb5ff3', '959ef477884b6ac2241b19ee4fb776ae', 'pelicula de prueba', 'ce959c4c7b0bce41aa8f42574c2516ff', '93.jpg', 9.5),
(94, NULL, '2019-12-15 11:52:43', 2018, '84ddfb34126fc3a48ee38d7044e87276', '79fde5402cbc75ae0615c9ae4c335b46', 'pelicula de prueba', '08a8e0cbb0569bc0717af6662d2aecb9', '94.jpg', 1),
(95, NULL, '2019-12-15 11:52:43', 2012, '253614bbac999b38b5b60cae531c4969', 'ae1eaa32d10b6c886981755d579fb4d8', 'pelicula de prueba', '0edb22392e16be3c8a3783d04043df12', '95.jpg', 6.5),
(96, NULL, '2019-12-15 11:52:43', 1948, '7ca57a9f85a19a6e4b9a248c1daca185', 'f60f6b0d129342bb6a226305aaf842b7', 'pelicula de prueba', 'e4853ea7744b4c1fa919972fa616c07e', '96.jpg', 1.5),
(97, NULL, '2019-12-15 11:52:44', 1982, 'fb87582825f9d28a8d42c5e5e5e8b23d', '394868456436dbe743e4380554c0493a', 'pelicula de prueba', 'bc91ec6214c520d5ba797ed30c788471', '97.jpg', 6),
(98, NULL, '2019-12-15 11:52:44', 1943, 'c3395dd46c34fa7fd8d729d8cf88b7a8', '326fb04c3abf030fe3f4e341f39b573f', 'pelicula de prueba', '3d74cd025f05558cecf0225075a9c5d2', '98.jpg', 4.5),
(99, NULL, '2019-12-15 11:52:45', 2005, 'd47268e9db2e9aa3827bba3afb7ff94a', '39ea40e164f970c54b0530436d5a9f7a', 'pelicula de prueba', '5db2d5f21e0345415186d409068af1b5', '99.jpg', 7),
(100, NULL, '2019-12-15 11:52:45', 2002, '4ba29b9f9e5732ed33761840f4ba6c53', 'fdf1bc5669e8ff5ba45d02fded729feb', 'pelicula de prueba', '33c1daa3e26080071cb26274d3f6d76a', '100.jpg', 5),
(101, NULL, '2019-12-15 11:52:45', 2002, '4ba29b9f9e5732ed33761840f4ba6c53', 'cc58f7abf0b0cf2d5ac95ab60e4f14e9', 'pelicula de prueba', 'e70c4c559e6da363e0f7ad58226cdc2d', '101.jpg', 7.5),
(102, NULL, '2019-12-15 11:52:46', 1952, '1113d7a76ffceca1bb350bfe145467c6', 'd6317f80523fdf2a7375da19c9a006b8', 'pelicula de prueba', 'c3e78594ed6c1d88ab51a925a9915f12', '102.jpg', 7),
(103, NULL, '2019-12-15 11:52:46', 2008, 'ef8446f35513a8d6aa2308357a268a7e', '61f2585b0ebcf1f532c4d1ec9a7d51aa', 'pelicula de prueba', '8a97abe373b5fab6f2a9fdfdda3ee533', '103.jpg', 6.5),
(104, NULL, '2019-12-15 11:52:46', 1985, '1f36c15d6a3d18d52e8d493bc8187cb9', 'b7ee0d0d4d5ef995aae0fc691e6d840d', 'pelicula de prueba', '7a51879c9f0c43d7552f2b9c66eedc39', '104.jpg', 5),
(105, NULL, '2019-12-15 11:52:47', 1999, '5ec829debe54b19a5f78d9a65b900a39', '4f9c76cf97f84048c5990dd4ef842ea2', 'pelicula de prueba', '72044479a2f75db897c8096f5a286b44', '105.jpg', 7.5),
(106, NULL, '2019-12-15 11:52:47', 2010, 'd7a84628c025d30f7b2c52c958767e76', '4f8bc5ac1dc2b49434efe9e72f183de8', 'pelicula de prueba', 'f0ffdb87c4d7308ba60ff211a0139798', '106.jpg', 7.5),
(107, NULL, '2019-12-15 11:52:47', 2011, 'c8758b517083196f05ac29810b924aca', '62f91ce9b820a491ee78c108636db089', 'pelicula de prueba', '654374c122e2045f99aab75e46c87648', '107.jpg', 1.5),
(108, NULL, '2019-12-15 11:52:47', 2019, 'ea6b2efbdd4255a9f1b3bbc6399b58f4', 'df0e09d6f25a15a815563df9827f48fa', 'pelicula de prueba', '6a24f9a260326f3585270315d7aed3b3', '108.jpg', 6),
(109, NULL, '2019-12-15 11:52:47', 2012, '253614bbac999b38b5b60cae531c4969', 'ab8aa05e782481f55fc1412a97e7ac34', 'pelicula de prueba', 'a3255fd43affa21d87c12d9cc6454a47', '109.jpg', 3),
(110, NULL, '2019-12-15 11:52:48', 1979, '798cebccb32617ad94123450fd137104', '04ad5632029cbfbed8e136e5f6f7ddfa', 'pelicula de prueba', 'b103d264a7d452f471d5b2a123461d81', '110.jpg', 2),
(111, NULL, '2019-12-15 11:52:48', 1927, 'e5b294b70c9647dcf804d7baa1903918', '09a69de15cf89bc7fe8c0642f906a4dd', 'pelicula de prueba', '418f058f16982f4457d06e0e2518c257', '111.jpg', 8.5),
(112, NULL, '2019-12-15 11:52:48', 1988, '9d7311ba459f9e45ed746755a32dcd11', 'e8d66338fab3727e34a9179ed8804f64', 'pelicula de prueba', 'b0593df00d86ec5af676856c865bd03f', '112.jpg', 5),
(113, NULL, '2019-12-15 11:52:48', 1957, '277a78fc05c8864a170e9a56ceeabc4c', 'ccd45007df44dd0f12098f486e7e8a0f', 'pelicula de prueba', '5ca7ecb0e43c0a7eaf302dd5368073b7', '113.jpg', 4),
(114, NULL, '2019-12-15 11:52:48', 1982, 'fb87582825f9d28a8d42c5e5e5e8b23d', 'b8b4b727d6f5d1b61fff7be687f7970f', 'pelicula de prueba', '63b045da417c4ccc417774bba1d711ba', '114.jpg', 9.5),
(115, NULL, '2019-12-15 11:52:49', 1930, '29530de21430b7540ec3f65135f7323c', '321cf86b4c9f5ddd04881a44067c2a5a', 'pelicula de prueba', '1d504289591995d7bd2e2bcddae47771', '115.jpg', 5.5),
(116, NULL, '2019-12-15 11:52:50', 1977, '4afd521d77158e02aed37e2274b90c9c', '734e6bfcd358e25ac1db0a4241b95651', 'pelicula de prueba', 'fe2fe978d8520f97eeccba232db6474a', '116.jpg', 5.5),
(117, NULL, '2019-12-15 11:52:50', 2012, '253614bbac999b38b5b60cae531c4969', '7a6a6127ff85640ec69691fb0f7cb1a2', 'pelicula de prueba', '77f99da8366bbddd3d6b82b16cd5f48b', '117.jpg', 4.5),
(118, NULL, '2019-12-15 11:52:51', 1937, '136f951362dab62e64eb8e841183c2a9', '38ed162a0dbef7b3fe0f628aa08b90e7', 'pelicula de prueba', 'd94813fd8153a9aa24e0f51478d52bc4', '118.jpg', 7.5),
(119, NULL, '2019-12-15 11:52:51', 1974, '3d863b367aa379f71c7afc0c9cdca41d', '101951fe7ebe7bd8c77d14f75746b4bc', 'pelicula de prueba', '347691213b1311de24c2debb28c443e9', '119.jpg', 3),
(120, NULL, '2019-12-15 11:52:51', 1921, '9f6992966d4c363ea0162a056cb45fe5', '0e1ebad68af7f0ae4830b7ac92bc3c6f', 'pelicula de prueba', '9e5401bf2875146258e57523969e5440', '120.jpg', 2),
(121, NULL, '2019-12-15 11:52:51', 2017, '8d8818c8e140c64c743113f563cf750f', '331316d4efb44682092a006307b9ae3a', 'pelicula de prueba', '0174ec706c7b7ee560fad63cebef7a81', '121.jpg', 5.5),
(122, NULL, '2019-12-15 11:52:52', 1968, '98c7242894844ecd6ec94af67ac8247d', '7221e5c8ec6b08ef6d3f9ff3ce6eb1d1', 'pelicula de prueba', 'd0c5db109eb5049c0388921fe9ed59da', '122.jpg', 7),
(123, NULL, '2019-12-15 11:52:52', 1970, '0004d0b59e19461ff126e3a08a814c33', '13b919438259814cd5be8cb45877d577', 'pelicula de prueba', '110dc6a1062c9cd28abc3e5f479bac23', '123.jpg', 2.5),
(124, NULL, '2019-12-15 11:52:52', 2005, 'd47268e9db2e9aa3827bba3afb7ff94a', 'd3aeec875c479e55d1cdeea161842ec6', 'pelicula de prueba', '206a684db24a9142d2bfa9076b195539', '124.jpg', 7),
(125, NULL, '2019-12-15 11:52:52', 1979, '798cebccb32617ad94123450fd137104', '9a85c12a21b76392747906fc7b2aff92', 'pelicula de prueba', '5b61cddc79cb002d9725f6716af0b8de', '125.jpg', 7.5),
(126, NULL, '2019-12-15 11:52:52', 2009, 'f1981e4bd8a0d6d8462016d2fc6276b3', '1a99f6821980ac99136dcd2f1e9c8740', 'pelicula de prueba', 'eb8062e18178ab89cc5df7e8eabad03a', '126.jpg', 6),
(127, NULL, '2019-12-15 11:52:53', 2015, '65d2ea03425887a717c435081cfc5dbb', 'dcda54e29207294d8e7e1b537338b1c0', 'pelicula de prueba', 'fd36f0e407af6f0ca06984444f5bd6f9', '127.jpg', 6.5),
(128, NULL, '2019-12-15 11:52:54', 2014, 'cee8d6b7ce52554fd70354e37bbf44a2', 'abdbeb4d8dbe30df8430a8394b7218ef', 'pelicula de prueba', '49faabdf8f0fa80ebeaa6ab91428a2d1', '128.jpg', 1.5),
(129, NULL, '2019-12-15 11:52:54', 1985, '1f36c15d6a3d18d52e8d493bc8187cb9', 'c922de9e01cba8a4684f6c3471130e4c', 'pelicula de prueba', '81257fa79c1ebd55724d04523b18279c', '129.jpg', 6),
(130, NULL, '2019-12-15 11:52:54', 1972, 'c4de8ced6214345614d33fb0b16a8acd', '8deb8d1dd92840f975b6931ab3a3c61e', 'pelicula de prueba', 'd8c706b6ebfac8d52e1f03d628f06b1c', '130.jpg', 2.5),
(131, NULL, '2019-12-15 11:52:54', 2011, 'c8758b517083196f05ac29810b924aca', '25766f01628f3d34b93a36a2301dffc9', 'pelicula de prueba', 'f619ce7ee7bea75368707aca019108c7', '131.jpg', 4.5),
(132, NULL, '2019-12-15 11:52:54', 1947, 'de03beffeed9da5f3639a621bcab5dd4', '1a3f91fead97497b1a96d6104ad339f6', 'pelicula de prueba', '51512004e976c2d701a08b574b4849f7', '132.jpg', 1.5),
(133, NULL, '2019-12-15 11:52:55', 1967, 'a82d922b133be19c1171534e6594f754', 'c6335734dbc0b1ded766421cfc611750', 'pelicula de prueba', 'f596e5a059f2350146435a08216d5376', '133.jpg', 3.5),
(134, NULL, '2019-12-15 11:52:55', 1979, '798cebccb32617ad94123450fd137104', 'f26df67e8110ee2b44923db775e3e47f', 'pelicula de prueba', '83aa93a1f9ff45635b86357d86a23a63', '134.jpg', 3.5),
(135, NULL, '2019-12-15 11:52:55', 1935, '8d55a249e6baa5c06772297520da2051', '1680829293f2a8541efa2647a0290f88', 'pelicula de prueba', '692b7e8f4c39ab5468661d987b6a977a', '135.jpg', 4),
(136, NULL, '2019-12-15 11:52:55', 2013, '8038da89e49ac5eabb489cfc6cea9fc1', '9238b8c482371600b4448da21405865a', 'pelicula de prueba', '2412b9fe2869f66cd39c0da69db04a14', '136.jpg', 5),
(137, NULL, '2019-12-15 11:52:55', 1921, '9f6992966d4c363ea0162a056cb45fe5', '455cb2657aaa59e32fad80cb0b65b9dc', 'pelicula de prueba', '9cfdadf1b43e67ae3536cdac19c5755d', '137.jpg', 2),
(138, NULL, '2019-12-15 11:52:55', 1947, 'de03beffeed9da5f3639a621bcab5dd4', '4b86abe48d358ecf194c56c69108433e', 'pelicula de prueba', '5787308eba2a77dae441ed65313e57aa', '138.jpg', 4),
(139, NULL, '2019-12-15 11:52:56', 2004, 'b8b4b727d6f5d1b61fff7be687f7970f', 'f5b1b89d98b7286673128a5fb112cb9a', 'pelicula de prueba', 'ccfd3cd2bf3bc370b9ab5047cd9872d8', '139.jpg', 7.5),
(140, NULL, '2019-12-15 11:52:56', 1945, '2d00f43f07911355d4151f13925ff292', '2b8eba3cb0d0f1d761cb74d94a5ace36', 'pelicula de prueba', '24e926eae9d623146cd25d9447bab669', '140.jpg', 6.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_favorita`
--

CREATE TABLE `pelicula_favorita` (
  `pelicula_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula_favorita`
--

INSERT INTO `pelicula_favorita` (`pelicula_id`, `user_id`) VALUES
(8, 2),
(43, 2),
(43, 3),
(52, 2),
(59, 2),
(66, 2),
(140, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superadministrador`
--

CREATE TABLE `superadministrador` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postalcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `looked` tinyint(1) NOT NULL,
  `expires` tinyint(1) NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `fullname`, `lastname`, `email`, `password`, `address`, `postalcode`, `city`, `country`, `phonenumber`, `datecreated`, `role`, `salt`, `enable`, `looked`, `expires`, `tipo`) VALUES
(1, 'admin', 'admin', 'admin@admin.es', 'uNDTqYwnQf5pDAKvOy/0exWZydihVGnT1bQR9OuBOyW1jUJca7CCAAO362IooPIQu4LaLLZ1a9ICX/5x5QKnLQ==', NULL, NULL, NULL, NULL, NULL, '2019-12-14 00:00:00', 'ROLE_SUPER_ADMIN', '6fa8a285ae57b7c7c4abbd676c867c6d', 1, 1, 1, 'superadministrador'),
(2, 'javi', 'garrido', 'usuario@usuario.es', 'uNDTqYwnQf5pDAKvOy/0exWZydihVGnT1bQR9OuBOyW1jUJca7CCAAO362IooPIQu4LaLLZ1a9ICX/5x5QKnLQ==', 'calle alambre', '12345', 'granada', 'España', '677889900', '2019-12-14 13:04:44', 'ROLE_USER', '6fa8a285ae57b7c7c4abbd676c867c6d', 1, 1, 1, 'userweb'),
(3, 'Jose manuel', 'garrido', 'usuario2@usuario.es', 'HPWSFgFAiD6l3QT+9LW/zPetkvKpCyBO4hnYebzcs8D88FvoqywsWKl0ngS4uBasEWgd3j4m6zilH/bMcxmHmg==', 'Calle Torres', '29000', 'Malaga', 'España', '766557788', '2019-12-15 14:14:26', 'ROLE_USER', 'd382da65e99b9e1fc561e4b6b54cfc6b', 1, 1, 1, 'userweb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userweb`
--

CREATE TABLE `userweb` (
  `id` int(11) NOT NULL,
  `facebookid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pathimage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigorecuperacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecharecuperacion` datetime DEFAULT NULL,
  `cif` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movil` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empresa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `userweb`
--

INSERT INTO `userweb` (`id`, `facebookid`, `googleid`, `pathimage`, `codigorecuperacion`, `fecharecuperacion`, `cif`, `movil`, `empresa`) VALUES
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion`
--

CREATE TABLE `votacion` (
  `id` int(11) NOT NULL,
  `pelicula_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `eliminado` tinyint(1) NOT NULL,
  `fechavotaciona` datetime DEFAULT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `votacion`
--

INSERT INTO `votacion` (`id`, `pelicula_id`, `user_id`, `eliminado`, `fechavotaciona`, `puntuacion`) VALUES
(135, 8, 2, 0, '2019-12-15 15:10:23', 7),
(136, 9, 2, 0, '2019-12-15 15:10:23', 3),
(137, 10, 2, 0, '2019-12-15 15:10:23', 1),
(138, 11, 2, 0, '2019-12-15 15:10:23', 7),
(139, 12, 2, 0, '2019-12-15 15:10:23', 9),
(140, 13, 2, 0, '2019-12-15 15:10:23', 7),
(141, 14, 2, 0, '2019-12-15 15:10:23', 8),
(142, 15, 2, 0, '2019-12-15 15:10:23', 4),
(143, 16, 2, 0, '2019-12-15 15:10:23', 4),
(144, 17, 2, 0, '2019-12-15 15:10:23', 9),
(145, 18, 2, 0, '2019-12-15 15:10:23', 6),
(146, 19, 2, 0, '2019-12-15 15:10:23', 5),
(147, 20, 2, 0, '2019-12-15 15:10:24', 8),
(148, 21, 2, 0, '2019-12-15 15:10:24', 2),
(149, 22, 2, 0, '2019-12-15 15:10:24', 2),
(150, 23, 2, 0, '2019-12-15 15:10:24', 10),
(151, 24, 2, 0, '2019-12-15 15:10:24', 8),
(152, 25, 2, 0, '2019-12-15 15:10:24', 4),
(153, 26, 2, 0, '2019-12-15 15:10:24', 6),
(154, 27, 2, 0, '2019-12-15 15:10:24', 2),
(155, 28, 2, 0, '2019-12-15 15:10:24', 9),
(156, 29, 2, 0, '2019-12-15 15:10:24', 8),
(157, 30, 2, 0, '2019-12-15 15:10:24', 6),
(158, 31, 2, 0, '2019-12-15 15:10:24', 5),
(159, 32, 2, 0, '2019-12-15 15:10:24', 2),
(160, 33, 2, 0, '2019-12-15 15:10:24', 9),
(161, 34, 2, 0, '2019-12-15 15:10:25', 4),
(162, 35, 2, 0, '2019-12-15 15:10:25', 1),
(163, 36, 2, 0, '2019-12-15 15:10:25', 0),
(164, 37, 2, 0, '2019-12-15 15:10:25', 6),
(165, 38, 2, 0, '2019-12-15 15:10:25', 3),
(166, 39, 2, 0, '2019-12-15 15:10:25', 2),
(167, 40, 2, 0, '2019-12-15 15:10:25', 3),
(168, 41, 2, 0, '2019-12-15 15:10:25', 10),
(169, 42, 2, 0, '2019-12-15 15:10:25', 10),
(170, 43, 2, 0, '2019-12-15 15:10:25', 9),
(171, 44, 2, 0, '2019-12-15 15:10:25', 2),
(172, 45, 2, 0, '2019-12-15 15:10:25', 2),
(173, 46, 2, 0, '2019-12-15 15:10:25', 2),
(174, 47, 2, 0, '2019-12-15 15:10:25', 7),
(175, 48, 2, 0, '2019-12-15 15:10:25', 7),
(176, 49, 2, 0, '2019-12-15 15:10:26', 2),
(177, 50, 2, 0, '2019-12-15 15:10:26', 9),
(178, 51, 2, 0, '2019-12-15 15:10:26', 9),
(179, 52, 2, 0, '2019-12-15 15:10:26', 7),
(180, 53, 2, 0, '2019-12-15 15:10:26', 0),
(181, 54, 2, 0, '2019-12-15 15:10:26', 9),
(182, 55, 2, 0, '2019-12-15 15:10:26', 4),
(183, 56, 2, 0, '2019-12-15 15:10:26', 2),
(184, 57, 2, 0, '2019-12-15 15:10:26', 8),
(185, 58, 2, 0, '2019-12-15 15:10:26', 9),
(186, 59, 2, 0, '2019-12-15 15:10:26', 10),
(187, 60, 2, 0, '2019-12-15 15:10:26', 1),
(188, 61, 2, 0, '2019-12-15 15:10:26', 5),
(189, 62, 2, 0, '2019-12-15 15:10:27', 8),
(190, 63, 2, 0, '2019-12-15 15:10:27', 10),
(191, 64, 2, 0, '2019-12-15 15:10:27', 0),
(192, 65, 2, 0, '2019-12-15 15:10:27', 4),
(193, 66, 2, 0, '2019-12-15 15:10:27', 5),
(194, 67, 2, 0, '2019-12-15 15:10:27', 10),
(195, 68, 2, 0, '2019-12-15 15:10:27', 10),
(196, 69, 2, 0, '2019-12-15 15:10:27', 3),
(197, 70, 2, 0, '2019-12-15 15:10:27', 3),
(198, 71, 2, 0, '2019-12-15 15:10:27', 6),
(199, 72, 2, 0, '2019-12-15 15:10:28', 4),
(200, 73, 2, 0, '2019-12-15 15:10:28', 10),
(201, 74, 2, 0, '2019-12-15 15:10:28', 2),
(202, 75, 2, 0, '2019-12-15 15:10:28', 6),
(203, 76, 2, 0, '2019-12-15 15:10:28', 2),
(204, 77, 2, 0, '2019-12-15 15:10:28', 1),
(205, 78, 2, 0, '2019-12-15 15:10:28', 5),
(206, 79, 2, 0, '2019-12-15 15:10:28', 3),
(207, 80, 2, 0, '2019-12-15 15:10:28', 3),
(208, 81, 2, 0, '2019-12-15 15:10:28', 9),
(209, 82, 2, 0, '2019-12-15 15:10:28', 1),
(210, 83, 2, 0, '2019-12-15 15:10:29', 7),
(211, 84, 2, 0, '2019-12-15 15:10:29', 8),
(212, 85, 2, 0, '2019-12-15 15:10:29', 1),
(213, 86, 2, 0, '2019-12-15 15:10:29', 10),
(214, 87, 2, 0, '2019-12-15 15:10:29', 3),
(215, 88, 2, 0, '2019-12-15 15:10:29', 1),
(216, 89, 2, 0, '2019-12-15 15:10:29', 9),
(217, 90, 2, 0, '2019-12-15 15:10:29', 1),
(218, 91, 2, 0, '2019-12-15 15:10:30', 5),
(219, 92, 2, 0, '2019-12-15 15:10:30', 0),
(220, 93, 2, 0, '2019-12-15 15:10:30', 10),
(221, 94, 2, 0, '2019-12-15 15:10:30', 0),
(222, 95, 2, 0, '2019-12-15 15:10:30', 6),
(223, 96, 2, 0, '2019-12-15 15:10:30', 3),
(224, 97, 2, 0, '2019-12-15 15:10:30', 9),
(225, 98, 2, 0, '2019-12-15 15:10:30', 1),
(226, 99, 2, 0, '2019-12-15 15:10:31', 4),
(227, 100, 2, 0, '2019-12-15 15:10:31', 9),
(228, 101, 2, 0, '2019-12-15 15:10:31', 8),
(229, 102, 2, 0, '2019-12-15 15:10:31', 9),
(230, 103, 2, 0, '2019-12-15 15:10:32', 10),
(231, 104, 2, 0, '2019-12-15 15:10:32', 4),
(232, 105, 2, 0, '2019-12-15 15:10:32', 10),
(233, 106, 2, 0, '2019-12-15 15:10:32', 5),
(234, 107, 2, 0, '2019-12-15 15:10:32', 1),
(235, 108, 2, 0, '2019-12-15 15:10:32', 5),
(236, 109, 2, 0, '2019-12-15 15:10:32', 6),
(237, 110, 2, 0, '2019-12-15 15:10:32', 3),
(238, 111, 2, 0, '2019-12-15 15:10:32', 7),
(239, 112, 2, 0, '2019-12-15 15:10:33', 10),
(240, 113, 2, 0, '2019-12-15 15:10:33', 7),
(241, 114, 2, 0, '2019-12-15 15:10:33', 10),
(242, 115, 2, 0, '2019-12-15 15:10:33', 8),
(243, 116, 2, 0, '2019-12-15 15:10:33', 7),
(244, 117, 2, 0, '2019-12-15 15:10:35', 1),
(245, 118, 2, 0, '2019-12-15 15:10:35', 8),
(246, 119, 2, 0, '2019-12-15 15:10:36', 3),
(247, 120, 2, 0, '2019-12-15 15:10:36', 2),
(248, 121, 2, 0, '2019-12-15 15:10:37', 9),
(249, 122, 2, 0, '2019-12-15 15:10:37', 9),
(250, 123, 2, 0, '2019-12-15 15:10:38', 3),
(251, 124, 2, 0, '2019-12-15 15:10:38', 6),
(252, 125, 2, 0, '2019-12-15 15:10:39', 8),
(253, 126, 2, 0, '2019-12-15 15:10:39', 8),
(254, 127, 2, 0, '2019-12-15 15:10:39', 3),
(255, 128, 2, 0, '2019-12-15 15:10:39', 3),
(256, 129, 2, 0, '2019-12-15 15:10:39', 7),
(257, 130, 2, 0, '2019-12-15 15:10:39', 0),
(258, 131, 2, 0, '2019-12-15 15:10:39', 2),
(259, 132, 2, 0, '2019-12-15 15:10:40', 0),
(260, 133, 2, 0, '2019-12-15 15:10:40', 2),
(261, 134, 2, 0, '2019-12-15 15:10:40', 2),
(262, 135, 2, 0, '2019-12-15 15:10:40', 5),
(263, 136, 2, 0, '2019-12-15 15:10:40', 7),
(264, 137, 2, 0, '2019-12-15 15:10:40', 0),
(265, 138, 2, 0, '2019-12-15 15:10:40', 3),
(266, 139, 2, 0, '2019-12-15 15:10:40', 9),
(267, 140, 2, 0, '2019-12-15 15:10:40', 9),
(268, 8, 3, 0, '2019-12-15 15:21:21', 8),
(269, 9, 3, 0, '2019-12-15 15:21:21', 5),
(270, 10, 3, 0, '2019-12-15 15:21:21', 10),
(271, 11, 3, 0, '2019-12-15 15:21:21', 6),
(272, 12, 3, 0, '2019-12-15 15:21:21', 2),
(273, 13, 3, 0, '2019-12-15 15:21:21', 0),
(274, 14, 3, 0, '2019-12-15 15:21:21', 1),
(275, 15, 3, 0, '2019-12-15 15:21:21', 6),
(276, 16, 3, 0, '2019-12-15 15:21:21', 9),
(277, 17, 3, 0, '2019-12-15 15:21:22', 6),
(278, 18, 3, 0, '2019-12-15 15:21:22', 5),
(279, 19, 3, 0, '2019-12-15 15:21:22', 2),
(280, 20, 3, 0, '2019-12-15 15:21:22', 8),
(281, 21, 3, 0, '2019-12-15 15:21:22', 9),
(282, 22, 3, 0, '2019-12-15 15:21:22', 1),
(283, 23, 3, 0, '2019-12-15 15:21:22', 1),
(284, 24, 3, 0, '2019-12-15 15:21:22', 7),
(285, 25, 3, 0, '2019-12-15 15:21:22', 0),
(286, 26, 3, 0, '2019-12-15 15:21:22', 0),
(287, 27, 3, 0, '2019-12-15 15:21:22', 5),
(288, 28, 3, 0, '2019-12-15 15:21:22', 4),
(289, 29, 3, 0, '2019-12-15 15:21:22', 7),
(290, 30, 3, 0, '2019-12-15 15:21:23', 10),
(291, 31, 3, 0, '2019-12-15 15:21:23', 3),
(292, 32, 3, 0, '2019-12-15 15:21:23', 8),
(293, 33, 3, 0, '2019-12-15 15:21:23', 4),
(294, 34, 3, 0, '2019-12-15 15:21:23', 4),
(295, 35, 3, 0, '2019-12-15 15:21:23', 9),
(296, 36, 3, 0, '2019-12-15 15:21:23', 3),
(297, 37, 3, 0, '2019-12-15 15:21:23', 8),
(298, 38, 3, 0, '2019-12-15 15:21:23', 4),
(299, 39, 3, 0, '2019-12-15 15:21:23', 1),
(300, 40, 3, 0, '2019-12-15 15:21:23', 8),
(301, 41, 3, 0, '2019-12-15 15:21:23', 0),
(302, 42, 3, 0, '2019-12-15 15:21:23', 1),
(303, 43, 3, 0, '2019-12-15 15:21:24', 8),
(304, 44, 3, 0, '2019-12-15 15:21:24', 2),
(305, 45, 3, 0, '2019-12-15 15:21:24', 1),
(306, 46, 3, 0, '2019-12-15 15:21:24', 10),
(307, 47, 3, 0, '2019-12-15 15:21:24', 8),
(308, 48, 3, 0, '2019-12-15 15:21:24', 3),
(309, 49, 3, 0, '2019-12-15 15:21:24', 2),
(310, 50, 3, 0, '2019-12-15 15:21:24', 4),
(311, 51, 3, 0, '2019-12-15 15:21:24', 5),
(312, 52, 3, 0, '2019-12-15 15:21:24', 9),
(313, 53, 3, 0, '2019-12-15 15:21:24', 9),
(314, 54, 3, 0, '2019-12-15 15:21:26', 8),
(315, 55, 3, 0, '2019-12-15 15:21:26', 5),
(316, 56, 3, 0, '2019-12-15 15:21:28', 1),
(317, 57, 3, 0, '2019-12-15 15:21:28', 1),
(318, 58, 3, 0, '2019-12-15 15:21:28', 7),
(319, 59, 3, 0, '2019-12-15 15:21:28', 8),
(320, 60, 3, 0, '2019-12-15 15:21:28', 2),
(321, 61, 3, 0, '2019-12-15 15:21:29', 5),
(322, 62, 3, 0, '2019-12-15 15:21:29', 8),
(323, 63, 3, 0, '2019-12-15 15:21:29', 4),
(324, 64, 3, 0, '2019-12-15 15:21:29', 7),
(325, 65, 3, 0, '2019-12-15 15:21:29', 4),
(326, 66, 3, 0, '2019-12-15 15:21:29', 6),
(327, 67, 3, 0, '2019-12-15 15:21:29', 7),
(328, 68, 3, 0, '2019-12-15 15:21:29', 8),
(329, 69, 3, 0, '2019-12-15 15:21:29', 1),
(330, 70, 3, 0, '2019-12-15 15:21:29', 3),
(331, 71, 3, 0, '2019-12-15 15:21:29', 1),
(332, 72, 3, 0, '2019-12-15 15:21:30', 3),
(333, 73, 3, 0, '2019-12-15 15:21:30', 9),
(334, 74, 3, 0, '2019-12-15 15:21:30', 8),
(335, 75, 3, 0, '2019-12-15 15:21:30', 5),
(336, 76, 3, 0, '2019-12-15 15:21:30', 6),
(337, 77, 3, 0, '2019-12-15 15:21:30', 7),
(338, 78, 3, 0, '2019-12-15 15:21:30', 4),
(339, 79, 3, 0, '2019-12-15 15:21:30', 10),
(340, 80, 3, 0, '2019-12-15 15:21:30', 3),
(341, 81, 3, 0, '2019-12-15 15:21:30', 3),
(342, 82, 3, 0, '2019-12-15 15:21:30', 4),
(343, 83, 3, 0, '2019-12-15 15:21:30', 0),
(344, 84, 3, 0, '2019-12-15 15:21:30', 4),
(345, 85, 3, 0, '2019-12-15 15:21:30', 0),
(346, 86, 3, 0, '2019-12-15 15:21:30', 0),
(347, 87, 3, 0, '2019-12-15 15:21:31', 1),
(348, 88, 3, 0, '2019-12-15 15:21:31', 4),
(349, 89, 3, 0, '2019-12-15 15:21:31', 4),
(350, 90, 3, 0, '2019-12-15 15:21:31', 2),
(351, 91, 3, 0, '2019-12-15 15:21:31', 4),
(352, 92, 3, 0, '2019-12-15 15:21:31', 7),
(353, 93, 3, 0, '2019-12-15 15:21:31', 9),
(354, 94, 3, 0, '2019-12-15 15:21:31', 2),
(355, 95, 3, 0, '2019-12-15 15:21:31', 7),
(356, 96, 3, 0, '2019-12-15 15:21:32', 0),
(357, 97, 3, 0, '2019-12-15 15:21:32', 3),
(358, 98, 3, 0, '2019-12-15 15:21:32', 8),
(359, 99, 3, 0, '2019-12-15 15:21:32', 10),
(360, 100, 3, 0, '2019-12-15 15:21:32', 1),
(361, 101, 3, 0, '2019-12-15 15:21:32', 7),
(362, 102, 3, 0, '2019-12-15 15:21:32', 5),
(363, 103, 3, 0, '2019-12-15 15:21:32', 3),
(364, 104, 3, 0, '2019-12-15 15:21:32', 6),
(365, 105, 3, 0, '2019-12-15 15:21:32', 5),
(366, 106, 3, 0, '2019-12-15 15:21:32', 10),
(367, 107, 3, 0, '2019-12-15 15:21:33', 2),
(368, 108, 3, 0, '2019-12-15 15:21:33', 7),
(369, 109, 3, 0, '2019-12-15 15:21:33', 0),
(370, 110, 3, 0, '2019-12-15 15:21:33', 1),
(371, 111, 3, 0, '2019-12-15 15:21:33', 10),
(372, 112, 3, 0, '2019-12-15 15:21:33', 0),
(373, 113, 3, 0, '2019-12-15 15:21:33', 1),
(374, 114, 3, 0, '2019-12-15 15:21:33', 9),
(375, 115, 3, 0, '2019-12-15 15:21:34', 3),
(376, 116, 3, 0, '2019-12-15 15:21:34', 4),
(377, 117, 3, 0, '2019-12-15 15:21:34', 8),
(378, 118, 3, 0, '2019-12-15 15:21:34', 7),
(379, 119, 3, 0, '2019-12-15 15:21:34', 3),
(380, 120, 3, 0, '2019-12-15 15:21:35', 2),
(381, 121, 3, 0, '2019-12-15 15:21:35', 2),
(382, 122, 3, 0, '2019-12-15 15:21:35', 5),
(383, 123, 3, 0, '2019-12-15 15:21:35', 2),
(384, 124, 3, 0, '2019-12-15 15:21:35', 8),
(385, 125, 3, 0, '2019-12-15 15:21:36', 7),
(386, 126, 3, 0, '2019-12-15 15:21:36', 4),
(387, 127, 3, 0, '2019-12-15 15:21:36', 10),
(388, 128, 3, 0, '2019-12-15 15:21:36', 0),
(389, 129, 3, 0, '2019-12-15 15:21:36', 5),
(390, 130, 3, 0, '2019-12-15 15:21:36', 5),
(391, 131, 3, 0, '2019-12-15 15:21:37', 7),
(392, 132, 3, 0, '2019-12-15 15:21:37', 3),
(393, 133, 3, 0, '2019-12-15 15:21:37', 5),
(394, 134, 3, 0, '2019-12-15 15:21:37', 5),
(395, 135, 3, 0, '2019-12-15 15:21:37', 3),
(396, 136, 3, 0, '2019-12-15 15:21:38', 3),
(397, 137, 3, 0, '2019-12-15 15:21:38', 4),
(398, 138, 3, 0, '2019-12-15 15:21:39', 5),
(399, 139, 3, 0, '2019-12-15 15:21:39', 6),
(400, 140, 3, 0, '2019-12-15 15:21:39', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_73BC7095DB38439E` (`usuario_id`);

--
-- Indices de la tabla `pelicula_favorita`
--
ALTER TABLE `pelicula_favorita`
  ADD PRIMARY KEY (`pelicula_id`,`user_id`),
  ADD KEY `IDX_759C3FA70713909` (`pelicula_id`),
  ADD KEY `IDX_759C3FAA76ED395` (`user_id`);

--
-- Indices de la tabla `superadministrador`
--
ALTER TABLE `superadministrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indices de la tabla `userweb`
--
ALTER TABLE `userweb`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_60F8F92D70713909` (`pelicula_id`),
  ADD KEY `IDX_60F8F92DA76ED395` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `votacion`
--
ALTER TABLE `votacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `FK_73BC7095DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `pelicula_favorita`
--
ALTER TABLE `pelicula_favorita`
  ADD CONSTRAINT `FK_759C3FA70713909` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `FK_759C3FAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `superadministrador`
--
ALTER TABLE `superadministrador`
  ADD CONSTRAINT `FK_3ABC78A2BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `userweb`
--
ALTER TABLE `userweb`
  ADD CONSTRAINT `FK_D4E62EF4BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD CONSTRAINT `FK_60F8F92D70713909` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `FK_60F8F92DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
