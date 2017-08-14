Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74FFEE00CF4; Mon, 14 Aug 2017 04:30:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.181.35 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.35])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DD83E00C88
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 04:30:25 -0700 (PDT)
Received: from 1dhDZg-0005Oz-VQ by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1dhDZg-0005QV-Vm
	for meta-virtualization@yoctoproject.org;
	Mon, 14 Aug 2017 04:30:24 -0700
Received: by emcmailer; Mon, 14 Aug 2017 04:30:24 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1dhDZg-0005Oz-VQ for meta-virtualization@yoctoproject.org;
	Mon, 14 Aug 2017 04:30:24 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Mon, 14 Aug 2017 13:30:08 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 3FA694404BE;
	Mon, 14 Aug 2017 13:30:08 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 14 Aug 2017 13:30:08 +0200
Message-ID: <1502710208-26297-2-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502710208-26297-1-git-send-email-adrian.dudau@enea.com>
References: <1502710208-26297-1-git-send-email-adrian.dudau@enea.com>
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
Subject: [PATCH 2/2] python-itsdangerous: Drop recipe
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
X-List-Received-Date: Mon, 14 Aug 2017 11:30:27 -0000
Content-Type: text/plain

Same version of the recipe is maintained in meta-python, no need to
keep a duplicate here.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 .../python/python-itsdangerous_0.24.bb             | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 recipes-devtools/python/python-itsdangerous_0.24.bb

diff --git a/recipes-devtools/python/python-itsdangerous_0.24.bb b/recipes-devtools/python/python-itsdangerous_0.24.bb
deleted file mode 100644
index 3e229f8..0000000
--- a/recipes-devtools/python/python-itsdangerous_0.24.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Various helpers to pass trusted data to untrusted environments and back"
-HOMEPAGE = "https://pypi.python.org/pypi/itsdangerous/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b61841e2bf5f07884148e2a6f1bcab0c"
-
-PR = "r0"
-SRCNAME = "itsdangerous"
-
-SRC_URI = "https://pypi.python.org/packages/source/i/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a3d55aa79369aef5345c036a8a26307f"
-SRC_URI[sha256sum] = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-json python-netclient python-zlib python-datetime python-lang python-crypt"
-
-CLEANBROKEN = "1"
-
-- 
2.7.4


