Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6BDEE00D36; Sun,  5 May 2019 19:00:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4F15E00D00
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 May 2019 19:00:03 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x46202Xn026324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 5 May 2019 19:00:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 19:00:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 5 May 2019 19:00:01 -0700
Message-ID: <20190506020001.48490-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] cgroup-lite: remove incorrect SYSTEMD_AUTO_ENABLE setting
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
X-List-Received-Date: Mon, 06 May 2019 02:00:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since commit [154abbc329 systemd: create preset files instead of
installing in image] applied in oe-core, it checks SYSTEMD_AUTO_ENABLE
...
|ERROR: cgroup-lite-1.15-r0 do_package: SYSTEMD_AUTO_ENABLE_cgroup-lite
'mask' is not 'enable' or 'disable'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/cgroup-lite/cgroup-lite_1.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
index 7b48c3a..cb16a65 100644
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
@@ -18,7 +18,6 @@ INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
 # where systemd is in use.
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "cgroups-init.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "mask"
 
 
 do_install() {
-- 
2.21.0


