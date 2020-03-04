-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 05:09 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add b bet station info', 7, 'add_bbetstationinfo'),
(20, 'Can change b bet station info', 7, 'change_bbetstationinfo'),
(21, 'Can delete b bet station info', 7, 'delete_bbetstationinfo'),
(22, 'Can add b seat booked', 8, 'add_bseatbooked'),
(23, 'Can change b seat booked', 8, 'change_bseatbooked'),
(24, 'Can delete b seat booked', 8, 'delete_bseatbooked'),
(25, 'Can add bus', 9, 'add_bus'),
(26, 'Can change bus', 9, 'change_bus'),
(27, 'Can delete bus', 9, 'delete_bus'),
(28, 'Can add coach', 10, 'add_coach'),
(29, 'Can change coach', 10, 'change_coach'),
(30, 'Can delete coach', 10, 'delete_coach'),
(31, 'Can add flight', 11, 'add_flight'),
(32, 'Can change flight', 11, 'change_flight'),
(33, 'Can delete flight', 11, 'delete_flight'),
(34, 'Can add f seat fare', 12, 'add_fseatfare'),
(35, 'Can change f seat fare', 12, 'change_fseatfare'),
(36, 'Can delete f seat fare', 12, 'delete_fseatfare'),
(37, 'Can add hotels', 13, 'add_hotels'),
(38, 'Can change hotels', 13, 'change_hotels'),
(39, 'Can delete hotels', 13, 'delete_hotels'),
(40, 'Can add h room booked', 14, 'add_hroombooked'),
(41, 'Can change h room booked', 14, 'change_hroombooked'),
(42, 'Can delete h room booked', 14, 'delete_hroombooked'),
(43, 'Can add h room fare', 15, 'add_hroomfare'),
(44, 'Can change h room fare', 15, 'change_hroomfare'),
(45, 'Can delete h room fare', 15, 'delete_hroomfare'),
(46, 'Can add is user active', 16, 'add_isuseractive'),
(47, 'Can change is user active', 16, 'change_isuseractive'),
(48, 'Can delete is user active', 16, 'delete_isuseractive'),
(49, 'Can add t bet station info', 17, 'add_tbetstationinfo'),
(50, 'Can change t bet station info', 17, 'change_tbetstationinfo'),
(51, 'Can delete t bet station info', 17, 'delete_tbetstationinfo'),
(52, 'Can add train', 18, 'add_train'),
(53, 'Can change train', 18, 'change_train'),
(54, 'Can delete train', 18, 'delete_train'),
(55, 'Can add t seat booked', 19, 'add_tseatbooked'),
(56, 'Can change t seat booked', 19, 'change_tseatbooked'),
(57, 'Can delete t seat booked', 19, 'delete_tseatbooked'),
(58, 'Can add t seat fare', 20, 'add_tseatfare'),
(59, 'Can change t seat fare', 20, 'change_tseatfare'),
(60, 'Can delete t seat fare', 20, 'delete_tseatfare'),
(61, 'Can add f seat booked', 21, 'add_fseatbooked'),
(62, 'Can change f seat booked', 21, 'change_fseatbooked'),
(63, 'Can delete f seat booked', 21, 'delete_fseatbooked');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$dsTi6PYoKn30$MjBm2pmrsO4F8P9hv5pgZuEl0M2cPPNexd1SJwZT8oc=', '2018-04-08 14:25:06.001606', 0, 'parimal', 'parimal', 'jethva', 'parimaljethva1@gmail.com', 0, 1, '2018-04-06 06:57:34.609296'),
(2, 'pbkdf2_sha256$100000$FM1PBsbkrJr6$FgFK5+ZMVZgvDPMeoPtyELAzm88m7529+oHAn69bTVA=', '2018-04-06 08:21:41.964886', 0, 'jay', 'jay', 'abc', 'a@gmail.com', 0, 1, '2018-04-06 08:21:27.434055'),
(3, 'pbkdf2_sha256$100000$mIelfWGU5Ckg$oAGOoWsSi02zP3B1XSkRuJHQRNaqymrz8ipuUjf9e64=', '2018-04-06 08:28:11.451870', 0, 'aaa', 'aaa', 'bbb', 'a@g.com', 0, 1, '2018-04-06 08:25:12.326982');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'tmsdatabase', 'bbetstationinfo'),
(8, 'tmsdatabase', 'bseatbooked'),
(9, 'tmsdatabase', 'bus'),
(10, 'tmsdatabase', 'coach'),
(11, 'tmsdatabase', 'flight'),
(21, 'tmsdatabase', 'fseatbooked'),
(12, 'tmsdatabase', 'fseatfare'),
(13, 'tmsdatabase', 'hotels'),
(14, 'tmsdatabase', 'hroombooked'),
(15, 'tmsdatabase', 'hroomfare'),
(16, 'tmsdatabase', 'isuseractive'),
(17, 'tmsdatabase', 'tbetstationinfo'),
(18, 'tmsdatabase', 'train'),
(19, 'tmsdatabase', 'tseatbooked'),
(20, 'tmsdatabase', 'tseatfare');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-04-06 06:51:43.171985'),
(2, 'auth', '0001_initial', '2018-04-06 06:51:53.200231'),
(3, 'admin', '0001_initial', '2018-04-06 06:51:56.028451'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-04-06 06:51:56.097441'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-04-06 06:51:57.363337'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-04-06 06:51:58.388285'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-04-06 06:51:59.327961'),
(8, 'auth', '0004_alter_user_username_opts', '2018-04-06 06:51:59.491113'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-04-06 06:52:00.098078'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-04-06 06:52:00.144968'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-04-06 06:52:00.229229'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-04-06 06:52:02.380807'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-04-06 06:52:03.253631'),
(14, 'sessions', '0001_initial', '2018-04-06 06:52:04.170489'),
(15, 'tmsdatabase', '0001_initial', '2018-04-06 06:52:24.030374'),
(16, 'tmsdatabase', '0002_bseatbooked_fare', '2018-04-06 17:15:04.358127'),
(17, 'tmsdatabase', '0003_bseatbooked_session', '2018-04-06 18:02:04.261113'),
(18, 'tmsdatabase', '0004_auto_20180407_0025', '2018-04-06 18:55:34.461261'),
(19, 'tmsdatabase', '0005_auto_20180407_0221', '2018-04-06 20:51:15.370669'),
(20, 'tmsdatabase', '0006_auto_20180407_1102', '2018-04-07 05:32:18.598974'),
(21, 'tmsdatabase', '0007_auto_20180407_1304', '2018-04-07 07:34:52.921832'),
(22, 'tmsdatabase', '0008_auto_20180407_2055', '2018-04-07 15:25:44.945010'),
(23, 'tmsdatabase', '0009_auto_20180407_2331', '2018-04-07 18:01:16.523776'),
(24, 'tmsdatabase', '0010_auto_20180407_2335', '2018-04-07 18:05:34.124454'),
(25, 'tmsdatabase', '0011_auto_20180407_2359', '2018-04-07 18:29:09.944681'),
(26, 'tmsdatabase', '0012_auto_20180408_1505', '2018-04-08 09:35:33.098212'),
(27, 'tmsdatabase', '0013_remove_hotels_htype', '2018-04-08 09:36:59.593662'),
(28, 'tmsdatabase', '0014_hotels_add', '2018-04-08 12:43:11.520193'),
(29, 'tmsdatabase', '0015_auto_20180408_2139', '2018-04-08 16:10:33.971351'),
(30, 'tmsdatabase', '0016_auto_20180408_2143', '2018-04-08 16:16:26.650621'),
(31, 'tmsdatabase', '0017_auto_20180408_2146', '2018-04-08 16:16:29.657826'),
(32, 'tmsdatabase', '0018_hroombooked_rno', '2018-04-08 16:51:52.478038'),
(33, 'tmsdatabase', '0019_auto_20180408_2225', '2018-04-08 16:55:44.433599'),
(34, 'tmsdatabase', '0020_auto_20180408_2252', '2018-04-08 17:22:42.420967'),
(35, 'tmsdatabase', '0021_hroombooked_fare', '2018-04-08 17:51:16.124502'),
(36, 'tmsdatabase', '0022_auto_20180408_2342', '2018-04-08 18:12:54.548971'),
(37, 'tmsdatabase', '0023_auto_20180408_2346', '2018-04-08 18:16:34.578799');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0y10p2r7oi638em04x9k2zew1a658put', 'ZGY4ODRhMDdjZDhhZTJkNDk1NjhjOTFmNjhiZjc4NDg5YTIwZDdkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCIsIm5vcCI6IjMifQ==', '2018-04-20 16:24:47.973935'),
('2xsb87lbr9npjgf6t24guldnnx10oayi', 'Zjg4NzRhMWM4Nzg4OWQ3MjczNWI1MTRkNmY3YmI0N2I0ODM1MDgwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwibm9wIjoiMyJ9', '2018-04-20 09:21:18.661915'),
('3nubp4v7nt1evm5qqvnynn4dyhxpwwce', 'YzFlN2ZiOTRkNGMxODZjZWM0MzQ1ZDliNzUzNmM1YjFhZTUwY2MzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwibm9wIjoiMSIsInVpZCI6InBhcmltYWwifQ==', '2018-04-21 07:35:03.370669'),
('7apsxilu6vnebqe3ywy1ignem55kl0w6', 'YWRkOTc3ZDNjNDI2ODI3MDJlNTczYzg4MGM2OTQ1ZDRmZmM0ZGQ2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCJ9', '2018-04-22 08:00:16.991531'),
('7lfxh1hojn1rqm3osxi9gcn93rytwq8q', 'YWRkOTc3ZDNjNDI2ODI3MDJlNTczYzg4MGM2OTQ1ZDRmZmM0ZGQ2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCJ9', '2018-04-22 12:44:04.457042'),
('dnptrtrme9gabgbbh8tyrju77q0lfjse', 'NWViNmM3YThlOTMxNTNjZGQyNDJjZGQ4ZGFkODIyYWQ0Nzk1ZmY3ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwibm9wIjoiMiIsInVpZCI6InBhcmltYWwifQ==', '2018-04-22 06:52:49.615735'),
('k3fdwnch809djo48jmjlxe02m3idlznj', 'YmM1MWZlNjYwNDY5NjgzYThmMDRjOWJjMTVjZDExMDY5NDFhNmNmZDp7Im5vcCI6IjIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjMxNTQ4MGJiZjljMzAxOWM4NTRhMDYyOTk3YmFjYTZlMWI4ZTk1ZSIsInVpZCI6InBhcmltYWwifQ==', '2018-04-20 07:22:18.799756'),
('kd8yf6q0q3rv6vhw1v29k6z3gdssw103', 'YzFlN2ZiOTRkNGMxODZjZWM0MzQ1ZDliNzUzNmM1YjFhZTUwY2MzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwibm9wIjoiMSIsInVpZCI6InBhcmltYWwifQ==', '2018-04-20 20:48:19.065088'),
('n8f244s6dq6yhlcdb94w7smgbkmdeizu', 'ZGY4ODRhMDdjZDhhZTJkNDk1NjhjOTFmNjhiZjc4NDg5YTIwZDdkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCIsIm5vcCI6IjMifQ==', '2018-04-22 18:23:37.714878'),
('ncso4ukq5k22wflnh8sgh5m2vxlnsngd', 'YWRkOTc3ZDNjNDI2ODI3MDJlNTczYzg4MGM2OTQ1ZDRmZmM0ZGQ2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCJ9', '2018-04-21 04:56:09.933979'),
('sg1nexz9467jt6xi3g9mwz9u4lnk06vz', 'YzA1MzI5NzI2YzY3MDJjZmY1MjAwNjI2NWQ3NTlkZDVjODViMTQ0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1NDgwYmJmOWMzMDE5Yzg1NGEwNjI5OTdiYWNhNmUxYjhlOTVlIiwidWlkIjoicGFyaW1hbCIsIm5vcCI6IjIifQ==', '2018-04-21 18:55:11.498166');

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_bbetstationinfo`
--

CREATE TABLE `tmsdatabase_bbetstationinfo` (
  `betsid` int(11) NOT NULL,
  `btype` varchar(20) NOT NULL,
  `src` varchar(50) NOT NULL,
  `dst` varchar(50) NOT NULL,
  `atime` varchar(15) NOT NULL,
  `dtime` varchar(15) NOT NULL,
  `seatfare` int(11) NOT NULL,
  `seatype` varchar(15) NOT NULL,
  `bid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_bbetstationinfo`
--

INSERT INTO `tmsdatabase_bbetstationinfo` (`betsid`, `btype`, `src`, `dst`, `atime`, `dtime`, `seatfare`, `seatype`, `bid_id`) VALUES
(1, 'express', 'abad', 'baroda', '2:00', '2:05', 100, 'seating', 1),
(2, 'express', 'abad', 'nadiad', '3:00', '3:05', 60, 'seating', 1),
(3, 'express', 'nadiad', 'baroda', '3:00', '3:35', 100, 'seating', 1),
(4, 'express', 'abad', 'abad', '2:00', '2:05', 50, 'seating', 1),
(5, 'express', 'baroda', 'baroda', '5:00', '5:00', 200, 'seating', 1),
(6, 'express', 'abad', 'abad', '12:00', '12:00', 0, '', 2),
(7, 'express', 'abad', 'nadiad', '12:00', '12:00', 50, '', 2),
(8, 'express', 'abad', 'baroda', '12:00', '12:00', 100, '', 2),
(9, 'express', 'abad', 'surat', '12:00', '12:00', 200, '', 2),
(10, 'express', 'surat', 'surat', '18:00', '18:00', 0, '', 2),
(11, 'express', 'nadiad', 'baroda', '13:00', '13:05', 50, '', 2),
(12, 'express', 'baroda', 'surat', '14:30', '14:35', 80, '', 2),
(13, 'express', 'nadiad', 'surat', '13:00', '13:05', 150, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_bseatbooked`
--

CREATE TABLE `tmsdatabase_bseatbooked` (
  `bsbid` int(11) NOT NULL,
  `betsid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `page` int(11) NOT NULL,
  `mno` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bid` int(11) NOT NULL,
  `src` varchar(50) NOT NULL,
  `dst` varchar(50) NOT NULL,
  `seatno` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `fare` int(11) NOT NULL,
  `session` varchar(50) NOT NULL,
  `rdate` date NOT NULL,
  `rtime` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_bus`
--

CREATE TABLE `tmsdatabase_bus` (
  `bid` int(11) NOT NULL,
  `btype` varchar(20) NOT NULL,
  `noofseats` int(11) NOT NULL,
  `spoint` varchar(50) NOT NULL,
  `epoint` varchar(50) NOT NULL,
  `bownerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_bus`
--

INSERT INTO `tmsdatabase_bus` (`bid`, `btype`, `noofseats`, `spoint`, `epoint`, `bownerid`) VALUES
(1, 'express', 10, 'abad', 'baroda', 1),
(2, 'express', 10, 'abad', 'surat', 2),
(3, 'express', 10, 'baroda', 'surat', 3),
(4, 'express', 10, 'nadiad', 'baroda', 4),
(5, 'express', 10, 'nadiad', 'surat', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_coach`
--

CREATE TABLE `tmsdatabase_coach` (
  `coid` int(11) NOT NULL,
  `noofseats` int(11) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `tid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_flight`
--

CREATE TABLE `tmsdatabase_flight` (
  `fid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `spoint` varchar(50) NOT NULL,
  `epoint` varchar(50) NOT NULL,
  `nos` int(11) NOT NULL,
  `seatfare` int(11) NOT NULL,
  `atime` varchar(15) NOT NULL,
  `dtime` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_flight`
--

INSERT INTO `tmsdatabase_flight` (`fid`, `fname`, `spoint`, `epoint`, `nos`, `seatfare`, `atime`, `dtime`) VALUES
(1, 'international', 'jamnagar', 'abad', 40, 1500, '2:00', '4:00'),
(2, 'national', 'abad', 'delhi', 40, 5000, '12:00', '12:30'),
(3, 'national', 'mumbai', 'delhi', 40, 6000, '14:00', '14:30'),
(4, 'national', 'mumbai', 'goa', 40, 4000, '12:00', '12:30');

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_fseatbooked`
--

CREATE TABLE `tmsdatabase_fseatbooked` (
  `fsbid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `page` int(11) NOT NULL,
  `mno` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fid` int(11) NOT NULL,
  `spoint` varchar(50) NOT NULL,
  `epoint` varchar(50) NOT NULL,
  `seatno` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `session` varchar(50) NOT NULL,
  `fare` int(11) NOT NULL,
  `rdate` date NOT NULL,
  `rtime` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_hotels`
--

CREATE TABLE `tmsdatabase_hotels` (
  `hid` int(11) NOT NULL,
  `hname` varchar(50) NOT NULL,
  `howner` varchar(50) NOT NULL,
  `hcity` varchar(50) NOT NULL,
  `noofrooms` int(11) NOT NULL,
  `add` varchar(150) NOT NULL,
  `roomfare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_hotels`
--

INSERT INTO `tmsdatabase_hotels` (`hid`, `hname`, `howner`, `hcity`, `noofrooms`, `add`, `roomfare`) VALUES
(1, 'hotel1', 'abc', 'ahmedabad', 20, 'abc', 1500),
(2, 'hotel2', 'qwe', 'baroda', 20, 'abc', 2000),
(3, 'bcd', 'ghj', 'ahmedabad', 25, 'ahmedabad', 500);

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_hroombooked`
--

CREATE TABLE `tmsdatabase_hroombooked` (
  `bookedfrom` date NOT NULL,
  `bookedtill` date NOT NULL,
  `hid` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `rdate` date NOT NULL,
  `rtime` time(6) NOT NULL,
  `rno` int(11) NOT NULL,
  `rbid` int(11) NOT NULL,
  `fare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_hroombooked`
--

INSERT INTO `tmsdatabase_hroombooked` (`bookedfrom`, `bookedtill`, `hid`, `uid`, `age`, `name`, `rdate`, `rtime`, `rno`, `rbid`, `fare`) VALUES
('2018-04-11', '2018-04-12', 1, 'parimal', 1, 'a', '2018-04-09', '12:22:00.000000', 1, 46, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 3, 'b', '2018-04-09', '12:22:00.000000', 1, 47, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 4, 'c', '2018-04-09', '12:22:00.000000', 1, 48, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 5, 'd', '2018-04-09', '12:22:00.000000', 2, 49, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, 'e', '2018-04-09', '12:22:00.000000', 2, 50, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'q', '2018-04-09', '12:22:00.000000', 2, 51, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 56, 'ty', '2018-04-09', '12:22:00.000000', 1, 52, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 3, 'we', '2018-04-09', '12:22:00.000000', 1, 53, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, 'k', '2018-04-09', '12:22:00.000000', 1, 54, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 5, 'rt', '2018-04-09', '12:22:00.000000', 2, 55, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'asd', '2018-04-09', '12:25:00.000000', 3, 56, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 4, 'fg', '2018-04-09', '12:25:00.000000', 3, 57, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 1, '2', '2018-04-09', '12:25:00.000000', 3, 58, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, 's', '2018-04-09', '12:25:00.000000', 4, 59, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, 'w', '2018-04-09', '12:25:00.000000', 4, 60, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 3, '2', '2018-04-09', '12:25:00.000000', 4, 61, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 3, 'e', '2018-04-09', '12:25:00.000000', 5, 62, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 4, '5', '2018-04-09', '12:25:00.000000', 5, 63, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 3, '3', '2018-04-09', '12:25:00.000000', 5, 64, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, '2', '2018-04-09', '12:25:00.000000', 6, 65, 6000),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'bn', '2018-04-09', '12:26:00.000000', 7, 66, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 2, 'asd', '2018-04-09', '12:26:00.000000', 7, 67, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:36:00.000000', 8, 68, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:37:00.000000', 9, 69, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:39:00.000000', 10, 70, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:39:00.000000', 11, 71, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:40:00.000000', 12, 72, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:41:00.000000', 13, 73, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:41:00.000000', 14, 74, 1500),
('2018-04-11', '2018-04-12', 1, 'parimal', 12, 'parimal', '2018-04-09', '12:42:00.000000', 15, 75, 1500),
('2018-04-18', '2018-04-20', 2, 'parimal', 12, 'parimal', '2018-04-09', '12:43:00.000000', 1, 76, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 3, 'tas', '2018-04-09', '12:43:00.000000', 1, 77, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:46:00.000000', 2, 78, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:46:00.000000', 2, 79, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:46:00.000000', 3, 80, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:46:00.000000', 3, 81, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:46:00.000000', 4, 82, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:46:00.000000', 4, 83, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:46:00.000000', 5, 84, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:46:00.000000', 5, 85, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:47:00.000000', 6, 86, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:47:00.000000', 6, 87, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:47:00.000000', 7, 88, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:47:00.000000', 7, 89, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 2, 'p', '2018-04-09', '12:48:00.000000', 8, 90, 2000),
('2018-04-18', '2018-04-20', 2, 'parimal', 4, 't', '2018-04-09', '12:48:00.000000', 8, 91, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_isuseractive`
--

CREATE TABLE `tmsdatabase_isuseractive` (
  `uid` varchar(50) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmsdatabase_isuseractive`
--

INSERT INTO `tmsdatabase_isuseractive` (`uid`, `active`) VALUES
('aaa', 0),
('jay', 0),
('parimal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_tbetstationinfo`
--

CREATE TABLE `tmsdatabase_tbetstationinfo` (
  `tbsid` int(11) NOT NULL,
  `src` varchar(50) NOT NULL,
  `dst` varchar(50) NOT NULL,
  `atime` varchar(15) NOT NULL,
  `dtime` varchar(15) NOT NULL,
  `tid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmsdatabase_train`
--

CREATE TABLE `tmsdatabase_train` (
  `tid` int(11) NOT NULL,
  `tname` varchar(55) NOT NULL,
  `spoint` varchar(50) NOT NULL,
  `epoint` varchar(50) NOT NULL,
  `btype` varchar(20) NOT NULL,
  `noofcoach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tmsdatabase_bbetstationinfo`
--
ALTER TABLE `tmsdatabase_bbetstationinfo`
  ADD PRIMARY KEY (`betsid`),
  ADD KEY `tmsdatabase_bbetstat_bid_id_ad76bac8_fk_tmsdataba` (`bid_id`);

--
-- Indexes for table `tmsdatabase_bseatbooked`
--
ALTER TABLE `tmsdatabase_bseatbooked`
  ADD PRIMARY KEY (`bsbid`);

--
-- Indexes for table `tmsdatabase_bus`
--
ALTER TABLE `tmsdatabase_bus`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `tmsdatabase_coach`
--
ALTER TABLE `tmsdatabase_coach`
  ADD PRIMARY KEY (`coid`),
  ADD KEY `tmsdatabase_coach_tid_id_b81ecf92_fk_tmsdatabase_train_tid` (`tid_id`);

--
-- Indexes for table `tmsdatabase_flight`
--
ALTER TABLE `tmsdatabase_flight`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `tmsdatabase_fseatbooked`
--
ALTER TABLE `tmsdatabase_fseatbooked`
  ADD PRIMARY KEY (`fsbid`);

--
-- Indexes for table `tmsdatabase_hotels`
--
ALTER TABLE `tmsdatabase_hotels`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `tmsdatabase_hroombooked`
--
ALTER TABLE `tmsdatabase_hroombooked`
  ADD PRIMARY KEY (`rbid`);

--
-- Indexes for table `tmsdatabase_isuseractive`
--
ALTER TABLE `tmsdatabase_isuseractive`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `tmsdatabase_tbetstationinfo`
--
ALTER TABLE `tmsdatabase_tbetstationinfo`
  ADD PRIMARY KEY (`tbsid`),
  ADD KEY `tmsdatabase_tbetstat_tid_id_e011d825_fk_tmsdataba` (`tid_id`);

--
-- Indexes for table `tmsdatabase_train`
--
ALTER TABLE `tmsdatabase_train`
  ADD PRIMARY KEY (`tid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tmsdatabase_bbetstationinfo`
--
ALTER TABLE `tmsdatabase_bbetstationinfo`
  MODIFY `betsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tmsdatabase_bseatbooked`
--
ALTER TABLE `tmsdatabase_bseatbooked`
  MODIFY `bsbid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tmsdatabase_fseatbooked`
--
ALTER TABLE `tmsdatabase_fseatbooked`
  MODIFY `fsbid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tmsdatabase_hroombooked`
--
ALTER TABLE `tmsdatabase_hroombooked`
  MODIFY `rbid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tmsdatabase_bbetstationinfo`
--
ALTER TABLE `tmsdatabase_bbetstationinfo`
  ADD CONSTRAINT `tmsdatabase_bbetstat_bid_id_ad76bac8_fk_tmsdataba` FOREIGN KEY (`bid_id`) REFERENCES `tmsdatabase_bus` (`bid`);

--
-- Constraints for table `tmsdatabase_coach`
--
ALTER TABLE `tmsdatabase_coach`
  ADD CONSTRAINT `tmsdatabase_coach_tid_id_b81ecf92_fk_tmsdatabase_train_tid` FOREIGN KEY (`tid_id`) REFERENCES `tmsdatabase_train` (`tid`);

--
-- Constraints for table `tmsdatabase_tbetstationinfo`
--
ALTER TABLE `tmsdatabase_tbetstationinfo`
  ADD CONSTRAINT `tmsdatabase_tbetstat_tid_id_e011d825_fk_tmsdataba` FOREIGN KEY (`tid_id`) REFERENCES `tmsdatabase_train` (`tid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
