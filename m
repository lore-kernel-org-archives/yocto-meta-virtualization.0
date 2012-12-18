Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 267E8E011AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: by mail-bk0-f46.google.com with SMTP id q16so370861bkw.33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=pEF0UTnnpUWug5yb1rMal1jX9f+r6ymnmwWIzyKPByg=;
	b=cIpHKWISK6t2plW/ZmmjMHRYo/8uJiBJTbpz8M9HuHCiKwbJoxVXeOZ39/YRQxbKwo
	qrtZsPf90IzNfuoJfvfD0s5/ak2SgFKKJwUF9mXGPH3GRHMahMWnpjTWbfJDbrUkrotw
	LkYLrwoPyhAeMtoiSuPizvZVzX30nC5YD8q2ODHRCBJmHSKNZlLWh7ARlrhgZT/xvGiP
	rEzdPnzLEwMrfao5ObYltkifl60ZT8oVTFZJWt7BVCvSbx0pOZwGppU769aAs5b8F9UK
	+YR6BHHWCt05xCgui1wbNCsVLPvHjRCUX3mlGgZUsEj7kJy3RHQT04wxYJW8c6QQ2FU/
	j9pA==
X-Received: by 10.204.147.79 with SMTP id k15mr801381bkv.55.1355841137187;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id r16sm1504688bkv.3.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4470A414F43; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:53 +0100
Message-Id: <1355841118-22361-12-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 11/16] Added python-pyparsing recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-python/pyparsing/python-pyparsing_1.5.6.bb |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-python/pyparsing/python-pyparsing_1.5.6.bb

diff --git a/recipes-python/pyparsing/python-pyparsing_1.5.6.bb b/recipes-python/pyparsing/python-pyparsing_1.5.6.bb
new file mode 100644
index 0000000..8f1fa22
--- /dev/null
+++ b/recipes-python/pyparsing/python-pyparsing_1.5.6.bb
@@ -0,0 +1,22 @@
+SUMMARY="Python parsing module"
+DESCRIPTION = "The pyparsing module is an alternative approach to creating and executing \ 
+simple grammars, vs. the traditional lex/yacc approach, or the use of \
+regular expressions.  The pyparsing module provides a library of classes \ 
+that client code uses to construct the grammar directly in Python code."
+SECTION = "devel/python"
+LICENSE = "MIT"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
+SRC_URI = "http://pypi.python.org/packages/source/p/pyparsing/pyparsing-${PV}.zip"
+
+SRC_URI[md5sum] = "5404de54e6d0ae71ce354d8db3576ac1"
+
+S = "${WORKDIR}/pyparsing-${PV}"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
+inherit distutils
-- 
1.7.9.5


