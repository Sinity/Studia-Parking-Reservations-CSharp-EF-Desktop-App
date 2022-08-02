
--select * from Parkings;
--select * from ParkingPlaces;
--select * from ReservationSlots;
--select * from Reservations;

insert into Parkings values('Parking główny');
insert into Parkings values('Parking dodatkowy');

insert into ParkingPlaces values('1/1', 1);
insert into ParkingPlaces values('1/2', 1);
insert into ParkingPlaces values('1/3', 1);
insert into ParkingPlaces values('1/4', 1);
insert into ParkingPlaces values('2/1', 2);
insert into ParkingPlaces values('2/2', 2);

insert into Reservations values('06/10/2019 10:29:26', 'SBI 1155', 'f2@#RFfdC'); 
insert into Reservations values('06/10/2019 12:44:13', 'WA 2474', '23v@#$f32');
insert into Reservations values('06/12/2019 9:51:17', 'SBI 3351', 'C@#f32WEQ');
insert into Reservations values('06/13/2019 17:17:51', 'STH 4612', 'CSWDF234#EW'); 
insert into Reservations values('06/15/2019 6:54:25', 'SBI 5666', 'FW23rSDA232');
insert into Reservations values('06/15/2019 23:31:11', 'SB 6337', 'fsa@#$fd23d'); 
insert into Reservations values('06/16/2019 21:22:37', 'SB 7337', 'qqq@#$fd2y*');

