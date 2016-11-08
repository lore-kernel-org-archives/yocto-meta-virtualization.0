Return-Path: <igor.socec@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8019E00724; Tue,  8 Nov 2016 05:59:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.42 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CE26E00571
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Nov 2016 05:59:29 -0800 (PST)
Received: by mail-lf0-f42.google.com with SMTP id c13so139936224lfg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Nov 2016 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OTdsyHrt0qs1SRgUalhpswHjBw9yUnVszP4FkV5Xe9w=;
	b=AF9CHBPPX7dXPXPOoHJxpFIBGGzY6xUkyWLX9HgWzTT7XHJPvyqJAaFWxXfHuyH0ZS
	2ZNqzhxFMX1l4Wp6OFWCsHersbd/2FH8mc1Ip6kB+GzdYVZYn7y8DsPPBs0OkwBOd5f+
	UBMD0BmIurQm/EEZbMK1T6eTIx9HEtiiE5uhg40oUPTqW8BQol2gLkgEBzoG1FxnrwUB
	2/vvdWQgBziTcsykOJgb1PN1n5dwfvdwZcS/eu2YZovkPVgM1pyOPEBPMwbdcOeB1FHt
	LzboCQf1qnUdxWdULDQro1tDoa75qHSbvejH/I5JpANs7zG+PT4edYYGJp2pzgYYjM+O
	Mjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OTdsyHrt0qs1SRgUalhpswHjBw9yUnVszP4FkV5Xe9w=;
	b=edl6XotaZAZrqcQ7p/b5DwDS5NygmguriJHJOev03vMe60WJQ2nY7RROwQVCIceWKm
	8gITHKkaV2yKx2dqV7S/zO/8ZZ/MMR/Pqep7mdSnjjM/mdm9NPIXp5NArLo7LDiTSgjR
	1xTSzI0x+OqNFXsrOllOXioPnXUo5UZN8LePfbs/BHZ64pz1fOuIv77IWeOmGB83pGDD
	qZllJ+gpxotZrEWkDi4CibhxC/PMJNmQIoiyyNwDtQyGCIV0VL0usd/t540qfYdN2SMO
	Uy62/vQj0PzEIhUETBGcTv4dz0cOu92VSegreEQ82MteeRZZTViVKNXXWwMUHgC+ekFk
	9dqw==
X-Gm-Message-State: ABUngvfhnKLPmxl3wGse2YSQsiKW6GjhlInSXtcr0y7pE3p0H/qCDrkPf9H+xDrb68lCb8Qd
X-Received: by 10.25.77.133 with SMTP id a127mr1094540lfb.165.1478613567885;
	Tue, 08 Nov 2016 05:59:27 -0800 (PST)
Received: from mydeb.mecel.net (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108])
	by smtp.gmail.com with ESMTPSA id n6sm1592057lfd.41.2016.11.08.05.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 05:59:27 -0800 (PST)
From: Igor Socec <igor.socec@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 Nov 2016 14:59:16 +0100
Message-Id: <20161108135916.6314-2-igor.socec@pelagicore.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] lxc: move .debug directory to debug package
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
X-List-Received-Date: Tue, 08 Nov 2016 13:59:31 -0000

Bitbake reports a [debug-files] QA Issue for the following path:
packages-split/lxc/usr/lib/lxc/lxc/hooks/.debug/unmount-namespace

Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
---
 recipes-containers/lxc/lxc_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 53068a8..5e45949 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -84,7 +84,7 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN} += "${libdir}/python3*"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.debug"
 PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
 RDEPENDS_${PN}-templates += "bash"
-- 
2.9.3


