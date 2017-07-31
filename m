Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 395E4E00C41; Mon, 31 Jul 2017 03:46:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.181.34 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.34])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E41BFE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Jul 2017 03:46:06 -0700 (PDT)
Received: from 1dc8D7-0005ar-UE by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1dc8D7-0005cH-V3
	for meta-virtualization@yoctoproject.org;
	Mon, 31 Jul 2017 03:46:05 -0700
Received: by emcmailer; Mon, 31 Jul 2017 03:46:05 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1dc8D7-0005ar-UE for meta-virtualization@yoctoproject.org;
	Mon, 31 Jul 2017 03:46:05 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Mon, 31 Jul 2017 12:46:05 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 222504404CC;
	Mon, 31 Jul 2017 12:46:05 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 31 Jul 2017 12:46:05 +0200
Message-ID: <1501497965-53638-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] python-six: Drop recipe
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
X-List-Received-Date: Mon, 31 Jul 2017 10:46:09 -0000
Content-Type: text/plain

Same recipe is maintained in oe-core, no need to keep a duplicate here.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 recipes-devtools/python/python-six_1.10.0.bb | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 recipes-devtools/python/python-six_1.10.0.bb

diff --git a/recipes-devtools/python/python-six_1.10.0.bb b/recipes-devtools/python/python-six_1.10.0.bb
deleted file mode 100644
index c279f9f..0000000
--- a/recipes-devtools/python/python-six_1.10.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Python 2 and 3 compatibility utilities"
-HOMEPAGE = "http://pypi.python.org/pypi/six/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
-
-SRCNAME = "six"
-
-SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
-SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
2.7.4


