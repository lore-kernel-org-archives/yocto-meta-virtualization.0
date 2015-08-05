Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D93A5E00AB3; Wed,  5 Aug 2015 13:30:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DADEE00B18
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KU2M1001893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:02 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:02 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:45 -0400
Message-ID: <1438806592-32745-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 04/11] meta-openstack: add wildcard to lighttpd bbappend
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Aug 2015 20:30:14 -0000
Content-Type: text/plain

This is currently a dangling bbappend as lighttpd is now version
1.4.36. The changes found in this bbappend only apply to the sysvinit
scripts and should most likely be replicated in systemd. For the sake
of keeping this series focused on dealing with dangling bbappends I am
simply renaming the bbappend for now, without modifying its content.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.%.bbappend  | 3 +++
 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.%.bbappend
 delete mode 100644 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend

diff --git a/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.%.bbappend b/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.%.bbappend
new file mode 100644
index 0000000..33b1f61
--- /dev/null
+++ b/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.%.bbappend
@@ -0,0 +1,3 @@
+do_install_append() {
+	sed -i '2i port=`grep "^server.port" /etc/lighttpd.conf`; if [ -z $port ]; then echo "server port not configured, not running lighttpd..."; exit 0; fi' ${D}/etc/init.d/lighttpd
+}
diff --git a/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend b/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
deleted file mode 100644
index 33b1f61..0000000
--- a/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-do_install_append() {
-	sed -i '2i port=`grep "^server.port" /etc/lighttpd.conf`; if [ -z $port ]; then echo "server port not configured, not running lighttpd..."; exit 0; fi' ${D}/etc/init.d/lighttpd
-}
-- 
2.1.4


