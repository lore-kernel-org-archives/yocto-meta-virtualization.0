Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F482EEB597
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 11:42:52 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.45780.1726141369194644495
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 04:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 91111AFF5;
	Thu, 12 Sep 2024 13:42:46 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.34.202]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1soiDm-0dSF4y0; Thu, 12 Sep 2024 13:42:46 +0200
Date: Thu, 12 Sep 2024 13:44:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	meta-virtualization@lists.yoctoproject.org
Message-Id: <2A7PJS.5BXHYA4TD1ZH2@t-online.de>
In-Reply-To: <CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
References: <20240912083239.237361-1-f_l_k@t-online.de>
	<CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
	<A7ZOJS.J4CMW0BLYVKO2@t-online.de>
	<CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
	<SG4PJS.15GM9H9ULONU@t-online.de>
	<CA+chaQc_U+y+hVm7Rp5r7TKOAA5EwzntnC+frCvd-m+45W2VHw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-z/3sNecxugl3Lf+ZYr+z"
X-TOI-EXPURGATEID: 150726::1726141366-737FC446-5634B20F/0/0 CLEAN NORMAL
X-TOI-MSGID: 605f3fa5-71f1-453b-aaa3-ffbd5d252bae
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 11:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8892

--=-z/3sNecxugl3Lf+ZYr+z
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 12 2024 at 01:00:30 PM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> I see, the .inc file adds the +git suffix to LINUX_VERSION.

Correct. I'm not even sure what the desired goal in meta-intel would 
be. To have linux-yocto_virtualization.inc being processed or not, but 
I sent a patch to meta-intel, because I think LINUX_VERSION should be 
fixed in linux-intel_6.10 anyway.




--=-z/3sNecxugl3Lf+ZYr+z
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>On Thu, Sep 12 2024 at 01:00:30 PM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I see, the .inc file adds the +git suffix to LINUX_VERSION.</div></blockquote><span style="white-space-collapse: break-spaces;"><br></span></div><div><span style="white-space-collapse: break-spaces;">Correct.&nbsp;</span><span style="white-space-collapse: break-spaces;">I'm not even sure what the desired goal in meta-intel would be. To have linux-yocto_virtualization.inc being processed or not, but I sent a patch to meta-intel, because I think LINUX_VERSION should be fixed in linux-intel_6.10 anyway.</span></div><div><br></div><div><br></div></div>
--=-z/3sNecxugl3Lf+ZYr+z--


