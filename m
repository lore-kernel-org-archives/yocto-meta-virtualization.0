Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CEA4E011C0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: by mail-bk0-f46.google.com with SMTP id q16so366249bkw.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=q1o5zoFvqwCE7IDwRmP6lUmMp6hJmFTZ8/b51YEgCEU=;
	b=i8KD0NLTLsLixqt08VLtZH284zMg5/Ehw11zX5J9b7xKE8pWx3Dik41ZDTjWVWuCpe
	tuiLSts4LrHwyHukeFDjD6qfFmtxBbHem/QQKzR2bdltedgcsn7c20vKHIQ/FD0sXnym
	dmiW8rdDnJuObOURZW9KHjWQu7fMbHyI0+J4sw4FiwzNgW6JiqLSX9h1/9VRklyKwAGk
	JVs18aglAv4f/k7vCwRbdn6lB3iPhdi8ag9ILjY0TM2dtGzB6jarITW/aN03vkjw2/1+
	Vjlmz92BIqQjRH4aQRxaQpKwUsZsu54bmK4WRzKcW0TEbB9rbAo54TqpDVZc9Ychl4D9
	uBjQ==
X-Received: by 10.204.129.214 with SMTP id p22mr825120bks.47.1355841136669;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id c10sm1505661bkw.1.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 42646414F42; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:52 +0100
Message-Id: <1355841118-22361-11-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 10/16] Added python-pyopenssl recipe
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
 recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb

diff --git a/recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb b/recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb
new file mode 100644
index 0000000..9e2492f
--- /dev/null
+++ b/recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb
@@ -0,0 +1,20 @@
+SUMMARY="pyOpenSSL"
+DESCRIPTION = "A Python wrapper around the OpenSSL library"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+PR = "0"
+
+RDEPENDS_${PN} += "openssl libssl"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
+SRC_URI[sha256sum] = "21e12b03abaa0e04ecc8cd9c251598f71bae11c9f385304234e4ea5618c6163b"
+
+S = "${WORKDIR}/pyOpenSSL-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit distutils
-- 
1.7.9.5


