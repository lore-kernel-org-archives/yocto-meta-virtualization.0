Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B429CE006B4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by mail-bk0-f48.google.com with SMTP id jc3so360747bkc.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Fawg0lPTdnNJGKJ4sI9MUF3L0VgSEwCupCQAPb2QYwQ=;
	b=bfm/md2Vbgr8XUfL1pMJHQtrO9NQ+0il/XQE61K/pdd5figbNvHU1U14obpvn97hVk
	K1aMggw3/CjEPQD+dFs2gBACnRhzXv/FAofd6LFGHeedxliRxpbbAr+0T1sr4zQF2m4H
	20TRA/RD5hv5obKGODXqwvTVOOaLMrJ1S+7swIhLUWj1k4roMbdZOavYlA/90D7h9dB8
	kJ5VCIrZ8KBNR+dXftNotClWXHI0tSNNxZehYpe/0HsWOlt1Sa3BJJL2N0VK+SRSt8WQ
	kLsgbPVxVPFPmeauLF49e1c6GoXpQv79FCwzIe046pfWyMBjhkbduRsu2TXm/vvuzULK
	SbMw==
X-Received: by 10.204.131.78 with SMTP id w14mr842262bks.83.1355841133300;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d16sm1505147bkw.2.2012.12.18.06.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 2566C400C0C; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:44 +0100
Message-Id: <1355841118-22361-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 02/16] Added python-cliff recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../files/001-remove-distribute-dependency.patch   |   24 ++++++++++++++++
 recipes-python/cliff/python-cliff_1.3.bb           |   29 ++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 recipes-python/cliff/files/001-remove-distribute-dependency.patch
 create mode 100644 recipes-python/cliff/python-cliff_1.3.bb

diff --git a/recipes-python/cliff/files/001-remove-distribute-dependency.patch b/recipes-python/cliff/files/001-remove-distribute-dependency.patch
new file mode 100644
index 0000000..7d6d6df
--- /dev/null
+++ b/recipes-python/cliff/files/001-remove-distribute-dependency.patch
@@ -0,0 +1,24 @@
+diff -Naur cliff-1.3.old/setup.py cliff-1.3/setup.py
+--- cliff-1.3.old/setup.py	2012-12-18 12:53:53.650202165 +0100
++++ cliff-1.3/setup.py	2012-12-18 12:55:25.046204612 +0100
+@@ -5,10 +5,6 @@
+ # Change docs/source/conf.py too!
+ VERSION = '1.3'
+ 
+-# Bootstrap installation of Distribute
+-import distribute_setup
+-distribute_setup.use_setuptools()
+-
+ from setuptools import setup, find_packages
+ 
+ from distutils.util import convert_path
+@@ -21,8 +17,7 @@
+ except IOError:
+     long_description = ''
+ 
+-install_requires = ['distribute',
+-                    'PrettyTable',
++install_requires = ['PrettyTable',
+                     'cmd2',
+                     ]
+ try:
diff --git a/recipes-python/cliff/python-cliff_1.3.bb b/recipes-python/cliff/python-cliff_1.3.bb
new file mode 100644
index 0000000..6ea8fa5
--- /dev/null
+++ b/recipes-python/cliff/python-cliff_1.3.bb
@@ -0,0 +1,29 @@
+SUMMARY="Command Line Interface Formulation Framework"
+DESCRIPTION = "cliff is a framework for building command line programs. It uses \
+	    setuptools entry points to provide subcommands, output formatters, and \
+	    other extensions"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+PR = "0"
+
+DEPENDS += "python-prettytable \
+	python-cmd2 \
+	python-argparse \
+	"
+RDEPENDS_${PN} += "python-prettytable \
+	python-cmd2 \
+	"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SRC_URI = "http://pypi.python.org/packages/source/c/cliff/cliff-${PV}.tar.gz \
+	file://001-remove-distribute-dependency.patch"
+
+SRC_URI[md5sum] = "33ee5562a58f769f6cf0d9742b42d775"
+SRC_URI[sha256sum] = "762ef3046a96676a176e686a2a1cbb7e1db95f754578eca309e3c648c6a16a31"
+
+S = "${WORKDIR}/cliff-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
-- 
1.7.9.5


