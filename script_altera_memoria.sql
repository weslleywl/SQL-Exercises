alter system set sga_max_size=6g scope=spfile;
alter system set sga_target=5g scope=spfile;
alter system set pga_aggregate_target=1g scope=spfile;


create pfile from spfile;
create spfile from pfile='<init..._ora>';
