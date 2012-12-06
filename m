Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2D36E01448
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:52 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044017eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2o882pK3WoadqIHMt4usV8UQRnT4yW1CFQOlToLhuYE=;
	b=X5vNKNAseZJSu0I6wa9ZEp025CBa9h0hKhuGwTlwz4cV1QROD6u0plzxZfGcXTPfE+
	4JjV7LWO4jAiSSx/kqxt/7AEGSvsXHt5/M0O/GQLS6cHkJDyiEAXJv2FfKn1kPAjZFuY
	UWFsWr+qHH6WKuWgXOrwplRjMvwSSy9D7TzMM9LTqRmZs7dbRvBDZQ3pNiuSz8CVHrpE
	YQHphIJEDixUV9849V4YJCwKl1RymHz69lIyTvzM6URotzDrZq2pst81X9QSTuiALKGP
	kNZN9IwMu3aPED/1cketoA/8yyAEZ1T9VWsY2Ivgo1fEipvcyZoxkOesH9WRXwZqEcbL
	pHpw==
Received: by 10.14.221.5 with SMTP id q5mr5980840eep.33.1354802631816;
	Thu, 06 Dec 2012 06:03:51 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d3sm16074258eeo.13.2012.12.06.06.03.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:50 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 90262400D15; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:09 +0100
Message-Id: <1354802601-10840-3-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 02/14] Added protobuf criu dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-containers/criu/protobuf_2.4.1.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb

diff --git a/recipes-containers/criu/protobuf_2.4.1.bb b/recipes-containers/criu/protobuf_2.4.1.bb
new file mode 100644
index 0000000..d8f1b53
--- /dev/null
+++ b/recipes-containers/criu/protobuf_2.4.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an efficient yet extensible format. Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
+SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
+
+EXTRA_OECONF += " --with-protoc=echo"
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
1.7.9.5


