Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB9ACD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 10:05:18 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16525.1780481113271449894
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 03:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SIGWYiyE;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7924; q=dns/txt;
  s=iport01; t=1780481113; x=1781690713;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FigYpgHX3JPvmL+PIzANykQZdO2BXgbH/GZT7CYPLLg=;
  b=SIGWYiyESRE16JEkEmSpfK1zlTmlwUKbJOMsB5RCAXD8QAzwT5O/U5jd
   dG1AlPlCuIj+twhVF+p4+C2bzD8nRHd2LjYmD857ybwRodRby2RmKoUBv
   mE7nZ8e6Sksr8Thu4m1atl3058wADMgTzMlELje/T9whWTByzPEIEXorc
   Y9C5CnvZ2qAZdDS8OCWDb/+SwpYp1E8TIrplRrkvOLDKVGzrTwcCmPYgc
   AEIFXtOA9euF1wBZI8YV94q7IJHwQfRY2lJXdDjKVrTDdEzQ/1sWKxc9m
   4UbAe8YUGMWx6oY0RzbfIHeojch/5PcneL9eYXbSkny/Gk2buwNDAJ6sA
   g==;
X-CSE-ConnectionGUID: pRTY1mzTTCC7/8kliY14gg==
X-CSE-MsgGUID: 7cv9CzbHT56mg7wNLSbRsA==
X-IPAS-Result: =?us-ascii?q?A0BCAgCC+x9q/5P/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iGeHhSBag8BAQEPRA0EAQGSOgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaATgBcgMBAlojIYMCAYJzAgERsh6CLIEBg2gCQ1DbK?=
 =?us-ascii?q?gELFAGBOIU/iB1bGAFEhDcnGxuBcoEVg2iBBYFcAQGBJx+GXgSCDRWBDIFdj?=
 =?us-ascii?q?j5IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWBSoFJaoEFhRIjH?=
 =?us-ascii?q?wM5gReBfYEoaWkVPgMLGA1IESw3FBsEPm4HjAgXD4I2PSYrAStQSAFkFxgcA?=
 =?us-ascii?q?qM3giGLL5VfCiiDdIwhlToaM4QEgVeSP4NSjn8LmHuLNoJTlWdohGiBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OOINrgX+DFMNyJDULAy8BAQcCBw4DC4FokACBfQEB?=
IronPort-Data: A9a23:0p3iNqsYCecMJ49ynAv1dtwjlufnVAVfMUV32f8akzHdYApBsoF/q
 tZmKW+DP62OY2r0e9B/Oo7ko05TsMLTz94yQVdo/H9kE3xDgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zb80s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw4txLMDhL5
 8AkAxtSKUCAg+OHme60Rbw57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoDaHZgPwhzG/
 Qoq+UymCQ9LH86V6QbYrHej2fDpuRjxYpk7QejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYRgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:JWqEfKrTjxuxuNYf7feUD40aV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:apmJuGORDEZ3E+5DQBNbxRcRCPwZWVaCiyfTJ06JUDpmR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AqJbz8g2h5d5mTPv76TPXmzf4fzUjvK+wWWsfm7U?=
 =?us-ascii?q?65peBOnNvHROmhg6sa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,185,1774310400"; 
   d="scan'208";a="480524263"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Jun 2026 10:05:12 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 1746118000A66
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  3 Jun 2026 10:05:12 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id B1542CB6A93; Wed,  3 Jun 2026 03:05:11 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] lxc: Fix CVE-2026-39402
Date: Wed,  3 Jun 2026 03:04:17 -0700
Message-Id: <20260603100416.63452-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 10:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9844

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the nearest upstream fix commit from stable-5.0 [1] for the lxc-user-nic
OVS port deletion authorization bypass, aligned with the original fix in
v7.0.0 [2] as referenced in PR [4].

Ubuntu specific test commit [3] from PR [4] is omitted because it is specific to 
a host environment. It assumes an Ubuntu host, installs openvswitch-switch
with apt-get, creates local users, edits /etc/lxc/lxc-usernet and /run/lxc/nics,
and manipulates OVS bridges. That is not suitable for inclusion as a Yocto runtime
CVE patch without separate ptest adaptation.

