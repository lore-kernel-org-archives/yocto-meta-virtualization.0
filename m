Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF003E01454
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: by mail-bk0-f41.google.com with SMTP id jg9so369625bkc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=wJRC0Gpw2aFKVGtES00xEHHBmNblUiL0zfEzIJWfCMU=;
	b=D0E6UbCVnIcAt0eYvAGVyws634VSh5GYtqQR+ohh9tPdm/hjnwQwqq92sjxN49sX7u
	9H9vXmbO/j0VzLfa7lcShUShXqsqore+63+DjpeoWuvLujws9Tor86+oMYtY7A9ia6pe
	iHhhuFons5hmnYkWVTJHecOGrViG8Uk0VVcoRJ8nCACMFgnx6rKeWE6alsLPfnK3k/0B
	CLpgubVP9WecQXY30tgUg5bkT5R7xnP9+Hz781/Rimqd1RaY76XaWqDIsfkf1fBLXp9p
	VPvKd7cGsCXa+4Zcskn1ehHnfevx2o7GmFwhve0jEHPbwIBLQiTPFmmmt4DlLLzhYV7h
	XDgg==
X-Received: by 10.204.11.142 with SMTP id t14mr857958bkt.9.1355841135915;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id r16sm1504609bkv.3.2012.12.18.06.32.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 32C1C414F3E; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:48 +0100
Message-Id: <1355841118-22361-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 06/16] Added python-jsonpointer recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../jsonpointer/python-jsonpointer_0.5.bb          |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-python/jsonpointer/python-jsonpointer_0.5.bb

diff --git a/recipes-python/jsonpointer/python-jsonpointer_0.5.bb b/recipes-python/jsonpointer/python-jsonpointer_0.5.bb
new file mode 100644
index 0000000..a5451ba
--- /dev/null
+++ b/recipes-python/jsonpointer/python-jsonpointer_0.5.bb
@@ -0,0 +1,16 @@
+SUMMARY = "python-jsonpointer"
+DESCRIPTION = "Identify specific nodes in a JSON document"
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "MIT"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://jsonpointer.py;beginline=3;endline=31;md5=5e663c88967b53590856107a043d605c"
+SRC_URI = "http://pypi.python.org/packages/source/j/jsonpointer/jsonpointer-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "41fe4189279b9c6cd35a4131cb2498f2"
+SRC_URI[sha256sum] = "6a27fb4cb590a118d0f8c7e367f902cf553abf5dcb4b7938cdc91cc36e3e4bdf"
+
+S = "${WORKDIR}/jsonpointer-${PV}"
+
+inherit distutils
-- 
1.7.9.5


