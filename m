Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB78C83F1F
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 02:43:26 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.5889.1693190597264745482
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 19:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout12.t-online.de (Postfix) with SMTP id 3D3846975;
	Mon, 28 Aug 2023 04:43:15 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.230.67]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qaSDh-2jJS2S0; Mon, 28 Aug 2023 04:43:13 +0200
Date: Mon, 28 Aug 2023 04:43:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to
 fuse3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <V7Y20S.DEMNSEGCSDXK3@t-online.de>
In-Reply-To: <ZOtP7s2ivBE4sp+A@gmail.com>
References: <20230824081002.6730-1-f_l_k@t-online.de>
	<ZOtP7s2ivBE4sp+A@gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-98EjP6QKRSHzT/LRPcNM"
X-TOI-EXPURGATEID: 150726::1693190593-BCFFAEAB-E1B7709F/0/0 CLEAN NORMAL
X-TOI-MSGID: 37c7c1c8-a380-4874-a5b2-2d8d053c029b
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 02:43:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8244

--=-98EjP6QKRSHzT/LRPcNM
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Aug 27 2023 at 01:30:22 PM +00:00:00, Bruce Ashfield 
<bruce.ashfield@gmail.com> wrote:
> It is worth re-testing master-next and 9.6.0 to see if
> everything still works as you expect.

Thanks, I will do the tests with the master-next branch.

One question about the other patch I sent. Do you have build issues 
with it or do you not want to support introspection at all?
I ask because the "gnome-boxes" recipe I recently sent to meta-gnome 
depends on vala bindings for libvirt-glib and cannot be built without 
the patch. For the latter case, it would be better to remove 
gnome-boxes from meta-gnome again.


--=-98EjP6QKRSHzT/LRPcNM
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Aug 27 2023 at 01:30:22 PM +00:00:00, Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It is worth re-testing master-next and 9.6.0 to see if
everything still works as you expect.</div></blockquote><div><br></div><div><div>Thanks, I will do the tests with the master-next branch.</div><div><br></div><div>One question about the other patch I sent. Do you have build issues with it or do you not want to support introspection at all?</div><div>I ask because the "gnome-boxes" recipe I recently sent to meta-gnome depends on vala bindings for libvirt-glib and cannot be built without the patch. For the latter case, it would be better to remove gnome-boxes from meta-gnome again.</div></div></div>
--=-98EjP6QKRSHzT/LRPcNM--


