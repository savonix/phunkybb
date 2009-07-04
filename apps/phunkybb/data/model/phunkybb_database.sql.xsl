<!--
Program: PhunkyBB
Component: phunkybb_database.sql.xsl
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
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">

CREATE TABLE <xsl:value-of select="//dbe/if_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>sites (
  site_id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  http_host varchar(200) NOT NULL default '',
  PRIMARY KEY (site_id)
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>config (
  conf_id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  conf_name varchar(255) NOT NULL default '',
  conf_value text,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY  (conf_id)
) <xsl:value-of select="//dbe/myisam_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;

CREATE TABLE <xsl:value-of select="//dbe/if_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>categories (
  id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  cat_name varchar(80) NOT NULL default 'New Category',
  disp_position <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY (id)
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>forums (
  id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  forum_name varchar(80) NOT NULL default 'New forum',
  forum_basename varchar(80) NOT NULL default 'new_forum',
  forum_desc text,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  num_topics <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  num_posts <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  last_post <xsl:value-of select="//dbe/integer"/> default NULL,
  last_post_id <xsl:value-of select="//dbe/integer"/> default NULL,
  last_poster varchar(200) default NULL,
  disp_position <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  cat_id <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  PRIMARY KEY  (id)<xsl:if test="//engine='mysqli'">,
  KEY <xsl:value-of select="//_get/table_prefix"/>forum_cat_id_idx (cat_id)</xsl:if>
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>topics (
  id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  poster varchar(200) NOT NULL default '',
  subject varchar(255) NOT NULL default '',
  basename varchar(255) NOT NULL default '',
  posted <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  last_post <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  last_post_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  last_poster varchar(200) default NULL,
  num_views <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  num_replies <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  closed <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  sticky <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  moved_to <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  forum_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>topics_forum_id_idx (forum_id),
  KEY <xsl:value-of select="//_get/table_prefix"/>topics_moved_to_idx (moved_to)
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>posts (
  id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  poster_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  message text,
  posted <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  post_status <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  edited <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  edited_by_user_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  topic_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>posts_topic_id_idx (topic_id),
  KEY <xsl:value-of select="//_get/table_prefix"/>posts_multi_idx (poster_id,topic_id)
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>subscriptions (
  user_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  topic_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  sent <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY  (user_id,topic_id)
) <xsl:value-of select="//dbe/innodb_engine"/>;



CREATE TABLE <xsl:value-of select="//dbe/if_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>users (
  id <xsl:value-of select="//dbe/engine_auto_increment"/>,
  group_id int(10) NOT NULL default '4',
  username varchar(200) NOT NULL default '',
  password varchar(40) NOT NULL default '',
  email varchar(50) NOT NULL default '',
  url varchar(100) default NULL,
  location varchar(30) default NULL,
  picture varchar(255) default NULL,
  use_avatar <xsl:value-of select="//dbe/integer"/> NOT NULL default '0',
  signature text,
  email_setting <xsl:value-of select="//dbe/integer"/> NOT NULL default '1',
  num_posts <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  last_post <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  registered <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  registration_ip varchar(15) NOT NULL default '0.0.0.0',
  last_visit <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  admin_note varchar(30) default NULL,
  activate_string varchar(50) default NULL,
  activate_key varchar(8) default NULL,
  site_id <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>users_registered_idx (registered),
  KEY <xsl:value-of select="//_get/table_prefix"/>users_username_idx (username(8))
) <xsl:value-of select="//dbe/innodb_engine"/> <xsl:value-of select="//dbe/engine_increment_start"/> ;

CREATE TABLE <xsl:value-of select="//dbe/if_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>user_meta (
  `user_id` <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` varchar(255) NOT NULL,
  `site_id` <xsl:value-of select="//dbe/integer"/> <xsl:value-of select="//dbe/default_null"/>,
  UNIQUE KEY  (user_id,meta_key,site_id),
  KEY <xsl:value-of select="//_get/table_prefix"/>user_meta_idx (user_id)
) <xsl:value-of select="//dbe/innodb_engine"/>;


ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>forums
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>forums_ibfk_1 FOREIGN KEY (cat_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>categories (id);

ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>posts
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>posts_ibfk_1 FOREIGN KEY (topic_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>topics (id) ON DELETE CASCADE;

ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>topics
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>topics_ibfk_1 FOREIGN KEY (forum_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>forums (id);

ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>user_meta
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>users_ibfk_1 FOREIGN KEY (user_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>users (id);

INSERT INTO <xsl:value-of select="//_get/table_prefix"/>users (id, group_id, username, password, email,activate_key) VALUES
(2, 1, '<xsl:value-of select="//admin"/>', '<xsl:value-of select="//password"/>', '<xsl:value-of select="//email"/>',"active");


<!-- Extra -->
<!--
INSERT INTO wwwneofilmzcom_forums (id, forum_name, forum_desc, redirect_url, moderators, num_topics, num_posts, last_post, last_post_id, last_poster, sort_by, disp_position, cat_id) VALUES
(1, 'test', NULL, NULL, NULL, 12, 19, 0, 0, 'admin', 0, 0, 1)


INSERT INTO wwwneofilmzcom_categories (id, cat_name, disp_position) VALUES
(1, 'one', 0),
-->
</xsl:template>
</xsl:stylesheet>
