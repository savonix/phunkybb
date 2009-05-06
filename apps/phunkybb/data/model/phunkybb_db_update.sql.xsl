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


ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>categories` ADD `site_id` <xsl:value-of select="//dbe/integer"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>categories` SET `site_id`=<xsl:value-of select="//_get/site_id"/>;

ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>config` ADD `site_id` <xsl:value-of select="//dbe/integer"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>config` SET `site_id`=<xsl:value-of select="//_get/site_id"/>;

ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>forums` ADD `site_id` <xsl:value-of select="//dbe/integer"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>forums` SET `site_id`=<xsl:value-of select="//_get/site_id"/>;

ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>posts` ADD `site_id` <xsl:value-of select="//dbe/integer"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>posts` SET `site_id`=<xsl:value-of select="//_get/site_id"/>;

ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>topics` ADD `site_id` <xsl:value-of select="//dbe/integer"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>topics` SET `site_id`=<xsl:value-of select="//_get/site_id"/>;



UPDATE `<xsl:value-of select="//_get/table_prefix"/>categories` SET `id` = `id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;
UPDATE `<xsl:value-of select="//_get/table_prefix"/>forums`  SET `cat_id` = `cat_id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;
UPDATE `<xsl:value-of select="//_get/table_prefix"/>forums`  SET `id` = `id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>users`  SET `id` = `id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;
UPDATE `<xsl:value-of select="//_get/table_prefix"/>posts`  SET `poster_id` = `poster_id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;


ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>users`
  DROP `title`,
  DROP `realname`,
  DROP `email`,
  DROP `jabber`,
  DROP `icq`,
  DROP `msn`,
  DROP `aim`,
  DROP `disp_topics`,
  DROP `disp_posts`,
  DROP `email_setting`,
  DROP `save_pass`,
  DROP `notify_with_post`,
  DROP `show_smilies`,
  DROP `show_img`,
  DROP `show_img_sig`,
  DROP `show_avatars`,
  DROP `show_sig`,
  DROP `timezone`,
  DROP `language`,
  DROP `num_posts`,
  DROP `last_post`,
  DROP `registered`,
  DROP `registration_ip`,
  DROP `last_visit`,
  DROP `admin_note`,
  DROP `activate_string`,
  DROP `activate_key`,
  DROP `style`,
  DROP `yahoo`;


  
ALTER TABLE `<xsl:value-of select="//_get/table_prefix"/>posts`
  DROP `id`,
  DROP `poster_ip`,
  DROP `poster_email`;
UPDATE `<xsl:value-of select="//_get/table_prefix"/>posts` SET `topic_id` = `topic_id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;

UPDATE `<xsl:value-of select="//_get/table_prefix"/>topics` SET `forum_id` = `forum_id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;
UPDATE `<xsl:value-of select="//_get/table_prefix"/>topics` SET `id` = `id` + <xsl:value-of select="//_get/site_id"/> + <xsl:value-of select="//_get/site_id"/>;

RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>categories`  TO `forums_categories` ;
RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>forums`  TO `forums_forums` ;
RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>posts`  TO `forums_posts` ;
RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>topics`  TO `forums_topics` ;
RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>config`  TO `forums_config` ;
RENAME TABLE `<xsl:value-of select="//_get/table_prefix"/>users`  TO `forums_users` ;

UPDATE `forums_topics` SET basename=LOWER(REPLACE(`subject`,' ','_')) WHERE `basename` = '' OR `basename` is NULL;

UPDATE `forums_forums` SET `forum_basename` = LOWER(REPLACE(`forum_name`,' ','_'))
</xsl:template>
</xsl:stylesheet>
