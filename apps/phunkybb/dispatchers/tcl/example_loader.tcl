<%
#global robo_path
set robo_path "/var/www/dev/robotizeme"

source /var/www/dev/phunkybb/apps/phunkybb/dispatchers/tcl/phunkybb.tcl
%>

<%


init::start /var/www/dev/phunkybb/config/config.xml

set gate [ns_queryget nid]

init::process_gate $gate

ns_puts [init::display]


ns_puts [init::stop]

%>
