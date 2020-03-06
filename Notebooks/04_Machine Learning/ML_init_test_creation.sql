    create table iri_usda_2019_db.init_test
        with(
        format = 'Parquet',
        parquet_compression = 'SNAPPY'
        )
        as
        SELECT *
        FROM iri_usda.demo_all
        WHERE ((ac in (1,4,5,7) and 
        (
        (hhinc <= 5 and hhsize = 1) or (hhinc <= 6 and hhsize = 2) or (hhinc <= 7 and hhsize = 3) or 
        (hhinc <= 8 and hhsize = 4) or (hhinc <= 9 and hhsize = 5) or (hhinc <= 10 and hhsize = 6) or 
            (hhinc <= 11 and (hhsize = 8 or hhsize = 7))
        ) 
        and wic_june != 1) or wic_june = 1) and year = '2015' and projection61k > 0 and panid in 
	        (
	        select distinct panid
	        from iri_usda.demo_all
	        where projection61k > 0 and year = '2016'
	        );