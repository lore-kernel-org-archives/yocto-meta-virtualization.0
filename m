Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f196.google.com (mail-ea0-f196.google.com
	[209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9016FE01467
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:55 -0800 (PST)
Received: by mail-ea0-f196.google.com with SMTP id m6so431583eab.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=AolH7GuCXGU5qE1AWSOObF8+Fc+qlbgwjM9IhtHO46g=;
	b=r+ye//1F5Rmi8uVANS4eRvcO7XMppiU9+SgyPu8utLkMkyZ182vaFp7N0UwO/ks70X
	pbEsvRDD8prCrZiBgzz8sfMQtECoV6fQtezfW+4tVYRs9sNSQTr6DND9kTHcLuVg6dZJ
	tf/p+3u4oiYQO8e0LnKH782LHvDp5AsrA58+Al7aGpAMPBSNpgw8VJmyBqfFX4xIMiuR
	hZUIE2W5bAYPJ/7bGkmgjImRCMBatCL4Ct69FlTt1hFtZM8JVgoxgcbhVjzRs3yb+Fgp
	HiV/58SFlk5DoTWNrmDuw9G6wDWvv3I8hFRtHwJlRebJFvI2MFYuUGU7dOCDWh/GEbu9
	b0TQ==
Received: by 10.14.215.194 with SMTP id e42mr6007010eep.32.1354802634765;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id w3sm16072089eel.17.2012.12.06.06.03.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C03EE4011B6; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:19 +0100
Message-Id: <1354802601-10840-13-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 12/14] Added some details in README, and made the description common
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 README |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/README b/README
index 0ee4047..f9f890b 100644
--- a/README
+++ b/README
@@ -1,12 +1,8 @@
 meta-xen
 ===========
 
-This layer provides support for building Xen, Libvirt, and associated
-packages necessary for constructing an OE-based Xen distribution.
-
-This layer provides support for building KVM, Libvirt, OpenvSwitch et.c.
-and associated packages necessary for constructing virtualized solutions for
-Openembedded based distros.
+This layer provides support for building Xen, KVM, Libvirt, and associated
+packages necessary for constructing OE-based virtualized solutions.
 
 Dependencies
 ------------
@@ -15,10 +11,13 @@ This layer depends on:
 URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
+prio: default
 
 URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
+layers: meta-oe
+BBFILE_PRIORITY_openembedded-layer = "4"
 
 Maintenance
 -----------
-- 
1.7.9.5


