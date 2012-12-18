Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 968E3E011AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: by mail-bk0-f51.google.com with SMTP id ik5so365446bkc.24
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=uNWkPWU9RLF/EU1h3rQ9VSaJ+DsNT6w7XjuJIpvdH5M=;
	b=TmSrPH3aKEjnWOZUCzVRuLFpRCLUi65tCSu5WN+VKiGNvFuyjZ0yw7pAYupA28rXPq
	OOLOb2UQybxc00RTpDAiXogawFHj2wWflKggTOtrCVZn8/t6hLYOwjzLnVWnucEMcL6l
	RHeJJQv0Alz6oB5Ha682SC/VW7PnqvZhd2ACC+i0EhsTxP30QgZC9NDoPDXiFtPaJhpZ
	wvvy5lDt+H+RON+msW+D1zT1gnC6/m09rHxexH+Y7HEN6UFjviQnQNHH4DVEqYF5REtH
	lKHbQUxYiiSNDe9frtCuSBUY/KsUwsn7UUMA/aueVCQgxeqbYiJCnGWr3cQiglNUxHre
	xrtQ==
X-Received: by 10.204.145.219 with SMTP id e27mr788151bkv.140.1355841137648;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id z5sm1500825bkv.11.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 40459414F41; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:51 +0100
Message-Id: <1355841118-22361-10-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 09/16] Added python-pycrypto recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../pycrypto/files/001-remove-includes.patch       |   11 +++++
 recipes-python/pycrypto/python-pycrypto_2.6.bb     |   46 ++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-python/pycrypto/files/001-remove-includes.patch
 create mode 100644 recipes-python/pycrypto/python-pycrypto_2.6.bb

diff --git a/recipes-python/pycrypto/files/001-remove-includes.patch b/recipes-python/pycrypto/files/001-remove-includes.patch
new file mode 100644
index 0000000..5b6c0dc
--- /dev/null
+++ b/recipes-python/pycrypto/files/001-remove-includes.patch
@@ -0,0 +1,11 @@
+--- pycrypto-2.6/setup.py.old	2012-12-11 11:30:55.754674630 +0100
++++ pycrypto-2.6/setup.py	2012-12-11 11:37:53.802685825 +0100
+@@ -370,7 +370,7 @@
+       'ext_modules': plat_ext + [
+             # _fastmath (uses GNU mp library)
+             Extension("Crypto.PublicKey._fastmath",
+-                      include_dirs=['src/','/usr/include/'],
++                      include_dirs=['src/'],
+                       libraries=['gmp'],
+                       sources=["src/_fastmath.c"]),
+ 
diff --git a/recipes-python/pycrypto/python-pycrypto_2.6.bb b/recipes-python/pycrypto/python-pycrypto_2.6.bb
new file mode 100644
index 0000000..00b9174
--- /dev/null
+++ b/recipes-python/pycrypto/python-pycrypto_2.6.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "A collection of cryptographic algorithms and protocols"
+SECTION = "devel/python"
+DEPENDS += "gmp"
+LICENSE = "PSFv2"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://LEGAL/copy/LICENSE.python-2.2;md5=e752a62554a26df16a2fe44501f5e898"
+SRC_URI = "http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.tar.gz \
+	file://001-remove-includes.patch"
+
+SRC_URI[md5sum] = "88dad0a270d1fe83a39e0467a66a22bb"
+SRC_URI[sha256sum] = "7293c9d7e8af2e44a82f86eb9c3b058880f4bcc884bf3ad6c8a34b64986edde8"
+
+S = "${WORKDIR}/pycrypto-${PV}"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
+inherit distutils 
+
+CONFIGUREOPTS = " --build=${BUILD_SYS} \
+		  --host=${HOST_SYS} \
+		  --target=${TARGET_SYS} \
+		  --prefix=${prefix} \
+		  --exec_prefix=${exec_prefix} \
+		  --bindir=${bindir} \
+		  --sbindir=${sbindir} \
+		  --libexecdir=${libexecdir} \
+		  --datadir=${datadir} \
+		  --sysconfdir=${sysconfdir} \
+		  --sharedstatedir=${sharedstatedir} \
+		  --localstatedir=${localstatedir} \
+		  --libdir=${libdir} \
+		  --includedir=${includedir} \
+		  --oldincludedir=${oldincludedir} \
+		  --infodir=${infodir} \
+		  --mandir=${mandir} \
+		  --disable-silent-rules \		 
+		  --with-libtool-sysroot=${STAGING_DIR_HOST}"
+
+
+do_configure () {
+	./configure ${CONFIGUREOPTS}
+}
-- 
1.7.9.5


