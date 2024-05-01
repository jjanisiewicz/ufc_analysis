/* total fighters in ufc history*/
select 
	count(*) 	as total_fighters 
from 	
	(
select 
	 r_fighter
from ufcc 
union 
select 
	b_fighter 
from ufcc
	) fighters 
	
-- number of fights 
select 
	count(r_fighter)
from ufcc 	

-- results wins and draw 	
	select 
		count(r_fighter) as figthers 
		,status 
	from ufcc
group by 2	

-- fighters with the most wins in history 
select 
	r_fighter 
	,count(status) 		as most_wins 
from ufcc 
group by 1 
order by 2 desc 
limit 10 

-- the number of ufc events per locations 
select 
	location 
	,count(event)  as events_per_location 
from ufcc 
group by 1
order by 2 desc 

-- number of ending fights per method 
select 
	method 	
	,count(r_fighter) 	as nr_of_method_ending_fights  
from ufcc 
group by 1 
order by 2 desc 

-- number of fights per weight class
select 
	weight_class  
	,count(r_fighter) 	as fights
from ufcc 
group by 1 
order by 2 desc 


-- fighter who spent the most time in cage 
	
select 
	fighter_name  
	,sec_to_time(sum(rounds	* time_to_sec(round_time))) as time_spend
from 			
	(
	select 
		r_fighter      as fighter_name 
		,rounds 
		,round_time
	from ufcc 
	union all
	select  
		b_fighter		as fighter_name
		,rounds 
		,round_time  
	from ufcc 
	) combined_table 
group by fighter_name
order by time_spend desc 


-- longest avg. fight time 
select 
	fighter_name 
	,round(avg(rounds * time_to_sec(round_time) / 60 ),2 ) 	as fight_time
from 
 (
	select 
		r_fighter      as fighter_name 
		,rounds 
		,round_time
	from ufcc 
	union all
	select  
		b_fighter		as fighter_name
		,rounds 
		,round_time  
	from ufcc 
 ) lalal
 group by fighter_name 
 order by fight_time desc 

 
 -- total fights 
 select 
 	fighters
 	,count(fighters)	as total_fights 
 from 
 (
 select 
	 r_fighter	as fighters
from ufcc 
union all
select 
	b_fighter 	as fighters 
from ufcc
	) xxx
group by fighters 
order by total_fights desc 


-- the rarest methods of ending a fight

select 
	method_detailed  	
	,count(r_fighter) 	as nr_of_method_ending_fights  
from ufcc 
group by 1 
order by 2 
limit 10 
