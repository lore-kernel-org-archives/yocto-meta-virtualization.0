Return-Path: <celeodor@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35029E009A3; Thu, 16 Apr 2015 15:14:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (celeodor[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.169 listed in list.dnswl.org]
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED180E0091A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 15:13:57 -0700 (PDT)
Received: by pdea3 with SMTP id a3so106482262pde.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=loYfhsTUROm2n7Qp9D9a4o/vcdGhox1zrhGSJKkYUHg=;
	b=HJWN22dgt52tujaWfKmPn59A/FcTDKRBE4owRFfiK9obxh9xzghutWLz5c07TL+Kvj
	nQj1skMPkm3RIthTVDKJdK6w6yTZloBdxuoWr0NDtWibcjbc9xIvzoqfGPvJyZ5YvQlN
	fHDLhVDDcSMEfWGl8WbezGwS03obxwh8JdINw9kLuIpzGPoUOMzlMMQ0HZM9ib4DXiRf
	LLMjSj++Z/vBlluOcYe3l2A9YzJYFUYc+r0MIaWS7AjmN1BYUBom0joFBRxO4F4Jo19/
	zd+BpWxEkU3u9fTxapnxcFnAHOPtK3+dDKqOKpizNknFhFMnqJtawxGJp1aNw0PxUtAU
	HGng==
X-Received: by 10.66.119.136 with SMTP id ku8mr61298352pab.29.1429222436856;
	Thu, 16 Apr 2015 15:13:56 -0700 (PDT)
Received: from deiban-wheezy-7.hme.com ([12.46.199.2])
	by mx.google.com with ESMTPSA id q4sm8119080pdo.42.2015.04.16.15.13.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 15:13:56 -0700 (PDT)
From: Celeo <celeodor@gmail.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1429222421-7314-1-git-send-email-celeodor@gmail.com>
X-Mailer: git-send-email 1.7.10.4
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: Celeo <celeodor@gmail.com>
Subject: [PATCH] Added missing quotation mark
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
Date: Thu, 16 Apr 2015 22:14:00 -0000
X-Original-Date: Thu, 16 Apr 2015 15:13:41 -0700
X-List-Received-Date: Thu, 16 Apr 2015 22:14:00 -0000

---
 meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
index ab4fe1f..c92842e 100644
--- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python-PostgreSQL Database Adapter"
 HOMEPAGE = "http://initd.org/psycopg/"
 SECTION = "devel/python"
-LICENSE = "GPLv3+
+LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
 DEPENDS = "postgresql"
 
-- 
1.7.10.4


