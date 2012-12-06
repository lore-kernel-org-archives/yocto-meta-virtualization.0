Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21552E01458
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:52 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008282eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5WUu/JRWeW3CqfoZhe6ntPQVCzbbvoClBy3TWNRVBjA=;
	b=UDd2IcUlWG/H+80O5nqTGOPfgPL+1ogMDBs/NrXtTNpJcGk31Q+Z5yut+teNWiMBkU
	6gftXcErFCHAe8AD0lCb8HnVrKEY9OD50tQq36gel+6+0S0GORegfbHgqnhJBTeQZK+w
	BieqyFEUHDK7sI0PQITor0oS6bezbLu97QSKm/o+r0qGFvFqBS+XqWqTzdxumJ4f5DJB
	kjJeyvxc2LKHcy/iyVFDGw0Vh5i1H2iZeWnFMnqRs7y3Emb2Ef9st1OgWWWHmG68p71+
	wmEG7FTIQj9RoZuLsvh52fuskPWJ4wdHSw6ylpGxNdF6l8NGZGXj8elSdwRGRiHGMN/3
	XiVw==
Received: by 10.14.199.5 with SMTP id w5mr5608444een.31.1354799632241;
	Thu, 06 Dec 2012 05:13:52 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f49sm15841156eep.12.2012.12.06.05.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:51 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4AC9A400D15; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:33 +0100
Message-Id: <1354799626-6911-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 02/14] Added protobuf criu dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:53 -0000

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


