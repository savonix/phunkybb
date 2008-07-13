<%
#global robo_path
set robo_path "/var/www/dev/robotizeme"

source /var/www/dev/phunkybb/apps/phunkybb/dispatchers/tcl/phunkybb.tcl
%>

<%

set db [ns_db gethandle postgres_pool]
ns_db select $db "SHOW SERVER_VERSION"
ns_db getrow $db t0
ns_puts [ns_set array t0]


init::start /var/www/dev/phunkybb/config/config.xml

set gate [ns_queryget nid]

init::process_gate $gate



ns_puts [init::display $gate]


ns_puts [init::stop]

%>
