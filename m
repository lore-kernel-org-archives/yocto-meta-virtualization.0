Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D075E00777
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 07:20:49 -0800 (PST)
Received: by mail-pa0-f44.google.com with SMTP id hz11so606326pad.31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 07:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=dPFbzHxv1awqnTYoUKy8cgl4XrgZTv54jz/TOkqzt1M=;
	b=d3yAULESPX6GyzIylFRBtdpqL/C9Ha6IYtVxe0LpnrVyb/A2LOqhMfYloCVssfku4Q
	yb8dVrpk94zd99Z8sOjA1FdTx0MZUEMZQnW0GT3SCyc5JqB2k0LhjYakuO8Zvsz/kR92
	u/W6fSoEsEXlocROQL5wMIyCXCilhvXG7N0a6/JizwB7xK996YFDgefb13gsQCQV3jsA
	3uNuBCCJ2IdGFYjeMU/mDjBIYUc+AxCdOpM8PtFcxI1SPIEPtXjg5xdG15Im1hQNlFam
	siosXl5VPSrlVhUnO2kweorOzlWTCM++5AlBDG6ZUKySquBxFD35sFila6HjnoGRnI07
	3eYw==
X-Received: by 10.68.131.73 with SMTP id ok9mr7948691pbb.83.1355844048889;
	Tue, 18 Dec 2012 07:20:48 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPS id tq4sm1309333pbc.50.2012.12.18.07.20.47
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2012 07:20:48 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 10:20:38 -0500
Message-Id: <1355844039-14956-2-git-send-email-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355844039-14956-1-git-send-email-bruce.ashfield@gmail.com>
References: <1355844039-14956-1-git-send-email-bruce.ashfield@gmail.com>
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
X-List-Received-Date: Tue, 18 Dec 2012 15:20:49 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
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


