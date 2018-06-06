Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50666E01637; Wed,  6 Jun 2018 08:58:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 493F0E01589
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Jun 2018 08:58:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w56FvCDV028594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 6 Jun 2018 08:57:53 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 6 Jun 2018 08:57:37 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 6 Jun 2018 11:57:35 -0400
Message-ID: <1528300655-5974-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: fix build error caused by host 'xmllint'
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
X-List-Received-Date: Wed, 06 Jun 2018 15:58:06 -0000
Content-Type: text/plain

There is host contamination in that we force XMLLINT to be
'/usr/bin/xmllint' via ac_cv_path_XMLLINT. This results in the error:

    /bin/bash: /usr/bin/xmllint: No such file or directory

We only use XMLLINT during the build, it is present in two Makefiles
included with ptest package but they are unused. So we drop the
setting of ac_cv_path_XMLLINT to ensure we are using xmllint in the
recipe sysroot instead of the host's. Should the ptest package ever
evolve to make use of the Makefiles we need to update not only the
XMLLINT path but that for XSLTPROC and others too. (I would suggest
that the Makefiles may have been used on the target as part of ptest
at one point, but are no longer and should be removed, though I
haven't investigated further).

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index a9cc011..ef51b9e 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -43,7 +43,6 @@ SRC_URI[libvirt.sha256sum] = "a531e22c8b985ecb2d1223b913fd6ec0f1800e3ebe02351924
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
 CACHED_CONFIGUREVARS += "\
-ac_cv_path_XMLLINT=/usr/bin/xmllint \
 ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
 ac_cv_path_AUGPARSE=/usr/bin/augparse \
 ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
-- 
2.7.4


