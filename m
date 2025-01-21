Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DDC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:13:03 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by mx.groups.io with SMTP id smtpd.web11.17833.1737472375227973771
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 07:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=shv7oc5v;
 spf=pass (domain: kernel.org, ip: 147.75.193.91, mailfrom: devnull+massimiliano.minella.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91BC8A41B95;
	Tue, 21 Jan 2025 15:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAF5BC4CEDF;
	Tue, 21 Jan 2025 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737472370;
	bh=mugXvTVt40Q0R1eVoieu2aNkXeAug1dwCaIWXoXYQFs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=shv7oc5vGhaJwwllj5g/dQ3cJu9umyvJsKD+AtcYQo9aEMR+LRxl3Cp1kiZ0g55Hh
	 ZugSho0KRPs0JMnDW+y1A8L9jHv7ov30j1dBF1UM2leT5G0JCRZgi/xtsjguwDXLdr
	 eMt/gAGaMOK8zb4cSNUgC3BOLG76+BUgNL9ywAVZFX+7rwNP8eFbUuuLClAoICXzSj
	 rxL7ysLSq9ZKFryWXtIWIHawdyQ0lnb+TMpqYg34SckLi6AWAVdjUBGqE8RFTYE5M+
	 9uZ+Y9FSrWwAijMPT8YlvN8xhLrv3AnUB+yvxKdwAkeb6c1h3oV6srvsiGx2F9rKH2
	 2+EAKpofCgZlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B594BC0218B;
	Tue, 21 Jan 2025 15:12:50 +0000 (UTC)
From: Massimiliano Minella via B4 Relay <devnull+massimiliano.minella.se.com@kernel.org>
Date: Tue, 21 Jan 2025 16:12:47 +0100
Subject: [PATCH RESEND meta-virtualization] virt-manager: use inherit_defer
 for optional gtk-icon-cache class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-use_inherit_defer-v1-1-dbfd42de3a01@se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737472369; l=1359;
 i=massimiliano.minella@se.com; s=20250121; h=from:subject:message-id;
 bh=zh1M+VIYhaVDdHzTqvyHbs1bN9I+xLH2CnDVhSv29bw=;
 b=aXlIka1l/NgkiYWrC9Kfx8FUuiIFOShokd0dQdhOWw1IusYkflCNmgiy1T+tApnicGkBVQfvD
 vISmO1GX0bED2HcwRvCoAvdvqAZALElxfw28CovjtQjcaNgNVoVqm4t
X-Developer-Key: i=massimiliano.minella@se.com; a=ed25519;
 pk=p6Og4stDBPm4cBEySH8oVWARLO52pxVayNFqHslSXU0=
X-Endpoint-Received: by B4 Relay for massimiliano.minella@se.com/20250121
 with auth_id=325
X-Original-From: Massimiliano Minella <massimiliano.minella@se.com>
Reply-To: massimiliano.minella@se.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 15:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9101

From: Massimiliano Minella <massimiliano.minella@se.com>

The inherit is controlled by the PACKAGECONFIG option "gui" but, since
it is expanded at parse time, this causes a build error if the option is
removed via a bbappend and DISTRO_FEATURES doesn't contain "x11" or
"wayland". Replace the inherit with inherit_defer to evaluate the
inherit at the end of parsing.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 recipes-extended/virt-manager/virt-manager_4.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git recipes-extended/virt-manager/virt-manager_4.1.0.bb recipes-extended/virt-manager/virt-manager_4.1.0.bb
index d752fd2b..08b7d02b 100644
--- recipes-extended/virt-manager/virt-manager_4.1.0.bb
+++ recipes-extended/virt-manager/virt-manager_4.1.0.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 PACKAGECONFIG ??= "gui"
 PACKAGECONFIG[gui] = ",--no-update-icon-cache --no-compile-schemas,python3-pygobject"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache', '', d)}
 inherit bash-completion gettext pkgconfig setuptools3_legacy
 
 PACKAGES += " \

---
base-commit: b57f8a25a35a93b95e3baa950c2d359fffc13051
change-id: 20250121-use_inherit_defer-0d8e1fb85c13

Best regards,
-- 
Massimiliano Minella <massimiliano.minella@se.com>



