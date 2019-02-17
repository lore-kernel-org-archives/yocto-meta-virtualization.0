Return-Path: <open.source@oleksandr-kravchuk.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D804FE00C38; Sun, 17 Feb 2019 10:25:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F170E00BCC
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Feb 2019 10:25:56 -0800 (PST)
Received: by mail-ed1-f66.google.com with SMTP id f2so11937133edy.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Feb 2019 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sM9Mp9TRMmxmtmDcB6JbGlcLxiWcPajARauDHMb4UGI=;
	b=IVoUWWLT0noHNs3/LZNJe0rnXAEB60HVozIMOvc1C+i5xzz6eHR3YR7X2kUVD5pxvD
	L5/DGZ1wdZVkqKQ5Te85jP+qzgCK2RqBLTkXRrMKwVlJG2HSpXeOPXKVOQ74/Gys0btZ
	vvXp3qCU1ch8GH6Qxq4OOn9povmknHNfVNhDXrp0KBNu0NkZGhFGAgkzckvUaeBlun+J
	nV+xqv69mn05OeDQjxSO2Fcx29T8QH7XVh/sPlN9ieK0EhUoVlOF4KPZ66gHA+G8RhII
	jKJNaQRhpn1FxohBpkGNKf+fW0PEy6OONzCHDgFeKXR3M8THyJzBFpneFMspFngu9iY0
	SaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sM9Mp9TRMmxmtmDcB6JbGlcLxiWcPajARauDHMb4UGI=;
	b=SgdahKAVfgwrU8Mx2KQe3KGhjh9rxN7bTZb+KpokZufrWL3aYtCwAWf7wDtQ3humSn
	weBuwHNFD38wuvsNPGpe2qXZHh3C5be3s7/XRMScb2p9g4oMkcUIR+XFmDQ9C3krPpn+
	KITNBCtAumAy1yn8ACb2zbFeX1+ljSu5y+NWi2TOpqa8hR7q+9zM3Wc1VRhg1nwitNc4
	MxRSk+bZRV/ThTjaaSp4YTZxlnSe/jJvU0edd+hh+5VIZQJ8NLRjcrhhS8+yWrXLh4zv
	i0ADjMNiu/9cf5MBxrFPRDPdNx5Z6+7HmaCQZ2f1O4qizRK3bk1S6+DJsF4Jqn/oP5o2
	3RmQ==
X-Gm-Message-State: AHQUAuaaNmesNBgxallxdfQlgKcUICf53bcke1m3zNNZszY0Czd2QMwJ
	IDe1WQm/mK6EbAA7AV5b2IZB+g2Sriw=
X-Google-Smtp-Source: AHgI3IZaRjTk13DRnIwg/2XqanfQAeYKbbfQGSgqtmmoEZzTTO6VfPI4EoCapPyyt8HCKHLUJUHzJQ==
X-Received: by 2002:a50:ad57:: with SMTP id z23mr15549084edc.223.1550427955207;
	Sun, 17 Feb 2019 10:25:55 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id o6sm474595ejb.14.2019.02.17.10.25.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:25:54 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 17 Feb 2019 19:25:35 +0100
Message-Id: <20190217182535.22222-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [thud][PATCH] lxc: remove perl-module-warnings-register from RDEPENDS
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
X-List-Received-Date: Sun, 17 Feb 2019 18:25:57 -0000

This module is part of the perl package now and is shipped by default.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 recipes-containers/lxc/lxc_3.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/lxc_3.1.0.bb
index 9dba76b..977583f 100644
--- a/recipes-containers/lxc/lxc_3.1.0.bb
+++ b/recipes-containers/lxc/lxc_3.1.0.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} = " \
 		perl-module-strict \
 		perl-module-getopt-long \
 		perl-module-vars \
-		perl-module-warnings-register \
 		perl-module-exporter \
 		perl-module-constant \
 		perl-module-overload \
-- 
2.17.1


