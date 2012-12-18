Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f44.google.com (mail-bk0-f44.google.com
	[209.85.214.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E3FAE0144D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: by mail-bk0-f44.google.com with SMTP id w11so363661bku.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Bl46/2mQdLtszyY5T4r3xRPHKpUkS2+tj3U/tq39l6Y=;
	b=pEQqaVgxZZmTO3+4Ej9MEWzE1t+BdEh1qVD4X84+OjcCo6OUb5R2mKqPu1E1JNvzh7
	CpwG/j62blIdWI91fOIZTq8cdfXwO6rDWJbcRlgBPHViaEANKyaqxzXuOshMMx/b640l
	mfuinJtJWjksGAO2Xn0a3/mpy5tOS6ZnuiFoDRsfUbxFDV1z0bkUFaUy6cIE8jApWeKu
	Eoou8CZn+KmBPHbm9O0LsOkNRRKYeEetb6f5Z2M1sr897sjBn33LYuMU2VuoAexnSiBB
	WQbU/m8VzJ2dE0CjjQ41deg0q/cBZL4degSFdwVN2pdrf7iWjy059N8eb2hM2o2OFFs/
	EFrQ==
X-Received: by 10.204.8.17 with SMTP id f17mr795403bkf.110.1355841136599;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f24sm1502609bkv.7.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 48E08414F45; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:55 +0100
Message-Id: <1355841118-22361-14-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 13/16] Added python-warlock recipe
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
 recipes-python/warlock/python-warlock_0.7.0.bb |   26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-python/warlock/python-warlock_0.7.0.bb

diff --git a/recipes-python/warlock/python-warlock_0.7.0.bb b/recipes-python/warlock/python-warlock_0.7.0.bb
new file mode 100644
index 0000000..7c1d6c8
--- /dev/null
+++ b/recipes-python/warlock/python-warlock_0.7.0.bb
@@ -0,0 +1,26 @@
+SUMMARY="Warlock"
+DESCRIPTION = "Build self-validating python objects using JSON schemas"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+PR = "0"
+
+DEPENDS += "python-jsonschema \
+	python-jsonpatch \
+	"
+
+RDEPENDS_${PN} += "python-jsonschema \
+	       python-jsonpatch \
+	       "
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+SRC_URI = "http://pypi.python.org/packages/source/w/warlock/warlock-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7567a1df0bbf76a113d945f307d93d9a"
+SRC_URI[sha256sum] = "cc913fe3855f95512d183d158bd0a0f4e1c4b0619041ddb44fd15af8dc86e22a"
+
+S = "${WORKDIR}/warlock-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
-- 
1.7.9.5


