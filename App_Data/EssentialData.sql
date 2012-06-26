USE baxtech_clinic
GO

INSERT BedType(Description)       VALUES('Gatch')
INSERT BedType(Description)       VALUES('Electric')
INSERT BedType(Description)       VALUES('Stretcher')
INSERT BedType(Description)       VALUES('Low')
INSERT BedType(Description)       VALUES('Low Air Loss')
INSERT BedType(Description)       VALUES('Circo-electric')
INSERT BedType(Description)       VALUES('Clinitron')
GO

INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Emergency I',convert(money,'180.00'),'3')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Emergency II',convert(money,'180.00'),'3')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward A I',convert(money,'150.00'),'2')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward A II',convert(money,'150.00'),'2')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward A III',convert(money,'150.00'),'2')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward A IV',convert(money,'150.00'),'2')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward B I',convert(money,'100.00'),'1')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward B II',convert(money,'100.00'),'1')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward B III',convert(money,'100.00'),'1')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Ward B IV',convert(money,'100.00'),'1')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Elderly Care I',convert(money,'120.00'),'4')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Elderly Care II',convert(money,'120.00'),'4')
INSERT Bed(BedName,RatePerDay,BedTypeId)       VALUES('Elderly Care III',convert(money,'180.00'),'7')
GO

INSERT Doctor(Name,Address,Phone)       VALUES('William Sung','12 Carlton Pde, Melbourne 3000','+61432032123')
INSERT Doctor(Name,Address,Phone)       VALUES('Adam Manler','56 Place st, Kensington 2353','+61431341684')
INSERT Doctor(Name,Address,Phone)       VALUES('Bill Cleaton','2 / 123 Bill st, Clayton 3125','+61421435238')
INSERT Doctor(Name,Address,Phone)       VALUES('Robert Lollington','67 Ballard st, Eltham','+61432857398')
INSERT Doctor(Name,Address,Phone)       VALUES('Lance Ackermann','43 Middle pl, Brighton 1235','+61435398506')
GO

