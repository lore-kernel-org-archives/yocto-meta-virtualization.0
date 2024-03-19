Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86376CD11BF
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:12:20 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.18215.1710861132419136028
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=VkauCS1p;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 35B2A9C5450
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 11:12:11 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id EMIyAOiT_I-B; Tue, 19 Mar 2024 11:12:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C78229C536A;
	Tue, 19 Mar 2024 11:12:10 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C78229C536A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1710861130; bh=onlPxRHBRdUXdbNICwm/D0V387iQA2BN+8c6mk4pisc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=VkauCS1piQ4Ik2JbcFDNv6siDdedgVTzYjI5+r7SqtMGeXBG1rQDWQf91M76g/Uqp
	 VJIlPXhIMdMPaLVMj1+DpKJ8NScz1rKVlu3Z/NSy2LeETojbDVmOE4wUy5RYq5ZXrd
	 +N60z/dY3HY1oQthH4hvfLHIcspaX2DYBg6yoPeWUffaLMnmPPLFb7oK3qum1f2YOE
	 FjlHzdqNQCEkPZYO9CiUwcX9k8ac/MZmFOKiEzu+NWMs31WG+YNwsWgwk3Ym/x8VV2
	 mmNcM1f3pIXJ7AQWvqpOX+VToW2uS2NH+6qg9u2pBHKKRqcPjBCEyqBONdJqmgUTzc
	 a9IBIWefNzg+w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JuDjkcpAnkc9; Tue, 19 Mar 2024 11:12:10 -0400 (EDT)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 519F99C4661;
	Tue, 19 Mar 2024 11:12:10 -0400 (EDT)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 0/1] add support of libvirt-dbus
Date: Tue, 19 Mar 2024 16:12:00 +0100
Message-Id: <20240319151201.27522-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8644

Hello community,
This patch adds the support of the libvirt dbus plugin. As the recipe has=
 a
direct dependency with `libvirt-glib`, this should be tested on target ve=
rsion
of Yocto Nanbield.

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Mathieu Dupr=C3=A9 (1):
  libvirt: add libvirt-dbus

 .../libvirt/libvirt-dbus_1.4.1.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt-dbus_1.4.1.bb

--
2.34.1

