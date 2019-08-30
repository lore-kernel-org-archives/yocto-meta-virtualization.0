Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F236E00E00; Thu, 29 Aug 2019 23:17:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8BDAE00C4F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 23:17:35 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U6HZYi001058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 23:17:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 23:17:35 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 14:17:32 +0800
Message-ID: <1567145853-76109-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] cgroup-lite: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 06:17:36 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/cgroup-lite/cgroup-lite_1.15.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
index 7b48c3a..45cc287 100644
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
@@ -22,9 +22,9 @@ SYSTEMD_AUTO_ENABLE_${PN} = "mask"
 
 
 do_install() {
-	install -d ${D}/bin
-	install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
-	install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
+	install -d ${D}/${base_bindir}
+	install -m 0755 ${S}/scripts/cgroups-mount ${D}/${base_bindir}
+	install -m 0755 ${S}/scripts/cgroups-umount ${D}/${base_bindir}
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
-- 
2.7.4


