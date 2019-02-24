

SELECT m.nom,  CAST(FROM_UNIXTIME(c.tdeb) as datetime), CAST(FROM_UNIXTIME(c.tfin) as datetime)
from creneau as c 
inner join matiere as m
on m.id_mat = c.id_mat
where CAST(FROM_UNIXTIME(c.tdeb) as date) > CAST(FROM_UNIXTIME(1539554400) as date) - INTERVAL (WEEKDAY(CAST(FROM_UNIXTIME(1539554400) as date)) -7) DAY

and  CAST(FROM_UNIXTIME(c.tdeb) as date) < CAST(FROM_UNIXTIME(1539554400) as date) - INTERVAL (WEEKDAY(CAST(FROM_UNIXTIME(1539554400) as date))) DAY
and c.id_grpe = (select g.id_grpe from etu_grps g where g.id_etu = 1)