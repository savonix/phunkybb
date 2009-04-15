<?php
/* <!--
Program: PhunkyBB
Component: logout.php
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
--> */


if($_GET['nid']=='logout') {
    $auth = &new Nexista_Auth();
    $auth->removeUser();
    $auth->removeUser();

    unset($_SESSION['NX_AUTH']);
    Nexista_Flow::delete('logged_in');
    Nexista_Flow::add('logged_in', 'false');
    session_start();

    // Unset all of the session variables.
    $_SESSION = array();

    // If it's desired to kill the session, also delete the session cookie.
    // Note: This will destroy the session, and not just the session data!
    if (isset($_COOKIE[session_name()])) {
       setcookie(session_name(), '', time()-42000, '/');
    }

    // Finally, destroy the session.
    session_destroy();
}


?>