[1] https://github.com/lxc/lxc/commit/db25752fe8a03c8264a21ca99f49b2db93c56910
[2] https://github.com/lxc/lxc/commit/7c4348314ac1914074197774ea0292c69eb6316c
[3] https://github.com/lxc/lxc/commit/14754e0b9913e3cc229f9912f57d4d2e7efe760d
[4] https://github.com/lxc/lxc/pull/4678

References:
https://security-tracker.debian.org/tracker/CVE-2026-39402
https://nvd.nist.gov/vuln/detail/CVE-2026-39402

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../lxc/files/CVE-2026-39402.patch            | 173 ++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 recipes-containers/lxc/files/CVE-2026-39402.patch

diff --git a/recipes-containers/lxc/files/CVE-2026-39402.patch b/recipes-containers/lxc/files/CVE-2026-39402.patch
new file mode 100644
index 00000000..4a28adab
--- /dev/null
+++ b/recipes-containers/lxc/files/CVE-2026-39402.patch
@@ -0,0 +1,173 @@
+From 37cbf5c2d197ba13a4e36e3fb8858d8302514345 Mon Sep 17 00:00:00 2001
+From: "Serge E. Hallyn" <serge@hallyn.com>
+Date: Mon, 20 Apr 2026 23:07:47 -0500
+Subject: [PATCH] lxc-user-nic: clarify and fix
+
+Some variable names were a bit confusing in find_line and cull_entries.
+Rename and document, and fix the flows using these.
+
+It's possible that a more maintainable approach, long term, would be
+to break these up differently: have one function create a neat
+in memory data structure representing the files, and have the paths
+currently using find_line and cull_entries peek into the data structures.
+But i think this is pretty clear.
+
+This fixes CVE-2026-39402
+
+CVE: CVE-2026-39402
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/db25752fe8a03c8264a21ca99f49b2db93c56910]
+
+Signed-off-by: Serge E. Hallyn <serge@hallyn.com>
+Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
+(cherry picked from commit db25752fe8a03c8264a21ca99f49b2db93c56910)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ src/lxc/cmd/lxc_user_nic.c | 75 +++++++++++++++++++++++++++++---------
+ 1 file changed, 57 insertions(+), 18 deletions(-)
+
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
+index d1b392199..7f5a0b6fd 100644
+--- a/src/lxc/cmd/lxc_user_nic.c
++++ b/src/lxc/cmd/lxc_user_nic.c
+@@ -371,19 +371,58 @@ static char *get_eow(char *s, char *e)
+ 	return s;
+ }
+ 
++static bool same_word(const char *start, const char *end, const char *word)
++{
++	size_t wordlen = strlen(word);
++	size_t buflen = end - start;
++
++	if (wordlen != buflen)
++		return false;
++	if (strncmp(start, word, wordlen) == 0)
++		return true;
++	return false;
++}
++
++/*
++ * in:
++ * @buf_start and @buf_end point to the buffer to be read.
++ *
++ * @owner_name is the name of the user who should own the link.
++ *
++ * @net_type is type of connection, e.g. veth
++ *
++ * @net_link is the name of the bridge, e.g. lxcbr0, on which the
++ * device should live.
++ *
++ * @net_dev is the name of the device itself in the host netns.
++ *
++ * out:
++ * @is_owner is set to true if the current line is owned by @name.
++
++ * @nic_found is set to true if the line is specifically for the passed-in
++ * @net_dev, and it is on the right @net_link and of the right @net_type.
++ *
++ * @exists is set to false if the nic in this line no longer exists.  This is
++ * used by cull_entries(): if we set it to false, then this line will be
++ * removed from the LXC_USERNIC_DB (e.g. /var/run/lxc/nics).
++ */
+ static char *find_line(char *buf_start, char *buf_end, char *name,
+ 		       char *net_type, char *net_link, char *net_dev,
+-		       bool *owner, bool *found, bool *keep)
++		       bool *is_owner, bool *nic_found, bool *exists)
+ {
+ 	char *end_of_line, *end_of_word, *line;
++	bool right_net_type, right_bridge, right_link_name;;
+ 
+ 	while (buf_start < buf_end) {
+ 		size_t len;
+ 		char netdev_name[IFNAMSIZ];
+ 
+-		*found = false;
+-		*keep = true;
+-		*owner = false;
++		*nic_found = false;
++		*exists = true;
++		*is_owner = false;
++		right_net_type  = false;
++		right_bridge    = false;
++		right_link_name = false;
+ 
+ 		end_of_line = get_eol(buf_start, buf_end);
+ 		if (end_of_line >= buf_end)
+@@ -402,11 +441,8 @@ static char *find_line(char *buf_start, char *buf_end, char *name,
+ 		if (!end_of_word)
+ 			return NULL;
+ 
+-		if (strncmp(buf_start, name, strlen(name)))
+-			*found = false;
+-		else
+-			if (strlen(name) == (size_t)(end_of_word - buf_start))
+-				*owner = true;
++		if (same_word(buf_start, end_of_word, name))
++			*is_owner = true;
+ 
+ 		buf_start = end_of_word + 1;
+ 		while ((buf_start < buf_end) && isblank(*buf_start))
+@@ -418,8 +454,8 @@ static char *find_line(char *buf_start, char *buf_end, char *name,
+ 		if (!end_of_word)
+ 			return NULL;
+ 
+-		if (strncmp(buf_start, net_type, strlen(net_type)))
+-			*found = false;
++		if (same_word(buf_start, end_of_word, net_type))
++			right_net_type = true;
+ 
+ 		buf_start = end_of_word + 1;
+ 		while ((buf_start < buf_end) && isblank(*buf_start))
+@@ -431,8 +467,8 @@ static char *find_line(char *buf_start, char *buf_end, char *name,
+ 		if (!end_of_word)
+ 			return NULL;
+ 
+-		if (strncmp(buf_start, net_link, strlen(net_link)))
+-			*found = false;
++		if (same_word(buf_start, end_of_word, net_link))
++			right_bridge = true;
+ 
+ 		buf_start = end_of_word + 1;
+ 		while ((buf_start < buf_end) && isblank(*buf_start))
+@@ -451,10 +487,13 @@ static char *find_line(char *buf_start, char *buf_end, char *name,
+ 
+ 		memcpy(netdev_name, buf_start, len);
+ 		netdev_name[len] = '\0';
+-		*keep = lxc_nic_exists(netdev_name);
++		*exists = lxc_nic_exists(netdev_name);
+ 
+ 		if (net_dev && !strcmp(netdev_name, net_dev))
+-			*found = true;
++			right_link_name = true;
++
++		if (right_net_type && right_bridge && right_link_name)
++			*nic_found = true;
+ 
+ 		return line;
+ 
+@@ -584,7 +623,7 @@ static bool cull_entries(int fd, char *name, char *net_type, char *net_link,
+ 	size_t length = 0;
+ 	int ret;
+ 	char *buf_end, *buf_start;
+-	bool found, keep;
++	bool nic_found, is_owner, keep;
+ 
+ 	ret = fd_to_buf(fd, &buf, &length);
+ 	if (ret < 0) {
+@@ -600,7 +639,7 @@ static bool cull_entries(int fd, char *name, char *net_type, char *net_link,
+ 	buf_start = buf;
+ 	buf_end = buf + length;
+ 	while ((buf_start = find_line(buf_start, buf_end, name, net_type,
+-				      net_link, net_dev, &(bool){true}, &found,
++				      net_link, net_dev, &is_owner, &nic_found,
+ 				      &keep))) {
+ 		struct entry_line *newe;
+ 
+@@ -608,7 +647,7 @@ static bool cull_entries(int fd, char *name, char *net_type, char *net_link,
+ 		if (!newe)
+ 			return false;
+ 
+-		if (found)
++		if (nic_found && is_owner)
+ 			*found_nicname = true;
+ 
+ 		entry_lines = newe;
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 75cfe859..3cef0d9f 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-5.0;protocol=https \
 	file://lxc-net \
 	file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
 	file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch \
+	file://CVE-2026-39402.patch \
 	"
 
 SRCREV = "cb8e38aca27a23964941f0f011a8919aab8bebab"
-- 
2.35.6


