Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEDCEE00D33; Mon,  6 Nov 2017 09:02:32 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23CEAE00D26
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 09:02:32 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA6H2VrZ029523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Nov 2017 09:02:32 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 09:02:31 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 6 Nov 2017 12:02:19 -0500
Message-ID: <1509987740-20453-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
References: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/4] python-nova: sudoers.d match dir ownership/perms
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
X-List-Received-Date: Mon, 06 Nov 2017 17:02:32 -0000
Content-Type: text/plain

The sudoers.d directory is for all intents and purposes created and
owned by the sudo package. We must therefor ensure we match the
ownership and perms which sudo used to install this
directory. Currently we don't so this results in an error when
assembling the filesystem:

  file /etc/sudoers.d conflicts between attempted installs of \
   nova-common-12.0.0+git0+6df6ad3ff3-r0.core2_64 and \
   sudo-1.8.20p2-r0.core2_64

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-nova_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index c1f4de1..f3a6b86 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -88,7 +88,7 @@ do_install_append() {
     chown root:root $NOVA_CONF_DIR/rootwrap.conf
 
     # Set up the rootwrap sudoers for nova
-    install -d ${D}${sysconfdir}/sudoers.d
+    install -d -m 750 ${D}${sysconfdir}/sudoers.d
     touch ${D}${sysconfdir}/sudoers.d/nova-rootwrap
     chmod 0440 ${D}${sysconfdir}/sudoers.d/nova-rootwrap
     chown root:root ${D}${sysconfdir}/sudoers.d/nova-rootwrap
-- 
2.7.4


