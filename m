Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66F3AE003D9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:45 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182732eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2o882pK3WoadqIHMt4usV8UQRnT4yW1CFQOlToLhuYE=;
	b=mxUzxIZSbpYXIw8/9iUsC3yLc7kCe2dz/71i9i/wvpRkUuI20mN5LbJkUZC9fjT3mr
	9sRSyyoPh5q5sg6RKgLheorYsLuNtrqTbF+D4BFq15MJm88rElq2FnyxLJ/44wvxnLWe
	HSTtaek0k865fDkUoIepV/4r19WlIeVOruL0ACfYRkEyKTildGXTRt383IXdRu5r7PUQ
	rWldq4nZko+Xq4vJqsitGHF7CCGvdQv5C3ndUD2y0TXHUC/wROwFDR1NF9NL8qyYhhtz
	f+MiudzRt4Y/mPNWNqKHnaWQu98B/x2IOwLWh3fo8rk+h5crnjr+Do5Gcnfn0i9iSIqz
	vrHw==
Received: by 10.14.0.3 with SMTP id 3mr7629014eea.16.1354813604618;
	Thu, 06 Dec 2012 09:06:44 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 43sm16972159eed.10.2012.12.06.09.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:42 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 1F775400D24; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:23 +0100
Message-Id: <1354813596-8233-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 02/15] Added protobuf criu dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:45 -0000
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


