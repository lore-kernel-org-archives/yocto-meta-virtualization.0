Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84DA4E007AD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 12:42:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBIKgigQ004497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 12:42:45 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 18 Dec 2013 12:42:44 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 18 Dec 2013 15:42:01 -0500
Message-ID: <1387399322-4509-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] openvswitch: add missing inherit
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
X-List-Received-Date: Wed, 18 Dec 2013 20:42:49 -0000
Content-Type: text/plain

openvswitch requires pkgconfig or you may see an error:

configure.ac:53: error: Please install pkg-config.

during configure.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
Bruce,

Here is another set of commits to fix potential build issues, usually
encountered while building out of sstate. Sorry for not grouping these
with my recent lxc commit, I pulled the trigger too quickly.

Mark


 recipes-networking/openvswitch/openvswitch_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 02c8ab3..931beb8 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -59,7 +59,7 @@ FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
 FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d pkgconfig
 
 INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
 INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-- 
1.8.3.2


