Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C98BE00AE4; Wed, 16 Dec 2015 08:58:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F06C9E0033E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Dec 2015 08:58:48 -0800 (PST)
X-TM-IMSS-Message-ID: <13a2265b0003916a@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	13a2265b0003916a ; Wed, 16 Dec 2015 11:59:05 -0500
Received: from moss-terrapin.infosec.tycho.ncsc.mil (moss-terrapin
	[192.168.25.69])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id tBGGwimu026693; 
	Wed, 16 Dec 2015 11:58:45 -0500
From: Machon Gregory <mbgrego@tycho.nsa.gov>
To: meta-virtualization@yoctoproject.org
Date: Wed, 16 Dec 2015 12:08:41 -0500
Message-Id: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
Subject: [V2 Patch 1/2] Disables OCaml tools.
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
X-List-Received-Date: Wed, 16 Dec 2015 16:58:50 -0000

There is currently no support for OCaml in OpenEmbedded.

Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 00f1823..9e35459 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -712,6 +712,7 @@ EXTRA_OECONF += " \
     --disable-pv-grub \
     --disable-xenstore-stubdom \
     --disable-rombios \
+    --disable-ocamltools \
     "
 
 do_configure() {
-- 
2.1.0


