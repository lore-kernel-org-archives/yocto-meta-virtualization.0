Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 511D4E00A4F; Fri, 31 Mar 2017 02:30:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.180.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 85 seconds by postgrey-1.32 at yocto-www;
	Fri, 31 Mar 2017 02:30:02 PDT
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 076C4E009B9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Mar 2017 02:30:02 -0700 (PDT)
Received: from 1ctsrD-0004eP-Vj by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1ctsrE-0004h5-TF
	for meta-virtualization@yoctoproject.org;
	Fri, 31 Mar 2017 02:28:36 -0700
Received: by emcmailer; Fri, 31 Mar 2017 02:28:36 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Dudau@enea.com>)
	id 1ctsrD-0004eP-Vj for meta-virtualization@yoctoproject.org;
	Fri, 31 Mar 2017 02:28:35 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Fri, 31 Mar 2017 11:24:34 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 286C44404BD;
	Fri, 31 Mar 2017 11:24:34 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Mar 2017 11:24:34 +0200
Message-ID: <1490952274-40183-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH] linux-yocto: drop 4.8 append
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
X-List-Received-Date: Fri, 31 Mar 2017 09:30:06 -0000
Content-Type: text/plain

Support for the 4.8 kernel is dropped in Yocto and the recipe
was removed from Poky.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 recipes-kernel/linux/linux-yocto_4.8.bbappend | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.8.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.8.bbappend b/recipes-kernel/linux/linux-yocto_4.8.bbappend
deleted file mode 100644
index f3be89e..0000000
--- a/recipes-kernel/linux/linux-yocto_4.8.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-	    "
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-KERNEL_MODULE_AUTOLOAD += "openvswitch"
-KERNEL_MODULE_AUTOLOAD += "kvm"
-KERNEL_MODULE_AUTOLOAD += "kvm-amd"
-KERNEL_MODULE_AUTOLOAD += "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
2.7.4


