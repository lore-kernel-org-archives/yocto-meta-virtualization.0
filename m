Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329C5D6409F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:21:55 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10413.1765963313486813915
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 01:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=qwAKWcoV;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 540523D85179
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 04:21:52 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oot8R7AylEOK; Wed, 17 Dec 2025 04:21:51 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 995083D85177;
	Wed, 17 Dec 2025 04:21:51 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 995083D85177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1765963311; bh=m6aL0/huJZ7MnFVWU6PPwnkPOwAQaAdbtQPmxJV92DE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=qwAKWcoVwFBLFGgeRiPlz0upqfZIdLGvMSIm2O1uw/VJ2zE4YoVYS2+wuneedC4/j
	 gNhvDdGaXswlmxnJZ8FARFqKDXROokzW8I5ISfPr8zw9VvgtqjTkm2lIOsHnpsGf2H
	 TEbUBxIQ0wHtVWF1mE6W/QNcjX8nVXQkwhMy71k2FtgYRtrDZGv7uZfLOc5qjA9jW4
	 ROL/IJs9KU1UebFblsPPxp2lcIbxzwXw/6KUxst2dKgUO0blcPzU95T3saxU0/luAy
	 odUUxNiRfJZp3IjBAWkJWhPT7NaDT26xThbeGGfTiO/y65R9okImrmqD54z1s/I7AB
	 FLoxfZ90OljaQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id RnortdppR02h; Wed, 17 Dec 2025 04:21:51 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 0C0673D84F21;
	Wed, 17 Dec 2025 04:21:50 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 0/1] add support of cockpit-machines
Date: Wed, 17 Dec 2025 10:21:31 +0100
Message-Id: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 09:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9488

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
`libvirt-dbus` recipes.

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Paul Le Guen de Kerneizon (1):
  cockpit-machines: add recipe

 .../cockpit-machines/cockpit-machines_346.bb  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb

--
2.34.1

