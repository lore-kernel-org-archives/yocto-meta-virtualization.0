Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B6FC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:29:11 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.8670.1667320142692808357
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 09:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id AA0C218B08;
	Tue,  1 Nov 2022 17:29:00 +0100 (CET)
Received: from [192.168.178.122] ([84.154.174.78]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opu8K-2dCFay0; Tue, 1 Nov 2022 17:29:00 +0100
Date: Tue, 01 Nov 2022 17:28:54 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <6GGOKR.9UDK9PG7M6LM3@t-online.de>
In-Reply-To: 
	<CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
References: <20221030161333.12430-1-f_l_k@t-online.de>
	<20221030161333.12430-2-f_l_k@t-online.de>
	<CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pGwd1nix4XuQObPeV57v"
X-TOI-EXPURGATEID: 150726::1667320140-F9C53742-ECFFDDD3/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e32009d-bb8b-4211-864b-2d691bfd76ae
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Nov 2022 16:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7670

--=-pGwd1nix4XuQObPeV57v
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfield 
<bruce.ashfield@gmail.com>:
> These dependencies are the biggest "issue" with the recipe. 
> meta-virtualization doesn't currently have a dependency on the layers 
> that provide those packages.

Hi Bruce,

thanks for the review. I tried to follow your suggestions, but since I 
didn't know of a suitable distro feature that would ensure meta-gnome 
is included, I cleaned up the dependencies and used a configuration 
that doesn't include it by default. This way, the recipe hopefully 
doesn't have to be skipped and can be built with only the layers that 
README says are needed. (Assuming that spice-gtk, which is currently 
being tested in meta-networking master-next, will be good to merge).


--=-pGwd1nix4XuQObPeV57v
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;:<br><blockquote type="cite">These dependencies are the biggest "issue" with the recipe. meta-virtualization doesn't currently have a dependency on the layers that provide those packages.&nbsp;</blockquote><div><br></div><div>Hi Bruce,</div><div><br></div><div>thanks for the review. I tried to follow your suggestions, but since I didn't know of a suitable distro feature that would ensure meta-gnome is included, I cleaned up the dependencies and used a configuration that doesn't include it by default. This way, the recipe hopefully doesn't have to be skipped and can be built with only the layers that README says are needed. (Assuming that spice-gtk, which is currently being tested in meta-networking master-next, will be good to merge).</div></div>
--=-pGwd1nix4XuQObPeV57v--


