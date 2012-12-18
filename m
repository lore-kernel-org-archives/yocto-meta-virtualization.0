Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f47.google.com (mail-bk0-f47.google.com
	[209.85.214.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F812E0141C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:20 -0800 (PST)
Received: by mail-bk0-f47.google.com with SMTP id j4so362360bkw.20
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cjbxYBjVvN6T4j0Ej6DGgDH7Iyhoan/xQuVLptdj/l4=;
	b=Fca/y2Rpn2vcF66QyanpJmSid84iJ6HPkgUMssRRIk/LYRV1Kud/oSRFB6Jgagl7LB
	j10ki4JspkDbphIW+aSdKQ0/sa4DqCo9/Lje+5EltrmE7AAZIB97KpqoXMcZjAXoGl23
	Xvo/7Lz18hhAiOfkHFPWT9bZG4UNC/xBKbOAmpRTpYoTGh0xLibxwtGRZjrGLSucZojY
	mNbaRuqKd7MvQ6O+nmNxRpjvp1OKOzsnMQt0WByhyW2Z0OQE1JePUhD3ooTPQ/jZEnPT
	x0DDs7oUUQypw7yKqtespF9GMV04M0GMdLnpcNuHtXCuB2j1F8GTMCPHSnrlinsZMe12
	wXNg==
X-Received: by 10.204.149.86 with SMTP id s22mr836364bkv.57.1355841139240;
	Tue, 18 Dec 2012 06:32:19 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 18sm1505710bkv.0.2012.12.18.06.32.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4F37B414F48; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:58 +0100
Message-Id: <1355841118-22361-17-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 16/16] Added python-keystoneclient recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../keystoneclient/python-keystoneclient_git.bb    |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-cloud/keystoneclient/python-keystoneclient_git.bb

diff --git a/recipes-cloud/keystoneclient/python-keystoneclient_git.bb b/recipes-cloud/keystoneclient/python-keystoneclient_git.bb
new file mode 100644
index 0000000..3744add
--- /dev/null
+++ b/recipes-cloud/keystoneclient/python-keystoneclient_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Python bindings to the OpenStack Identity API (Keystone)"
+DESCRIPTION = "This is a client for the OpenStack Identity API, implemented \
+	    by Keystone. There's a Python API (the keystoneclient module), \
+	    and a command-line script (keystone)"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+PR = "0"
+
+RDEPENDS_${PN} += "python-httplib2 \
+	python-prettytable \
+	python-simplejson \
+	"
+
+SRCREV = "27f0c721174b149c64cc67ff718d007d94fe79aa"
+PV = "0.2.0+gitr${SRCREV}"
+SRC_URI = "git://github.com/openstack/python-keystoneclient.git;protocol=https"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
\ No newline at end of file
-- 
1.7.9.5


