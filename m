Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0C8C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 18:17:53 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.467.1693246671586774850
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 11:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id CF71E8451;
	Mon, 28 Aug 2023 20:17:48 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.230.67]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qago7-08Ln5k0; Mon, 28 Aug 2023 20:17:47 +0200
Date: Mon, 28 Aug 2023 19:46:58 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to
 fuse3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, meta-virtualization
	<meta-virtualization@lists.yoctoproject.org>
Message-Id: <A2440S.ZJJYBEG8TE2P3@t-online.de>
In-Reply-To: <CADkTA4MpeKhmt=p2cfYu8GorSgQ-k5+ezVje41DfO5FV2Tf1Cg@mail.gmail.com>
References: <20230824081002.6730-1-f_l_k@t-online.de>
	<ZOtP7s2ivBE4sp+A@gmail.com> <V7Y20S.DEMNSEGCSDXK3@t-online.de>
	<CADkTA4MpeKhmt=p2cfYu8GorSgQ-k5+ezVje41DfO5FV2Tf1Cg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/MKZEBHj48Cxetu7U4qf"
X-TOI-EXPURGATEID: 150726::1693246667-417F82B7-2E5429AC/0/0 CLEAN NORMAL
X-TOI-MSGID: d8d354f0-1985-4dd3-87d6-19ba593e57f7
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 18:17:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8249

--=-/MKZEBHj48Cxetu7U4qf
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Aug 28 2023 at 07:17:21 AM -03:00:00, Bruce Ashfield 
<bruce.ashfield@gmail.com> wrote:
> Did I miss a patch ? If so, feel free to point it out and I'll queue 
> a build test!

I didn't want to rush. I have sent 2 patches and the second was to fix 
build for introspection/vala for libvirt-glib. I sent it again and also 
pushed it here on github.

<https://github.com/MarkusVolk/meta-virtualization/commit/ce5f953c09fadba1f6e0014106adb4b23beef747>


--=-/MKZEBHj48Cxetu7U4qf
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Aug 28 2023 at 07:17:21 AM -03:00:00, Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; wrote:<br><blockquote type="cite"><div dir="auto">Did I miss a patch ? If so, feel free to point it out and I'll queue a build test!</div><div dir="auto"></div></blockquote><div><br></div><div>I didn't want to rush. I have sent 2 patches and the second was to fix build for introspection/vala for libvirt-glib. I sent it again and also pushed it here on github.</div><div><br></div><div><a href="https://github.com/MarkusVolk/meta-virtualization/commit/ce5f953c09fadba1f6e0014106adb4b23beef747">https://github.com/MarkusVolk/meta-virtualization/commit/ce5f953c09fadba1f6e0014106adb4b23beef747</a></div></div>
--=-/MKZEBHj48Cxetu7U4qf--


