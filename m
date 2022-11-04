Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166DDC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 07:23:29 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web08.8499.1667546607435514941
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 00:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id D46211B92F;
	Fri,  4 Nov 2022 08:23:24 +0100 (CET)
Received: from [192.168.178.122] ([79.219.228.191]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oqr2y-075Q9Y0; Fri, 4 Nov 2022 08:23:24 +0100
Date: Fri, 04 Nov 2022 08:23:19 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <V6BTKR.V7B3NTHJZAU82@t-online.de>
In-Reply-To: 
	<CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com>
References: <20221030161333.12430-1-f_l_k@t-online.de>
	<20221030161333.12430-2-f_l_k@t-online.de>
	<CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
	<6GGOKR.9UDK9PG7M6LM3@t-online.de>
	<1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
	<CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-hKa/eV19fV0fPml/AzAL"
X-TOI-EXPURGATEID: 150726::1667546604-EE7EE7E2-4AC60B27/0/0 CLEAN NORMAL
X-TOI-MSGID: b1d172c1-4832-42c3-b824-73a213bbbdeb
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Nov 2022 07:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7676

--=-hKa/eV19fV0fPml/AzAL
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield 
<bruce.ashfield@gmail.com>:
> but libvirt still has other TMPDIR QA warnings that still haven't 
> been fixed, so I don't consider this an absolute blocker. I'll have a 
> look and try to fix it.

Thanks for the help!

Markus


--=-hKa/eV19fV0fPml/AzAL
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;:<br><blockquote type="cite"><div class="gmail_default" style="font-size:small">but libvirt still has other TMPDIR QA warnings that still haven't been fixed, so I don't consider this an absolute blocker. I'll have a look and try to fix it.</div><div class="gmail_default" style="font-size:small"></div></blockquote><div><br></div><div>Thanks for the help!</div><div><br></div><div>Markus</div></div>
--=-hKa/eV19fV0fPml/AzAL--


