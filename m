Return-Path: <r63875@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe001.messaging.microsoft.com [213.199.154.204])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10C7BE0131E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Mar 2013 23:01:50 -0700 (PDT)
Received: from mail71-am1-R.bigfish.com (10.3.201.254) by
	AM1EHSOBE026.bigfish.com (10.3.207.148) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 06:01:49 +0000
Received: from mail71-am1 (localhost [127.0.0.1])	by mail71-am1-R.bigfish.com
	(Postfix) with ESMTP id EFAC94E0084	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2013 06:01:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz177df4h17326ah8275dh8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail71-am1 (localhost.localdomain [127.0.0.1]) by mail71-am1
	(MessageSwitch) id 1363154506617372_30374;
	Wed, 13 Mar 2013 06:01:46 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.247])	by
	mail71-am1.bigfish.com (Postfix) with ESMTP id 94A671203CA	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2013 06:01:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 06:01:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 13 Mar 2013 06:01:45 +0000
Received: from localhost.localdomain (rock.ap.freescale.net [10.193.20.106])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r2D61fuY016957; Tue, 12 Mar 2013 23:01:43 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 Mar 2013 13:28:13 +0800
Message-ID: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.6.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <hong-hua.yin@freescale.com>
Subject: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Wed, 13 Mar 2013 06:01:50 -0000
Content-Type: text/plain

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.0.0.bb
rename to recipes-extended/libvirt/libvirt_1.0.3.bb
index 90d7dbb..372e874 100644
--- a/recipes-extended/libvirt/libvirt_1.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
 	file://libvirtd.sh \
 	file://libvirtd.conf"
 
-SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
-SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
+SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
+SRC_URI[sha256sum] = "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
 
 inherit autotools gettext update-rc.d
 
-- 
1.6.4



