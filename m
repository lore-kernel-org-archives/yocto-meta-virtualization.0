Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1C0C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 13:07:24 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.22126.1709298437589517153
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Mar 2024 05:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=uUnRPqMN;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E3D179C5315
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  1 Mar 2024 08:07:16 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id GUpRZa-9UcQb; Fri,  1 Mar 2024 08:07:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5621D9C52B1;
	Fri,  1 Mar 2024 08:07:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5621D9C52B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1709298436; bh=Q17Zc4I2BAxmpWCWyAwuURr9B9J/GtXh0J3k+/Wd2qY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uUnRPqMNXQdxLeq3KgK1ZLjlbV2vLuv13ewM+76YjDT28DIwP2ST9O3Al8SAbzSbu
	 aL6bNr7fB62Xt6oEKiG5vYYCkndMbF2zuiVPWnMTgDDqjWc86cLHTQnmkAQR5X1Jiu
	 QtX7vG5c+LJi6MVmXJLgyeWhqQKdmMB6XuTX5HuuCNCfBP2ScMyRwFiwAtP2VRjZF9
	 GIzaGR1VVlGlbtq2vDKXaMh+VbavvRzxlrMI3ZnupUk1Yd3Gl+vc4TxpIFm4NqjgjT
	 2WaMy4gEpkIn8RNtQEXOxV1o2rkarHWZm/ZtolyV5esqLwsMt8fOHL48gXPWlWywfe
	 qNhRFi0pWA9jg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id zO-WMFZRTwQo; Fri,  1 Mar 2024 08:07:16 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id AEFA09C43DE;
	Fri,  1 Mar 2024 08:07:15 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-virtualization][0/1] add support of virt-manager
Date: Fri,  1 Mar 2024 14:07:03 +0100
Message-Id: <20240301130704.28605-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Mar 2024 13:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8600

Hello community,
This patch adds the support of virt-manager. The recipe has direct depend=
ency on
some packages available currently on Yocto Nanbield which are `usbids` an=
d
`libosinfo` from meta-openembedded.
virt-manager patch is currently under review on virt-manager repository. =
See the
PR at: https://github.com/virt-manager/virt-manager/pull/631

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Paul Le Guen de Kerneizon (1):
  virt-manager: add package

 ....py-move-global-args-to-install-args.patch | 76 +++++++++++++++++++
 .../virt-manager/virt-manager_4.1.0.bb        | 54 +++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 recipes-extended/virt-manager/virt-manager/0001-setup=
.py-move-global-args-to-install-args.patch
 create mode 100644 recipes-extended/virt-manager/virt-manager_4.1.0.bb

--
2.34.1

