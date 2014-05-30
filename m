Return-Path: <misn@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B5C5E009A7; Fri, 30 May 2014 07:27:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A1F20E00724
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 May 2014 07:27:08 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 30 May 2014 16:27:07 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 99C3E28B6B9;
	Fri, 30 May 2014 16:27:07 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 May 2014 16:27:03 +0200
Message-ID: <1401460023-44204-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [daisy] [PATCH] libvirt: fix PTEST_DIR
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
X-List-Received-Date: Fri, 30 May 2014 14:27:12 -0000
Content-Type: text/plain

The default PTEST_DIR only works for 32bit.

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 recipes-extended/libvirt/libvirt/runptest.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index 0c01975..4973a56 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -11,7 +11,7 @@ diff -uNr a/tests/Makefile.am b/tests/Makefile.am
  	-I$(top_srcdir)/src/conf \
  	$(GETTEXT_CPPFLAGS)
  
-+PTEST_DIR ?= /usr/lib/libvirt/ptest
++PTEST_DIR ?= $(libdir)/libvirt/ptest
 +
  AM_CFLAGS = \
 -	-Dabs_builddir="\"`pwd`\"" \
-- 
1.8.5.3


