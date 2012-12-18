Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE89FE011C0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: by mail-bk0-f41.google.com with SMTP id jg9so370183bkc.28
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cHdqjgBv0ad97g84HI8HfYrDzPwnAN9EvLaM2HeyNEg=;
	b=pFamW89BdIt6DNb2Ybzd60f1/+QNHBXJ3tHdgTUH9nVHOOxFQsOWh+xlMNGdFb9R1Y
	hrMNBoaQzD2BxpK8gP7At/LVP2FacQ9JaPvt5bJeOTUUm3q6Q8QLnmC6NZz69ykhiUex
	US/UDevNvtJfmbqFDeTHvg4YCn4F5L1mO51IvaZu0o7cIGv0uKjTWnXri0iAJQwayLZc
	9eZ+dE6dmbYr1lQdfjEMJgefzVpYKRIMuLDar/0dZU1mfwnknjzkR6u42lceDHX1s7zT
	Rw2mQH0Bnzo4pahyM9yXyLEBeVmn8q2JZsw55VrnAVov6+gSywu9AZgRCOIyRq1erwc+
	UKaQ==
X-Received: by 10.204.12.202 with SMTP id y10mr856747bky.51.1355841137936;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id o9sm1499990bko.15.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 46A14414F44; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:54 +0100
Message-Id: <1355841118-22361-13-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 12/16] Added python-simplejson recipe
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
 .../simplejson/python-simplejson_2.6.2.bb          |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-python/simplejson/python-simplejson_2.6.2.bb

diff --git a/recipes-python/simplejson/python-simplejson_2.6.2.bb b/recipes-python/simplejson/python-simplejson_2.6.2.bb
new file mode 100644
index 0000000..5ff26c8
--- /dev/null
+++ b/recipes-python/simplejson/python-simplejson_2.6.2.bb
@@ -0,0 +1,21 @@
+SUMMARY="json encoder/decoder"
+DESCRIPTION = "simplejson is a simple, fast, complete, correct and extensible \
+	    JSON <http://json.org> encoder and decoder for Python 2.5+.  It is \
+	    pure Python code with no dependencies, but includes an optional C \
+	    extension for a serious speed boost."
+SECTION = "devel/python"
+LICENSE = "MIT"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8a9f8dcfcd28c34daa443e5b1d29813b"
+SRC_URI = "http://pypi.python.org/packages/source/s/simplejson/simplejson-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "9b41cd412dfac7c002aeca61ab0fdfe2"
+SRC_URI[sha256sum] = "1b28d0896a76d4db1ab759204c039ab1ca4bf28bd30d6bf9c79172454e750dd3"
+
+S = "${WORKDIR}/simplejson-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit distutils
-- 
1.7.9.5


