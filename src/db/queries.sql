-- Get list of cinema name with total no of hall in each cinema 

select cinema_mast.name, cinema_mast.total_cinema_hall from book_my_show.cinema_master cinema_mast
	inner join book_my_show.city_master city_mast
		on cinema_mast.city_master_id = city_mast.id
 where city_mast.id = (SELECT id FROM book_my_show.city_master where name = 'Nagpur');

-- Get list of cinema name with total no of hall in each cinema as per city and date

 SELECT 
	show_mast.date,
    show_mast.start_time,
    show_mast.end_time,
    movie_mast.movie_title,
    movie_mast.duration,
    movie_mast.release_date,
    movie_mast.genre,
    cinema_hall_mast.name,
    cinema_hall_mast.total_seat,
    cinema_mast.name,
    cinema_mast.total_cinema_hall,
    city_mast.name
    
FROM book_my_show.show_master show_mast 
	 inner join book_my_show.movie_master movie_mast
		on movie_mast.id = show_mast.movie_master_id    
	inner join book_my_show.cinema_hall_master cinema_hall_mast
		on cinema_hall_mast.id = show_mast.cinema_hall_master_id
    inner join book_my_show.cinema_master cinema_mast
		on cinema_mast.id = cinema_hall_mast.cinema_master_id
    inner join book_my_show.city_master city_mast
		on city_mast.id = cinema_mast.city_master_id    

where show_mast.date = '2023-09-11 00:00:00' and city_mast.name = 'Nagpur'; 