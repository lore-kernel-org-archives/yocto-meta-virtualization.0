Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E8FD65C6C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:35:37 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17786.1765985734457287346
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 07:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=tSTe6Pkf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3EEA03D85347
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 10:35:33 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id aqcjNbnli8Wb; Wed, 17 Dec 2025 10:35:32 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 87A143D84821;
	Wed, 17 Dec 2025 10:35:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 87A143D84821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1765985732; bh=vcm7cBeH1DphX4elcnAfJMyCHfbGlSJVX3Hhii7pA1I=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=tSTe6PkfGuyKVd4gG9Yzb827tUMjgcafMDRuqGzZF0u4Hts4QEJTj+qKfnMzKa1Oy
	 hGNuLmD9VpCqUFBvY0Sgzu0rFHekSRHMI0trf5gzEc0pIX50fHYidgYeSySkExnN9b
	 TtvaYT2C3axHrXe+8G5gzD1inV8dYpbz9p2w55XzlWOVLyKkGKcbIozQAtvBFXCCjW
	 mKYohoR3sI/BW84dg8CVYLrz6dPCXiexf9VB43rAL36toKTi6K2enaJN+LgX31ntTl
	 CojXk/NHu8/6tr33JH+5b9RdFBjZzalb+Il1RMs2XYXAO7VSLxXgqARjoNttSUHnJN
	 Z6Ily0Hl6ejSQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id M1JF0jJYtnob; Wed, 17 Dec 2025 10:35:32 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 145CD3D836A2;
	Wed, 17 Dec 2025 10:35:31 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [PATCH v2 0/1] add support of cockpit-machines
Date: Wed, 17 Dec 2025 16:35:20 +0100
Message-Id: <20251217153521.51439-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 15:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9491

Hello community,

Since version 242 of Cockpit package, plugin `cockpit-machines` has been =
moved
to a dedicated repository. This cockpit plugin is used to manage in web U=
I
virtual machines. There is currently no support of the new cockpit-machin=
es
package in any Yocto meta and the following patch bring it.
This recipe is suggested to be added in the meta-virtualization in
order to fulfill the needed dependencies on `virt-manager` and
`libvirt-dbus` recipes. As the cockpit recipe is available in the meta-we=
bserver
layer, cockpit-machines recipe depends on it.

V2:
* Add a comment in layer.conf regarding meta-webserver dependency
* Add a comment in cockpit-machines_346.bb about musl compatibility
* Edit commit message to give explanations about how to test the recipe o=
n
target

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Paul Le Guen de Kerneizon (1):
  cockpit-machines: add recipe

 conf/layer.conf                               |  4 ++-
 .../cockpit-machines/cockpit-machines_346.bb  | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb

--
2.34.1

