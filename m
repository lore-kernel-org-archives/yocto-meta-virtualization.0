Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FBEC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 05:37:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.68179.1669959439299719411
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 21:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 28F2A28EE6;
	Fri,  2 Dec 2022 06:37:17 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.35]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0yja-3xP35s0; Fri, 2 Dec 2022 06:37:14 +0100
Date: Fri, 02 Dec 2022 06:37:08 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <WX09MR.F1VONI27IQ1O1@t-online.de>
In-Reply-To: 
	<CADkTA4OLtXws3p3HDcpMgkgT2q7Ar558mJQ+7u7r-STdebbRcQ@mail.gmail.com>
References: <20221030161333.12430-1-f_l_k@t-online.de>
	<20221030161333.12430-2-f_l_k@t-online.de>
	<CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
	<6GGOKR.9UDK9PG7M6LM3@t-online.de>
	<1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
	<CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com>
	<V6BTKR.V7B3NTHJZAU82@t-online.de>
	<CADkTA4OLtXws3p3HDcpMgkgT2q7Ar558mJQ+7u7r-STdebbRcQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7VF35gLBMiz6Vnp78do0"
X-TOI-EXPURGATEID: 150726::1669959435-E10B4E65-B97704A6/0/0 CLEAN NORMAL
X-TOI-MSGID: fd469c8b-b639-4383-ab93-512082424604
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 05:37:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7728

--=-7VF35gLBMiz6Vnp78do0
Content-Type: text/plain; charset=us-ascii; format=flowed

Great, thanks

Am Do, 1. Dez 2022 um 23:39:31 -0500 schrieb Bruce Ashfield 
<bruce.ashfield@gmail.com>:
> I finally managed to get enough time to look into this more, and I've
> pushed my fix to master-next.
> 
> Everything should now build without QA errors, and I expect to have it
> merged over the weekend.
> 
> Bruce
> 
> On Fri, Nov 4, 2022 at 3:23 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield 
>> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>:
>> 
>>  but libvirt still has other TMPDIR QA warnings that still haven't 
>> been fixed, so I don't consider this an absolute blocker. I'll have 
>> a look and try to fix it.
>> 
>> 
>>  Thanks for the help!
>> 
>>  Markus
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


--=-7VF35gLBMiz6Vnp78do0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Great, thanks</div></div><div id="geary-quote" dir="auto"><br>Am Do, 1. Dez 2022 um 23:39:31 -0500 schrieb Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I finally managed to get enough time to look into this more, and I've
pushed my fix to master-next.

Everything should now build without QA errors, and I expect to have it
merged over the weekend.

Bruce

On Fri, Nov 4, 2022 at 3:23 AM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield &lt;<a href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;:

 but libvirt still has other TMPDIR QA warnings that still haven't been fixed, so I don't consider this an absolute blocker. I'll have a look and try to fix it.


 Thanks for the help!

 Markus
</blockquote>


<div>-- 
</div>- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
</div></blockquote></div>
--=-7VF35gLBMiz6Vnp78do0--


