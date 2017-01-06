Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F9ABE006B4; Fri,  6 Jan 2017 08:52:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F2F1E00566
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jan 2017 08:52:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v06Gq3OW010066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Jan 2017 08:52:03 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 6 Jan 2017 08:52:03 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 6 Jan 2017 11:51:59 -0500
Message-ID: <1483721519-15941-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [mcs][PATCH] python-pycrypto: skip compile
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
X-List-Received-Date: Fri, 06 Jan 2017 16:52:05 -0000
Content-Type: text/plain

There is nothing to compile. Attempting to compile results in a build
failure so skip it.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
index a2ad4d1..b823224 100644
--- a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -25,6 +25,8 @@ inherit autotools autotools-brokensep distutils
 
 DEPENDS += " gmp"
 
+do_compile[noexec] = "1"
+
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
 # provide a "make install" target.
-- 
2.7.4


