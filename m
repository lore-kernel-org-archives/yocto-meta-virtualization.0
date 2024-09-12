Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219FEEEB56A
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 08:48:21 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.43635.1726130897859398999
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 01:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 83A222932A;
	Thu, 12 Sep 2024 10:48:15 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.34.202]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sofUt-0VP9JQ0; Thu, 12 Sep 2024 10:48:15 +0200
Date: Thu, 12 Sep 2024 10:49:58 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Message-Id: <A7ZOJS.J4CMW0BLYVKO2@t-online.de>
In-Reply-To: <CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
References: <20240912083239.237361-1-f_l_k@t-online.de>
	<CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zaUHhB/OyGvTBI9LVHOL"
X-TOI-EXPURGATEID: 150726::1726130895-3DFF947A-6ACCB9D8/0/0 CLEAN NORMAL
X-TOI-MSGID: e3fd147b-8346-4926-af85-6431323e34ee
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 08:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8888

--=-zaUHhB/OyGvTBI9LVHOL
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> Wasn't this fixed by
> <https://git.yoctoproject.org/meta-virtualization/commit/?id=c02af94731631b3432b8ddee2b89761ab32530ee>
> ?
I have meta-virtualization layer up to date, so it includes this 
commit, but was still hit by this problem.


--=-zaUHhB/OyGvTBI9LVHOL
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Wasn't this fixed by
<a href="https://git.yoctoproject.org/meta-virtualization/commit/?id=c02af94731631b3432b8ddee2b89761ab32530ee">https://git.yoctoproject.org/meta-virtualization/commit/?id=c02af94731631b3432b8ddee2b89761ab32530ee</a>
?</div></blockquote><div>I have meta-virtualization layer up to date, so it includes this commit, but was still hit by this problem.</div></div>
--=-zaUHhB/OyGvTBI9LVHOL--


