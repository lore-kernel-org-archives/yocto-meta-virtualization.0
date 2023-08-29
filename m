Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60534C6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 06:19:08 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.11593.1693289943237934729
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 23:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 1083F1D910;
	Tue, 29 Aug 2023 08:18:40 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.173.90]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qas3h-2ROFP60; Tue, 29 Aug 2023 08:18:37 +0200
Date: Tue, 29 Aug 2023 08:18:32 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to
 fuse3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, meta-virtualization
	<meta-virtualization@lists.yoctoproject.org>
Message-Id: <WU250S.JI46GDFJA4CO@t-online.de>
In-Reply-To: <CADkTA4P6AKA+OWWrxs6XxpoQDojC2jqFxcQD0hMqshikywqhfg@mail.gmail.com>
References: <20230824081002.6730-1-f_l_k@t-online.de>
	<ZOtP7s2ivBE4sp+A@gmail.com> <V7Y20S.DEMNSEGCSDXK3@t-online.de>
	<CADkTA4MpeKhmt=p2cfYu8GorSgQ-k5+ezVje41DfO5FV2Tf1Cg@mail.gmail.com>
	<A2440S.ZJJYBEG8TE2P3@t-online.de>
	<CADkTA4P6AKA+OWWrxs6XxpoQDojC2jqFxcQD0hMqshikywqhfg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-DF1wytIseyKKPklpuXgB"
X-TOI-EXPURGATEID: 150726::1693289917-FD4002E6-88F21463/0/0 CLEAN NORMAL
X-TOI-MSGID: 907faf3a-b32a-45b6-9680-aa7345d961c5
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 06:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8260

--=-DF1wytIseyKKPklpuXgB
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Aug 28 2023 at 09:49:36 PM -04:00:00, Bruce Ashfield 
<bruce.ashfield@gmail.com> wrote:
> Right. This is the patch that I was asking about how the documentation
> was going to be used and packaged.
> 
> I didn't see a reply, did I miss that ?

This was then a misunderstanding. I thought the libfuse patch was meant 
and had updated and replied to that

I've sent a v2 with an updated commit message


--=-DF1wytIseyKKPklpuXgB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Aug 28 2023 at 09:49:36 PM -04:00:00, Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Right. This is the patch that I was asking about how the documentation
was going to be used and packaged.

I didn't see a reply, did I miss that ?</div></blockquote><div><br></div><div>This was then a misunderstanding. I thought the libfuse patch was meant and had updated and replied to that</div><div><br></div><div>I've sent a v2 with an updated commit message</div></div>
--=-DF1wytIseyKKPklpuXgB--


