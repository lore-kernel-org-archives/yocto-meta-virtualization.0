Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-da0-f49.google.com (mail-da0-f49.google.com
	[209.85.210.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5925E01460
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Apr 2013 08:26:49 -0700 (PDT)
Received: by mail-da0-f49.google.com with SMTP id t11so1642096daj.36
	for <meta-virtualization@yoctoproject.org>;
	Fri, 05 Apr 2013 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=WR3CGbwCrD9y1BfJQAuHBFodh+yT2ff4mPScr+TCUVE=;
	b=V/LH9RrGn1tVTZbWsxLKLD2BY9BL7g3ahMb1lMf8IDQphEJu5F3VijB6loHazndS1W
	r9alhUYRQ7cAm9fV6+6Z/k3nIoWe/AnXWqvs2Kbt43CzzEfdsWz4WwY+4Zjbso1WuyG7
	iO1TmQX0YWQG+zjOpOLVDpr6NVsFnW4DIqZtxx9hiPnCrxaLUs6udZ99I3ijmjoZMGIJ
	OUy/UUmTgNm7bBIWwzSuLBed0bl8D/ObmNNuwc1+oxHR/fwp7Pw4dfWe10q13xlEdXo2
	F6pj9MYp6i02amsc/Bo0Oab365kfC22JYFI66sztilX6NnM1rYG0InLGEXnwY6qsCX8w
	AZ4Q==
X-Received: by 10.66.179.41 with SMTP id dd9mr15677857pac.30.1365175609689;
	Fri, 05 Apr 2013 08:26:49 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPS id of1sm1080673pbb.2.2013.04.05.08.26.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 08:26:48 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  5 Apr 2013 08:26:20 -0700
Message-Id: <1365175581-29815-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libvirt: add dtrace pkgconfig option
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
X-List-Received-Date: Fri, 05 Apr 2013 15:26:50 -0000

If the host machine has dtrace, or systemtap development libraries
installed, libvirt will detect their headers and enable dtrace probe
support.

But since we don't have a dependency on dtrace, the build will fail
with:

  | compilation terminated.
  | In file included from ./internal.h:297:0,
  | from util/bitmap.h:27,
  | from util/bitmap.c:33:
  | ./libvirt_probes.h:9:21: fatal error: sys/sdt.h: No such file or directory

There are three problems:

  - a host contamination issue
  - dtrace/probes being automatically enabled
  - a lack of integrated systemtap/dtrace solution

Fixing any of the above will make the problem go away, to fix currently
broken builds, we can fix the problem by adding dtrace as a PACKAGECONFIG
option, and leaving it disabled. This change doesn't add a dtrace/systemtap
dependency to the config entry, since they haven't been confirmed at this
point.

In the future, we should either fix the host contamination or do a full
systemtap/dtrae integration, but for now, simply disabling it is the
best choice.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

Sending this patch out for comment, it's minor change. If there are no objections,
I'll push it into the repository tomorrow.

Cheers,

Bruce

 recipes-extended/libvirt/libvirt_1.0.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 372e874..bf8c9ec 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -128,6 +128,7 @@ PACKAGECONFIG[remote] = "--with-remote,--without-remote"
 PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
 PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
 PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
+PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.10.4


