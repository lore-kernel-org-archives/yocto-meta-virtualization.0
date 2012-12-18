Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBBDBE0145B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: by mail-bk0-f54.google.com with SMTP id je9so371023bkc.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=T7dB+77JkXo3jUeAlRDPC8rnrGxJp/AvJ71CUFls6Zk=;
	b=lluLAEYfAmhEpIwUXHEZnSaZcZPHO6hJ/a12obYoCmttUlkbfkCHAVrVnlRT5m/Ayl
	KDmxn8tXmCyaCOMnLk0Tyf7Tp/2UoZVDwPIZHpiuG2QPB1YQRueT4YQz2ky8gSzdh33X
	wv0p9ALmtp2dBAdrotbXjmOeJqF6lKxNU3K6yGNaSuWpuq44TIvZfBCqVPZ8LmG8rPTl
	+Ungt0tSuSKO79AZrhM7Da80do4fiWCZPvqMVjd+Dm5eMi1NSLbb4L/Bkaq6jsBH8MdU
	ybYH8/SXw99RaD0kMZ/iPoCtc+NaAHNEM2Gs9O9chsS+JhyDVmkBrUlaR5Mchi/281xS
	b5cw==
X-Received: by 10.204.148.154 with SMTP id p26mr826215bkv.31.1355841135448;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 18sm1505430bkv.0.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 37BA0414F3F; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:49 +0100
Message-Id: <1355841118-22361-8-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 07/16] Added python-jsonschema recipe
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
 recipes-python/jsonschema/python-jsonschema_0.7.bb |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-python/jsonschema/python-jsonschema_0.7.bb

diff --git a/recipes-python/jsonschema/python-jsonschema_0.7.bb b/recipes-python/jsonschema/python-jsonschema_0.7.bb
new file mode 100644
index 0000000..7f6d40b
--- /dev/null
+++ b/recipes-python/jsonschema/python-jsonschema_0.7.bb
@@ -0,0 +1,22 @@
+SUMMARY="jsonschema"
+DESCRIPTION = "jsonschema is an implementation of JSON Schema \
+	    (currently in Draft 3 \
+	    <http://tools.ietf.org/html/draft-zyp-json-schema-03>) \
+	    for Python (supporting 2.6+ including Python 3)." 
+SECTION = "devel/python"
+LICENSE = "MIT"
+PR = "0"
+
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=833b6ec380e7cdfcdab8ea6138da2e34"
+SRC_URI = "http://pypi.python.org/packages/source/j/jsonschema/jsonschema-${PV}.zip"
+
+SRC_URI[md5sum] = "b93f9bd7864d7c5c587951efa4c0a80f"
+SRC_URI[sha256sum] = "703b92b969d245b060b37055305110539507dfdc64ac1760b1868ca489c121e0"
+
+S = "${WORKDIR}/jsonschema-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit distutils
-- 
1.7.9.5


