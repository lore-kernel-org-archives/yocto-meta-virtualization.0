Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A13E9E00E0A; Tue, 30 Jan 2018 07:37:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F207E006D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 07:37:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0UFbtNZ024276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 07:37:55 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 07:37:54 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 30 Jan 2018 10:37:45 -0500
Message-ID: <1517326665-29148-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: drop no longer existing python3 dependencies
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
X-List-Received-Date: Tue, 30 Jan 2018 15:37:58 -0000
Content-Type: text/plain

Several python3 packages have been removed as the functionality has
been moved into python3 core. As such we can no longer RDEPENDS on
these packages, nor is there a need to.

See similar commits in meta-openembedded:
df997e0747de - Remove deprecated python3-subprocess from the RDEPENDS
90b1f996af78 - Remove deprecated python3-argparse from the RDEPENDS
ef52e9980433 - Remove deprecated python3-lang from the RDEPENDS

This is fallout from openembedded core commit:
54ac820b8a63 - python3: Restructure python3 packaging and replace it
               with autopackaging

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 7898067..662d5b0 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -3,12 +3,12 @@ require openvswitch.inc
 DEPENDS += "virtual/kernel"
 
 RDEPENDS_${PN}-ptest += "\
-	python3-logging python3-syslog python3-argparse python3-io \
-	python3-fcntl python3-shell python3-lang python3-xml python3-math \
+	python3-logging python3-syslog python3-io \
+	python3-fcntl python3-shell python3-xml python3-math \
 	python3-datetime python3-netclient python3 sed \
 	ldd perl-module-socket perl-module-carp perl-module-exporter \
 	perl-module-xsloader python3-netserver python3-threading \
-	python3-resource python3-subprocess findutils which \
+	python3-resource findutils which \
 	"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


