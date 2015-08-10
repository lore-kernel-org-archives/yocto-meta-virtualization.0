Return-Path: <Noor_Ahsan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8D02E0034B; Mon, 10 Aug 2015 04:36:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D201CE00306
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 04:36:13 -0700 (PDT)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZOlNE-0003nV-B2 from Noor_Ahsan@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Mon, 10 Aug 2015 04:36:12 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 10 Aug 2015 04:36:11 -0700
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])	by
	gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t7ABa9w9008977;
	Mon, 10 Aug 2015 06:36:11 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 10 Aug 2015 16:35:46 +0500
Message-ID: <1439206546-31385-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libvirt: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Mon, 10 Aug 2015 11:36:22 -0000
Content-Type: text/plain

From: Noor <noor_ahsan@mentor.com>

* Fixes a dependency on a nonexistent initscripts-functions package.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes-extended/libvirt/libvirt_1.2.15.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_1.2.15.bb b/recipes-extended/libvirt/libvirt_1.2.15.bb
index 8abd41e..6a5b67e 100644
--- a/recipes-extended/libvirt/libvirt_1.2.15.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.15.bb
@@ -238,3 +238,8 @@ pkg_postinst_libvirt() {
                 /etc/init.d/populate-volatile.sh update
         fi
 }
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
-- 
1.7.9.5


