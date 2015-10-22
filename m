Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFB30E0049B; Thu, 22 Oct 2015 08:01:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4F7FE00343
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Oct 2015 08:01:21 -0700 (PDT)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9ME47C1017784 for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Oct 2015 09:04:07 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015102209040766-356914 ;
	Thu, 22 Oct 2015 09:04:07 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 22 Oct 2015 17:04:05 +0300
Message-Id: <1445522645-3618-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/22/2015 09:04:07 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/22/2015 09:04:07 AM,
	Serialize complete at 10/22/2015 09:04:07 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-22_09:, , signatures=0
Subject: [PATCH] go-sqlite: add SRC_URI checksums
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
X-List-Received-Date: Thu, 22 Oct 2015 15:01:24 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 recipes-devtools/go/go-sqlite_hg.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/go/go-sqlite_hg.bb b/recipes-devtools/go/go-sqlite_hg.bb
index c5bc6ce..ebda84d 100644
--- a/recipes-devtools/go/go-sqlite_hg.bb
+++ b/recipes-devtools/go/go-sqlite_hg.bb
@@ -11,6 +11,9 @@ SRC_URI = "hg://code.google.com/p;module=gosqlite"
 
 SRCREV = "74691fb6f83716190870cde1b658538dd4b18eb0"
 
+SRC_URI[md5sum] = "04bb4682d0113d5dbcd4a1dbf6b24dfc"
+SRC_URI[sha256sum] = "478967fee730b85a6a4f96ace1e08fe91b6dfa6d641856bcd4574baec2f0361c"
+
 S = "${WORKDIR}/${SRCNAME}"
 
 do_install() {
-- 
2.1.4


