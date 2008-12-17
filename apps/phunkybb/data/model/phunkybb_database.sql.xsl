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



CREATE TABLE <xsl:value-of select="//db_engines/if_not_exists/text"/> <xsl:value-of select="//_get/table_prefix"/>categories (
  id <xsl:value-of select="//db_engines/engine_auto_increment/text"/>,
  cat_name varchar(80) NOT NULL default 'New Category',
  disp_position <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  PRIMARY KEY  (id)
) <xsl:value-of select="//db_engines/innodb_engine/text"/> <xsl:value-of select="//db_engines/engine_increment_start/text"/> ;

CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>config (
  conf_name varchar(255) NOT NULL default '',
  conf_value text,
  PRIMARY KEY  (conf_name)
) <xsl:value-of select="//db_engines/myisam_engine/text"/>;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>forums (
  id <xsl:value-of select="//db_engines/engine_auto_increment/text"/>,
  forum_name varchar(80) NOT NULL default 'New forum',
  forum_basename varchar(80) NOT NULL default 'new_forum',
  forum_desc text,
  redirect_url varchar(100) default NULL,
  moderators text,
  num_topics <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  num_posts <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  last_post <xsl:value-of select="//db_engines/integer/text"/> default NULL,
  last_post_id <xsl:value-of select="//db_engines/integer/text"/> default NULL,
  last_poster varchar(200) default NULL,
  sort_by <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  disp_position <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  cat_id <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  PRIMARY KEY  (id)<xsl:if test="//engine='mysqli'">,
  KEY <xsl:value-of select="//_get/table_prefix"/>forum_cat_id_idx (cat_id)</xsl:if>
) <xsl:value-of select="//db_engines/innodb_engine/text"/> <xsl:value-of select="//db_engines/engine_increment_start/text"/> ;




CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>posts (
  id <xsl:value-of select="//db_engines/engine_auto_increment/text"/>,
  poster varchar(200) NOT NULL default '',
  poster_id int(10) NOT NULL default '1',
  poster_ip varchar(15) default NULL,
  poster_email varchar(50) default NULL,
  message text,
  hide_smilies <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  posted int(10) NOT NULL default '0',
  edited int(10) default NULL,
  edited_by varchar(200) default NULL,
  topic_id int(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>posts_topic_id_idx (topic_id),
  KEY <xsl:value-of select="//_get/table_prefix"/>posts_multi_idx (poster_id,topic_id)
) <xsl:value-of select="//db_engines/innodb_engine/text"/> <xsl:value-of select="//db_engines/engine_increment_start/text"/> ;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>subscriptions (
  user_id int(10) NOT NULL default '0',
  topic_id int(10) NOT NULL default '0',
  sent int(10) NOT NULL default '0',
  PRIMARY KEY  (user_id,topic_id)
) <xsl:value-of select="//db_engines/innodb_engine/text"/>;


CREATE TABLE <xsl:value-of select="f_not_exists"/> <xsl:value-of select="//_get/table_prefix"/>topics (
  id <xsl:value-of select="//db_engines/engine_auto_increment/text"/>,
  poster varchar(200) NOT NULL default '',
  subject varchar(255) NOT NULL default '',
  basename varchar(255) NOT NULL default '',
  posted int(10) NOT NULL default '0',
  last_post int(10) NOT NULL default '0',
  last_post_id int(10) NOT NULL default '0',
  last_poster varchar(200) default NULL,
  num_views mediumint(8) NOT NULL default '0',
  num_replies mediumint(8) NOT NULL default '0',
  closed <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  sticky <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  moved_to int(10) default NULL,
  forum_id int(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>topics_forum_id_idx (forum_id),
  KEY <xsl:value-of select="//_get/table_prefix"/>topics_moved_to_idx (moved_to)
) <xsl:value-of select="//db_engines/innodb_engine/text"/> <xsl:value-of select="//db_engines/engine_increment_start/text"/> ;


CREATE TABLE <xsl:value-of select="//db_engines/if_not_exists/text"/> <xsl:value-of select="//_get/table_prefix"/>users (
  id <xsl:value-of select="//db_engines/engine_auto_increment/text"/>,
  group_id int(10) NOT NULL default '4',
  username varchar(200) NOT NULL default '',
  password varchar(40) NOT NULL default '',
  email varchar(50) NOT NULL default '',
  url varchar(100) default NULL,
  location varchar(30) default NULL,
  use_avatar <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '0',
  signature text,
  email_setting <xsl:value-of select="//db_engines/integer/text"/> NOT NULL default '1',
  num_posts int(10) NOT NULL default '0',
  last_post int(10) default NULL,
  registered int(10) NOT NULL default '0',
  registration_ip varchar(15) NOT NULL default '0.0.0.0',
  last_visit int(10) NOT NULL default '0',
  admin_note varchar(30) default NULL,
  activate_string varchar(50) default NULL,
  activate_key varchar(8) default NULL,
  PRIMARY KEY  (id),
  KEY <xsl:value-of select="//_get/table_prefix"/>users_registered_idx (registered),
  KEY <xsl:value-of select="//_get/table_prefix"/>users_username_idx (username(8))
) <xsl:value-of select="//db_engines/innodb_engine/text"/> <xsl:value-of select="//db_engines/engine_increment_start/text"/> ;


ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>forums
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>forums_ibfk_1 FOREIGN KEY (cat_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>categories (id);

ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>posts
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>posts_ibfk_1 FOREIGN KEY (topic_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>topics (id) ON DELETE CASCADE;

ALTER TABLE <xsl:value-of select="//_get/table_prefix"/>topics
  ADD CONSTRAINT <xsl:value-of select="//_get/table_prefix"/>topics_ibfk_1 FOREIGN KEY (forum_id) REFERENCES <xsl:value-of select="//_get/table_prefix"/>forums (id);


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
