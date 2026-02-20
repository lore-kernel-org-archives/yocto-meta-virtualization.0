Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67034C5AC80
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:53:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.633.1771602805085246067
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Feb 2026 07:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 390ED339;
	Fri, 20 Feb 2026 07:53:18 -0800 (PST)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.199.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 099D03F7D8;
	Fri, 20 Feb 2026 07:53:23 -0800 (PST)
From: adam.johnston@arm.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@arm.com>
Subject: [meta-virtualization][PATCH 0/1] k3s: Correct name for containerd conf
Date: Fri, 20 Feb 2026 15:53:07 +0000
Message-Id: <20260220155308.3837591-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Feb 2026 15:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9599

From: Adam Johnston <adam.johnston@arm.com>

The config list provided by the K3s recipe follows the format for a
config list (.conflist) but has the extension of a config file (.conf).
When the file is parsed, this results in...

failed to load CNI config file /etc/cni/net.d/cni-containerd-net.conf
error parsing configuration: missing 'type': invalid cni config

Rename the file from .conf to .conflist so that it is parsed correctly.
This matches how the file is named for containerd and kubernetes
recipes.

Adam Johnston (1):
  k3s: Correct file extension for containerd conf

 .../{cni-containerd-net.conf =3D> cni-containerd-net.conflist}    | 0
 recipes-containers/k3s/k3s_git.bb                               | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename recipes-containers/k3s/k3s/{cni-containerd-net.conf =3D> cni-cont=
ainerd-net.conflist} (100%)

--=20
2.34.1


