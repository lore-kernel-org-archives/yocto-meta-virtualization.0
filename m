Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DFA7E00AE6; Wed,  5 Jul 2017 06:30:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [185.38.181.37 listed in list.dnswl.org]
X-Greylist: delayed 172 seconds by postgrey-1.32 at yocto-www;
	Wed, 05 Jul 2017 06:30:02 PDT
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEDE1E00A9C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jul 2017 06:30:02 -0700 (PDT)
Received: from 1dSkKi-0007K1-VZ by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1dSkKi-0007KI-W9
	for meta-virtualization@yoctoproject.org;
	Wed, 05 Jul 2017 06:27:08 -0700
Received: by emcmailer; Wed, 05 Jul 2017 06:27:08 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1dSkKi-0007K1-VZ for meta-virtualization@yoctoproject.org;
	Wed, 05 Jul 2017 06:27:08 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2; Wed, 5 Jul 2017
	15:27:08 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 89DA044104C;
	Wed,  5 Jul 2017 15:27:08 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 5 Jul 2017 15:27:08 +0200
Message-ID: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
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
Subject: [PATCH] python-requests: Drop recipe
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
X-List-Received-Date: Wed, 05 Jul 2017 13:30:06 -0000
Content-Type: text/plain

There's a newer recipe (v2.13) maintained in meta-python. meta-openstack
explicitly prefers that version over this one, so no point in keeping
this recipe since nobody else is using this version.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 recipes-devtools/python/python-requests_2.8.1.bb | 28 ------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 recipes-devtools/python/python-requests_2.8.1.bb

diff --git a/recipes-devtools/python/python-requests_2.8.1.bb b/recipes-devtools/python/python-requests_2.8.1.bb
deleted file mode 100644
index 187f97a..0000000
--- a/recipes-devtools/python/python-requests_2.8.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-HOMEPAGE = "http://python-requests.org"
-SUMMARY = "Python HTTP for Humans."
-DESCRIPTION = "\
-  Requests is an Apache2 Licensed HTTP library, written in Python, \
-  for human beings. \
-  .      \
-  Most existing Python modules for sending HTTP requests are extremely \
-  verbose and cumbersome. Python's builtin urllib2 module provides most \
-  of the HTTP capabilities you should need, but the api is thoroughly \
-  broken.  It requires an enormous amount of work (even method overrides) \
-  to perform the simplest of tasks. \
-  .      \
-  Things shouldn't be this way. Not in Python \
-  "
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
-
-SRCNAME = "requests"
-
-SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
-SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-- 
2.7.4


