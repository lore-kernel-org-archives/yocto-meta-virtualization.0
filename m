Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EF3FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 13:54:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45825.1777298084317933534
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 06:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@semalibre.com header.s=dkim header.b=ZxkZt7cl;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1CFE1A3443;
	Mon, 27 Apr 2026 13:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91B4D600D1;
	Mon, 27 Apr 2026 13:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92B5E1072821F;
	Mon, 27 Apr 2026 15:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1777298082; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hjq7QtOypA5YZFuGmTNIUJjys8haYU9fXGowVwqTkzo=;
	b=ZxkZt7cl5JfcmdtkmJEV255VzBrMprPceoTl9pNIKsZYu3sxc1wcBTwe4HxWrDPZ2d+R8H
	Nfg2t1gBWIyQrTZEropIFyH7ooBJD8Vi6UEStsPax4XKbhrcsPa2sv7+is8B3078W7OjwF
	5A3lIdhPVyxAKI+VIL4Z+SnCaCzAfyzqZgQ7x7Lmn6I/IHv+Tf9bfyzsQFJ7EPRJIAR+fe
	XmUtoF7edAeZe+Itc//azZXy7xjzC3/PTMLvuwLCwwiYbCXxhUGyxBvkQ8wliTT4hgF2NI
	5VPL6KCNy292MFy7sajayJYujPbH95GOoXWqq74eUBAsydGxdUTpC4nQsQAW1g==
From: Louis Rannou <louis.rannou@semalibre.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: pascal.eberhard@se.com,
	Louis Rannou <louis.rannou@non.se.com>,
	Louis Rannou <louis.rannou@semalibre.com>
Subject: [meta-virtualization][PATCH] libvirt: remove obsolet depends to avahi
Date: Mon, 27 Apr 2026 15:54:31 +0200
Message-ID: <20260427135431.205900-1-louis.rannou@semalibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 13:54:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9746

From: Louis Rannou <louis.rannou@non.se.com>

libvirt has removed support for avahi in version 5.5.0 in 2019:

  * Remove Avahi mDNS support

    This feature was never used outside of virt-manager, which has itself
    stopped using it a while ago.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Louis Rannou <louis.rannou@semalibre.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index b5b0a5f2..34a1ff21 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
                     file://COPYING.LESSER;md5=3D4b54a1fd55a448865a0b32d4=
1598759d"
 SECTION =3D "console/tools"
=20
-DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap =
util-linux e2fsprogs pm-utils \
+DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 parted curl libpcap util-l=
inux e2fsprogs pm-utils \
 	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper l=
ibtirpc \
            python3-docutils-native \
 	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '',=
 d)} \
--=20
2.53.0


