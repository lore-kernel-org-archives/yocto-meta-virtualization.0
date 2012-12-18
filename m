Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C9AFE01454
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: by mail-bk0-f41.google.com with SMTP id jg9so369618bkc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QJtcYTwgGTAkVWhVvzwTtCOOhuxwuUrrXxjDcC9/gCo=;
	b=nZPKzD7CASuhsQXruz/AXx50ZhjZrD68IpjWtyuka3+xTlXzI2a9PSfTikzZmsLVO7
	ruYqihLcfY+EbM7GA5KH2u+2NEvOPP28q6wtXRxs9+CM6SJuI8C5BeYvRj1T0yCl1fH5
	F+GbbQz1nLPiCnvVHOPNsDKDAHn8KSXHwrlNLPv9+c1iPyEo37rBDOTcTjUeT3aR7YO7
	SYaa7OBhWKTh0OvwI8Wz07hHKWLjtdmeRPSDFJIzbJsgbrjmNHtA4wF8Aersd2y91ibW
	y1ljz7we2ItQoUWgX3RwF8Xi2i0iTyD/hRQ6BhFpeVblkvpwG59ZDQz6oTJ8SiYPY1Pe
	x4Kw==
X-Received: by 10.204.4.133 with SMTP id 5mr862176bkr.21.1355841135310;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id e22sm1499792bke.14.2012.12.18.06.32.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 30603414F3D; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:47 +0100
Message-Id: <1355841118-22361-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 05/16] Added python-jsonpatch recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-python/jsonpatch/python-jsonpatch_0.10.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-python/jsonpatch/python-jsonpatch_0.10.bb

diff --git a/recipes-python/jsonpatch/python-jsonpatch_0.10.bb b/recipes-python/jsonpatch/python-jsonpatch_0.10.bb
new file mode 100644
index 0000000..f3ea03e
--- /dev/null
+++ b/recipes-python/jsonpatch/python-jsonpatch_0.10.bb
@@ -0,0 +1,20 @@
+SUMMARY="jsonpatch"
+DESCRIPTION = "An implementation of the JSON Patch format"
+SECTION = "devel/python"
+LICENSE = "BSD+"
+PR = "0"
+
+DEPENDS += "python-jsonpointer"
+
+LIC_FILES_CHKSUM = "file://jsonpatch.py;beginline=3;endline=30;md5=5cd7d1fbd6b236ed142e4285624f58fe"
+SRC_URI = "http://pypi.python.org/packages/source/j/jsonpatch/jsonpatch-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d9a96bdfe208c42415b1749f1b591fa7"
+SRC_URI[sha256sum] = "86409f5c0a8392a277488dd11fc0f603e7241c95cf547b7048e30e69b7f74107"
+
+S = "${WORKDIR}/jsonpatch-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
-- 
1.7.9.5


