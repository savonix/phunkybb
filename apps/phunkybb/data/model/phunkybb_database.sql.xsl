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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cat_name` varchar(80) NOT NULL default 'New Category',
  `disp_position` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>config` (
  `conf_name` varchar(255) NOT NULL default '',
  `conf_value` text,
  PRIMARY KEY  (`conf_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>forums` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `forum_name` varchar(80) NOT NULL default 'New forum',
  `forum_desc` text,
  `redirect_url` varchar(100) default NULL,
  `moderators` text,
  `num_topics` mediumint(8) unsigned NOT NULL default '0',
  `num_posts` mediumint(8) unsigned NOT NULL default '0',
  `last_post` int(10) unsigned default NULL,
  `last_post_id` int(10) unsigned default NULL,
  `last_poster` varchar(200) default NULL,
  `sort_by` tinyint(1) NOT NULL default '0',
  `disp_position` int(10) NOT NULL default '0',
  `cat_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `<xsl:value-of select="//table_prefix"/>forum_cat_id_idx` (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>forum_perms` (
  `group_id` int(10) NOT NULL default '0',
  `forum_id` int(10) NOT NULL default '0',
  `read_forum` tinyint(1) NOT NULL default '1',
  `post_replies` tinyint(1) NOT NULL default '1',
  `post_topics` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>groups` (
  `g_id` int(10) unsigned NOT NULL auto_increment,
  `g_title` varchar(50) NOT NULL default '',
  `g_user_title` varchar(50) default NULL,
  `g_read_board` tinyint(1) NOT NULL default '1',
  `g_post_replies` tinyint(1) NOT NULL default '1',
  `g_post_topics` tinyint(1) NOT NULL default '1',
  `g_post_polls` tinyint(1) NOT NULL default '1',
  `g_edit_posts` tinyint(1) NOT NULL default '1',
  `g_delete_posts` tinyint(1) NOT NULL default '1',
  `g_delete_topics` tinyint(1) NOT NULL default '1',
  `g_set_title` tinyint(1) NOT NULL default '1',
  `g_search` tinyint(1) NOT NULL default '1',
  `g_search_users` tinyint(1) NOT NULL default '1',
  `g_edit_subjects_interval` smallint(6) NOT NULL default '300',
  `g_post_flood` smallint(6) NOT NULL default '30',
  `g_search_flood` smallint(6) NOT NULL default '30',
  PRIMARY KEY  (`g_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>online` (
  `user_id` int(10) unsigned NOT NULL default '1',
  `ident` varchar(200) NOT NULL default '',
  `logged` int(10) unsigned NOT NULL default '0',
  `idle` tinyint(1) NOT NULL default '0',
  UNIQUE KEY `<xsl:value-of select="//table_prefix"/>online_user_id_ident_idx` (`user_id`,`ident`),
  KEY `<xsl:value-of select="//table_prefix"/>online_user_id_idx` (`user_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>posts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `poster` varchar(200) NOT NULL default '',
  `poster_id` int(10) unsigned NOT NULL default '1',
  `poster_ip` varchar(15) default NULL,
  `poster_email` varchar(50) default NULL,
  `message` text,
  `hide_smilies` tinyint(1) NOT NULL default '0',
  `posted` int(10) unsigned NOT NULL default '0',
  `edited` int(10) unsigned default NULL,
  `edited_by` varchar(200) default NULL,
  `topic_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `<xsl:value-of select="//table_prefix"/>posts_topic_id_idx` (`topic_id`),
  KEY `<xsl:value-of select="//table_prefix"/>posts_multi_idx` (`poster_id`,`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;




CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>ranks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `rank` varchar(50) NOT NULL default '',
  `min_posts` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>subscriptions` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `topic_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>topics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `poster` varchar(200) NOT NULL default '',
  `subject` varchar(255) NOT NULL default '',
  `posted` int(10) unsigned NOT NULL default '0',
  `last_post` int(10) unsigned NOT NULL default '0',
  `last_post_id` int(10) unsigned NOT NULL default '0',
  `last_poster` varchar(200) default NULL,
  `num_views` mediumint(8) unsigned NOT NULL default '0',
  `num_replies` mediumint(8) unsigned NOT NULL default '0',
  `closed` tinyint(1) NOT NULL default '0',
  `sticky` tinyint(1) NOT NULL default '0',
  `moved_to` int(10) unsigned default NULL,
  `forum_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `<xsl:value-of select="//table_prefix"/>topics_forum_id_idx` (`forum_id`),
  KEY `<xsl:value-of select="//table_prefix"/>topics_moved_to_idx` (`moved_to`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `group_id` int(10) unsigned NOT NULL default '4',
  `username` varchar(200) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `title` varchar(50) default NULL,
  `realname` varchar(40) default NULL,
  `url` varchar(100) default NULL,
  `location` varchar(30) default NULL,
  `use_avatar` tinyint(1) NOT NULL default '0',
  `signature` text,
  `disp_topics` tinyint(3) unsigned default NULL,
  `disp_posts` tinyint(3) unsigned default NULL,
  `email_setting` tinyint(1) NOT NULL default '1',
  `save_pass` tinyint(1) NOT NULL default '1',
  `notify_with_post` tinyint(1) NOT NULL default '0',
  `show_smilies` tinyint(1) NOT NULL default '1',
  `show_img` tinyint(1) NOT NULL default '1',
  `show_img_sig` tinyint(1) NOT NULL default '1',
  `show_avatars` tinyint(1) NOT NULL default '1',
  `show_sig` tinyint(1) NOT NULL default '1',
  `timezone` float NOT NULL default '0',
  `language` varchar(25) NOT NULL default 'English',
  `style` varchar(25) NOT NULL default 'Oxygen',
  `num_posts` int(10) unsigned NOT NULL default '0',
  `last_post` int(10) unsigned default NULL,
  `registered` int(10) unsigned NOT NULL default '0',
  `registration_ip` varchar(15) NOT NULL default '0.0.0.0',
  `last_visit` int(10) unsigned NOT NULL default '0',
  `admin_note` varchar(30) default NULL,
  `activate_string` varchar(50) default NULL,
  `activate_key` varchar(8) default NULL,
  PRIMARY KEY  (`id`),
  KEY `<xsl:value-of select="//table_prefix"/>users_registered_idx` (`registered`),
  KEY `<xsl:value-of select="//table_prefix"/>users_username_idx` (`username`(8))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


ALTER TABLE `<xsl:value-of select="//table_prefix"/>forums`
  ADD CONSTRAINT `<xsl:value-of select="//table_prefix"/>forums_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `<xsl:value-of select="//table_prefix"/>categories` (`id`);

ALTER TABLE `<xsl:value-of select="//table_prefix"/>posts`
  ADD CONSTRAINT `<xsl:value-of select="//table_prefix"/>posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `<xsl:value-of select="//table_prefix"/>topics` (`id`) ON DELETE CASCADE;

ALTER TABLE `<xsl:value-of select="//table_prefix"/>topics`
  ADD CONSTRAINT `<xsl:value-of select="//table_prefix"/>topics_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `<xsl:value-of select="//table_prefix"/>forums` (`id`);

INSERT INTO `<xsl:value-of select="//table_prefix"/>groups` (`g_id`, `g_title`, `g_user_title`, `g_read_board`, `g_post_replies`, `g_post_topics`, `g_post_polls`, `g_edit_posts`, `g_delete_posts`, `g_delete_topics`, `g_set_title`, `g_search`, `g_search_users`, `g_edit_subjects_interval`, `g_post_flood`, `g_search_flood`) VALUES
(1, 'Administrators', 'Administrator', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(2, 'Moderators', 'Moderator', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(3, 'Guest', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0),
(4, 'Members', NULL, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 300, 60, 30);


INSERT INTO `<xsl:value-of select="//table_prefix"/>ranks` (`id`, `rank`, `min_posts`) VALUES
(1, 'New member', 0),
(2, 'Member', 10);


INSERT INTO `<xsl:value-of select="//table_prefix"/>users` (`id`, `group_id`, `username`, `password`, `email`, `title`, `realname`, `url`,`location`, `use_avatar`, `signature`, `disp_topics`, `disp_posts`, `email_setting`, `save_pass`, `notify_with_post`, `show_smilies`, `show_img`, `show_img_sig`, `show_avatars`, `show_sig`, `timezone`, `language`, `style`, `num_posts`, `last_post`, `registered`, `registration_ip`, `last_visit`, `admin_note`, `activate_string`, `activate_key`) VALUES
(1, 3, 'Guest', 'Guest', 'Guest',NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 'English', 'Oxygen', 0, NULL, 0, '0.0.0.0', 0, NULL, NULL, NULL),
(2, 1, '<xsl:value-of select="//admin"/>', '<xsl:value-of select="//password"/>', '<xsl:value-of select="//email"/>',NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 0, 1, 1, 1, 1, 1, -5, 'English', 'Oxygen', 23, 1206375054, 1194536945, '127.0.0.1', 1210736221, NULL, NULL, "active");

</xsl:template>
</xsl:stylesheet>