-- main: every day, from 10-14 every hour
insert into ReservationSlots values(1, '06/17/2019 10:00:00', '06/17/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(1, '06/17/2019 11:00:00', '06/17/2019 12:00:00', 25.50, 1);
insert into ReservationSlots values(1, '06/17/2019 12:00:00', '06/17/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(1, '06/17/2019 13:00:00', '06/17/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(1, '06/18/2019 10:00:00', '06/18/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(1, '06/18/2019 11:00:00', '06/18/2019 12:00:00', 25.50, 1);
insert into ReservationSlots values(1, '06/18/2019 12:00:00', '06/18/2019 13:00:00', 28.00, 1);
insert into ReservationSlots values(1, '06/18/2019 13:00:00', '06/18/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(1, '06/19/2019 10:00:00', '06/19/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(1, '06/19/2019 11:00:00', '06/19/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(1, '06/19/2019 12:00:00', '06/19/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(1, '06/19/2019 13:00:00', '06/19/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(1, '06/20/2019 10:00:00', '06/20/2019 11:00:00', 25.50, 4);
insert into ReservationSlots values(1, '06/20/2019 11:00:00', '06/20/2019 12:00:00', 25.50, 4);
insert into ReservationSlots values(1, '06/20/2019 12:00:00', '06/20/2019 13:00:00', 28.00, 4);
insert into ReservationSlots values(1, '06/20/2019 13:00:00', '06/20/2019 14:00:00', 30.00, null);

insert into ReservationSlots values(2, '06/17/2019 10:00:00', '06/17/2019 11:00:00', 25.50, 2);
insert into ReservationSlots values(2, '06/17/2019 11:00:00', '06/17/2019 12:00:00', 25.50, 2);
insert into ReservationSlots values(2, '06/17/2019 12:00:00', '06/17/2019 13:00:00', 28.00, 2);
insert into ReservationSlots values(2, '06/17/2019 13:00:00', '06/17/2019 14:00:00', 30.00, 2);
insert into ReservationSlots values(2, '06/18/2019 10:00:00', '06/18/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(2, '06/18/2019 11:00:00', '06/18/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(2, '06/18/2019 12:00:00', '06/18/2019 13:00:00', 28.00, 1);
insert into ReservationSlots values(2, '06/18/2019 13:00:00', '06/18/2019 14:00:00', 30.00, 1);
insert into ReservationSlots values(2, '06/19/2019 10:00:00', '06/19/2019 11:00:00', 25.50, 1);
insert into ReservationSlots values(2, '06/19/2019 11:00:00', '06/19/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(2, '06/19/2019 12:00:00', '06/19/2019 13:00:00', 28.00, 7);
insert into ReservationSlots values(2, '06/19/2019 13:00:00', '06/19/2019 14:00:00', 30.00, 2);
insert into ReservationSlots values(2, '06/20/2019 10:00:00', '06/20/2019 11:00:00', 25.50, 7);
insert into ReservationSlots values(2, '06/20/2019 11:00:00', '06/20/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(2, '06/20/2019 12:00:00', '06/20/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(2, '06/20/2019 13:00:00', '06/20/2019 14:00:00', 30.00, 5);

insert into ReservationSlots values(3, '06/17/2019 10:00:00', '06/17/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(3, '06/17/2019 11:00:00', '06/17/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(3, '06/17/2019 12:00:00', '06/17/2019 13:00:00', 28.00, 3);
insert into ReservationSlots values(3, '06/17/2019 13:00:00', '06/17/2019 14:00:00', 30.00, 3);
insert into ReservationSlots values(3, '06/18/2019 10:00:00', '06/18/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(3, '06/18/2019 11:00:00', '06/18/2019 12:00:00', 25.50, 3);
insert into ReservationSlots values(3, '06/18/2019 12:00:00', '06/18/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(3, '06/18/2019 13:00:00', '06/18/2019 14:00:00', 30.00, 4);
insert into ReservationSlots values(3, '06/19/2019 10:00:00', '06/19/2019 11:00:00', 25.50, 2);
insert into ReservationSlots values(3, '06/19/2019 11:00:00', '06/19/2019 12:00:00', 25.50, 2);
insert into ReservationSlots values(3, '06/19/2019 12:00:00', '06/19/2019 13:00:00', 28.00, 2);
insert into ReservationSlots values(3, '06/19/2019 13:00:00', '06/19/2019 14:00:00', 30.00, 2);
insert into ReservationSlots values(3, '06/20/2019 10:00:00', '06/20/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(3, '06/20/2019 11:00:00', '06/20/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(3, '06/20/2019 12:00:00', '06/20/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(3, '06/20/2019 13:00:00', '06/20/2019 14:00:00', 30.00, null);

insert into ReservationSlots values(4, '06/17/2019 10:00:00', '06/17/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(4, '06/17/2019 11:00:00', '06/17/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(4, '06/17/2019 12:00:00', '06/17/2019 13:00:00', 28.00, 7);
insert into ReservationSlots values(4, '06/17/2019 13:00:00', '06/17/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(4, '06/18/2019 10:00:00', '06/18/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(4, '06/18/2019 11:00:00', '06/18/2019 12:00:00', 25.50, 7);
insert into ReservationSlots values(4, '06/18/2019 12:00:00', '06/18/2019 13:00:00', 28.00, null);
insert into ReservationSlots values(4, '06/18/2019 13:00:00', '06/18/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(4, '06/19/2019 10:00:00', '06/19/2019 11:00:00', 25.50, 7);
insert into ReservationSlots values(4, '06/19/2019 11:00:00', '06/19/2019 12:00:00', 25.50, null);
insert into ReservationSlots values(4, '06/19/2019 12:00:00', '06/19/2019 13:00:00', 28.00, 7);
insert into ReservationSlots values(4, '06/19/2019 13:00:00', '06/19/2019 14:00:00', 30.00, null);
insert into ReservationSlots values(4, '06/20/2019 10:00:00', '06/20/2019 11:00:00', 25.50, null);
insert into ReservationSlots values(4, '06/20/2019 11:00:00', '06/20/2019 12:00:00', 25.50, 7);
insert into ReservationSlots values(4, '06/20/2019 12:00:00', '06/20/2019 13:00:00', 28.00, 7);
insert into ReservationSlots values(4, '06/20/2019 13:00:00', '06/20/2019 14:00:00', 30.00, null);

-- side: only weekends, 10-12  every 30m : 15, 16, 22, 23
insert into ReservationSlots values(5, '06/15/2019 10:00:00', '06/15/2019 10:30:00', 31, 3);
insert into ReservationSlots values(5, '06/15/2019 10:30:00', '06/15/2019 11:00:00', 31, 3);
insert into ReservationSlots values(5, '06/15/2019 11:00:00', '06/15/2019 11:30:00', 35, null);
insert into ReservationSlots values(5, '06/15/2019 11:30:00', '06/15/2019 12:00:00', 30, null);
insert into ReservationSlots values(5, '06/16/2019 10:00:00', '06/16/2019 10:30:00', 31, 7);
insert into ReservationSlots values(5, '06/16/2019 10:30:00', '06/16/2019 11:00:00', 31, null);
insert into ReservationSlots values(5, '06/16/2019 11:00:00', '06/16/2019 11:30:00', 35, null);
insert into ReservationSlots values(5, '06/16/2019 11:30:00', '06/16/2019 12:00:00', 30, null);
insert into ReservationSlots values(5, '06/22/2019 10:00:00', '06/22/2019 10:30:00', 31, 5);
insert into ReservationSlots values(5, '06/22/2019 10:30:00', '06/22/2019 11:00:00', 31, 5);
insert into ReservationSlots values(5, '06/22/2019 11:00:00', '06/22/2019 11:30:00', 35, 5);
insert into ReservationSlots values(5, '06/22/2019 11:30:00', '06/22/2019 12:00:00', 30, 5);
insert into ReservationSlots values(5, '06/23/2019 10:00:00', '06/23/2019 10:30:00', 31, 3);
insert into ReservationSlots values(5, '06/23/2019 10:30:00', '06/23/2019 11:00:00', 31, 3);
insert into ReservationSlots values(5, '06/23/2019 11:00:00', '06/23/2019 11:30:00', 35, null);
insert into ReservationSlots values(5, '06/23/2019 11:30:00', '06/23/2019 12:00:00', 30, null);

insert into ReservationSlots values(6, '06/15/2019 10:00:00', '06/15/2019 10:30:00', 31, null);
insert into ReservationSlots values(6, '06/15/2019 10:30:00', '06/15/2019 11:00:00', 31, 7);
insert into ReservationSlots values(6, '06/15/2019 11:00:00', '06/15/2019 11:30:00', 35, null);
insert into ReservationSlots values(6, '06/15/2019 11:30:00', '06/15/2019 12:00:00', 30, null);
insert into ReservationSlots values(6, '06/16/2019 10:00:00', '06/16/2019 10:30:00', 31, 7);
insert into ReservationSlots values(6, '06/16/2019 10:30:00', '06/16/2019 11:00:00', 31, 7);
insert into ReservationSlots values(6, '06/16/2019 11:00:00', '06/16/2019 11:30:00', 35, 7);
insert into ReservationSlots values(6, '06/16/2019 11:30:00', '06/16/2019 12:00:00', 30, 7);
insert into ReservationSlots values(6, '06/22/2019 10:00:00', '06/22/2019 10:30:00', 31, 7);
insert into ReservationSlots values(6, '06/22/2019 10:30:00', '06/22/2019 11:00:00', 31, 7);
insert into ReservationSlots values(6, '06/22/2019 11:00:00', '06/22/2019 11:30:00', 35, 7);
insert into ReservationSlots values(6, '06/22/2019 11:30:00', '06/22/2019 12:00:00', 30, 7);
insert into ReservationSlots values(6, '06/23/2019 10:00:00', '06/23/2019 10:30:00', 31, 7);
insert into ReservationSlots values(6, '06/23/2019 10:30:00', '06/23/2019 11:00:00', 31, null);
insert into ReservationSlots values(6, '06/23/2019 11:00:00', '06/23/2019 11:30:00', 35, null);
insert into ReservationSlots values(6, '06/23/2019 11:30:00', '06/23/2019 12:00:00', 30, null);

