Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAD7AE011C0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by mail-bk0-f50.google.com with SMTP id jf3so361887bkc.23
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=zusspbH9vG89mggS2ntGb1y7JLo4iJyo4kGiWtthe3E=;
	b=kL6cBIitBTzAZROBaAeAYmdHdeyc0Vt/EJqQPT0+2H+yxtKeA3026XOh79nc4FF3tL
	aoQ/nQLBW7CaKV7BkcrbB/dSqlC9R16ztkOR1mrEizotWoztJnGGLV5PZt6PESI28cOc
	Y9rWyVad8mZHzD3+Jrpuv8Ucg+cLXr5vNAEGS6i53uJ2A7PEE/Bery+PWcD3+8Ql3SpL
	JV9wu6N5+5Zf7WVJFvo4fsASr04WCa+2/l8F2HEDMLMrG4anOs3sIuxRkE8IIgwXWsM/
	zyIPi5IUlIxRtdp5/w5rF0pm0mjsJPSLJInE6KPda12KHhvfsggYzf/D263nE2Y26aXK
	Pjhw==
X-Received: by 10.204.148.145 with SMTP id p17mr819925bkv.136.1355841133665;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id o9sm1500231bko.15.2012.12.18.06.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 2CBA9414F3C; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:46 +0100
Message-Id: <1355841118-22361-5-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 04/16] Added python-httplib2 recipe
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
 recipes-python/httplib2/python-httplib2_0.7.7.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-python/httplib2/python-httplib2_0.7.7.bb

diff --git a/recipes-python/httplib2/python-httplib2_0.7.7.bb b/recipes-python/httplib2/python-httplib2_0.7.7.bb
new file mode 100644
index 0000000..1bd2191
--- /dev/null
+++ b/recipes-python/httplib2/python-httplib2_0.7.7.bb
@@ -0,0 +1,19 @@
+SUMMARY="HTTP client library"
+DESCRIPTION = "A comprehensive HTTP client library, httplib2.py supports many \
+features left out of other HTTP libraries."
+SECTION = "devel/python"
+LICENSE = "MIT"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://README;beginline=100;endline=121;md5=329279aa355faac89372002a7eefd42f"
+SRC_URI = "http://httplib2.googlecode.com/files/httplib2-${PV}.zip"
+
+SRC_URI[md5sum] = "407ad5c568c4bffa709703f73c63cb71"
+SRC_URI[sha256sum] = "50ef9930d29ec575fa593204511bd5e2c39c32ab1fa09258102fedf083915813"
+
+S = "${WORKDIR}/httplib2-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
-- 
1.7.9.5


