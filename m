Return-Path: <Liviu.Gheorghisan@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E2EAE0074B; Mon, 25 Aug 2014 06:48:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 9F89AE004FF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Aug 2014 06:47:50 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 25 Aug 2014 15:47:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4496)	id 0165D28CCB7;
	Mon, 25 Aug 2014 15:47:46 +0200 (CEST)
From: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 25 Aug 2014 15:47:40 +0200
Message-ID: <1408974460-22527-1-git-send-email-liviu.gheorghisan@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: liviu.gheorghisan@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] multipath-tools buildfix: added '-brokensep' to autotools
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
X-List-Received-Date: Mon, 25 Aug 2014 13:48:04 -0000
Content-Type: text/plain

This is required because the build failed at do_install task.

| DEBUG: Executing shell function do_install
| NOTE: make -j 64 LIB=/usr/lib exec_prefix=/usr libdir=/usr/lib DESTDIR=/media/sdd1/fb/ligh/scm/cgl-upstream/build-qemuppc/tmp/work/ppc7400-poky-linux/multipath-tools/0.4.9+gitrAUTOINC+d3683ab18b-r0/image install
| make: *** No rule to make target `install'.  Stop.
| ERROR: oe_runmake failed
| WARNING: /media/sdd1/fb/ligh/scm/cgl-upstream/build-qemuppc/tmp/work/ppc7400-poky-linux/multipath-tools/0.4.9+gitrAUTOINC+d3683ab18b-r0/temp/run.do_install.34183:1 exit 1 from
|   exit 1

ERROR: Task 2 (poky/meta-virtualization/recipes-extended/multipath-tools/multipath-tools_git.bb, do_install) failed with exit code '1'

Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
---
 recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
index 633b9f2..e2076d3 100644
--- a/recipes-extended/multipath-tools/multipath-tools_git.bb
+++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
 SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
 PV = "0.4.9+gitr${SRCPV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
 
-- 
1.9.1


