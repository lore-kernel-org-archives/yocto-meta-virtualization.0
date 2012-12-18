Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0621CE00770
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 07:20:48 -0800 (PST)
Received: by mail-pa0-f47.google.com with SMTP id fa10so606040pad.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=Mc7rTlNBmLq4YpygWEdKLf7ahtVLoj17P3Q4MS1JRE8=;
	b=0ihdNJ35m3Ek+86D+M+/IIRPRmRNtVvo6H6mulSDdqUI7nWwc4s2NS8qm8J9Au+ToV
	gw4wiebdi6SfU+0JN9nQvEb6P4ifyP+QFORcp+9M3QrDidS4xmjKbZtRgrA4DHMjC46i
	mC33PA46E3VYdO2gw8yY1Qe5nRvK4/fe84yML3I6QGOvz4Rkbsnr24Ux95L5V0DDMznI
	eWrJO5QAWOHjzlKlCT7oCI0OUVJntlY4YH4SxZ8E4B4wDfR+JUgHJ0v9T5q7UBoiJ3bm
	ZrmM4U8asBjDE5t479AGA2zsM2ZwPYTj6YS0beoVrw7mVSkntTNbl58d9IGGDeXL2BcV
	m4/Q==
X-Received: by 10.66.88.133 with SMTP id bg5mr7785244pab.21.1355844047762;
	Tue, 18 Dec 2012 07:20:47 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPS id tq4sm1309333pbc.50.2012.12.18.07.20.46
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2012 07:20:47 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 10:20:37 -0500
Message-Id: <1355844039-14956-1-git-send-email-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] README: cosmetic: reference meta-virtualization vs meta-xen
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
X-List-Received-Date: Tue, 18 Dec 2012 15:20:48 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

I noticed this while reviewing patches this morning. A minor change, with
lots of others to come, but no sense sitting on these patches.

If no one objects, I can push this later today.

Bruce

 README |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index f9f890b..c630494 100644
--- a/README
+++ b/README
@@ -1,5 +1,5 @@
-meta-xen
-===========
+meta-virtualization
+===================
 
 This layer provides support for building Xen, KVM, Libvirt, and associated
 packages necessary for constructing OE-based virtualized solutions.
-- 
1.7.10.4


