Return-Path: <j105.rob@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DE5EE008DD; Fri, 13 Feb 2015 04:06:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (j105.rob[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F9EEE0089B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Feb 2015 04:06:55 -0800 (PST)
Received: by mail-qc0-f178.google.com with SMTP id p6so13338222qcv.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Feb 2015 04:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eri+G3c/FM1cTNPjyQf1uVoMCaOVrUaM2rn3SElzq10=;
	b=fNvCZFoIKaC99nDkY7SUBLzRoV9tQqiRc0pkPcKiygRAKE1HNHt8yecvnozZyOocAT
	vjKwoLFXtbgHT6RhcBMAD6dMMci2h7CHQkeVh10EZR5kVjgCk7iQ9otFkEyyDGusOjQS
	IEliBlkLLAF+GLLgeMeQ5ztaPi1+ST/1x7NbE9mRSq5btTrDnrFTJlBaOwncbTi/u4Zu
	BV01MVWqNe9Ch3lhy2QyU5gGGi6W1IxVv1AZ5ZN5Ktbx28FJabL2N0cwDAPWXXPxGZkR
	TGvk4GYCRSH/x/iEA97MD81u7FR271sBEcnAJWtMZXZQyOzb94qL0jrbI2Ak4KM4UCCR
	t2RA==
X-Received: by 10.140.234.198 with SMTP id f189mr2262291qhc.0.1423829214822;
	Fri, 13 Feb 2015 04:06:54 -0800 (PST)
Received: from localhost.localdomain ([64.128.162.147])
	by mx.google.com with ESMTPSA id y2sm6880601qat.5.2015.02.13.04.06.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Feb 2015 04:06:54 -0800 (PST)
From: j105rob <j105.rob@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Feb 2015 07:04:02 -0500
Message-Id: <1423829042-21574-1-git-send-email-j105.rob@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [PATCH] dev86: Adjusted the SRC_URI of the source code.
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
X-List-Received-Date: Fri, 13 Feb 2015 12:06:59 -0000

The SRC_URI of the source code was returning a 404. After locating the correct URI
for this version of the source code, updated the SRC_URI & hashes.

Signed-off-by: j105rob <j105.rob@gmail.com>
---
 recipes-extended/dev86/dev86_0.16.19.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
index 807504e..5e26a75 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.19.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 PR="r0"
 
-SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
+SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
 
-SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
-SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
+SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
+SRC_URI[sha256sum] = "efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
 
 S = "${WORKDIR}/dev86-${PV}"
 
-- 
2.3.0


