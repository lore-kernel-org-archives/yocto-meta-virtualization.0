Return-Path: <festevam@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16461C4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 20:46:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.28264.1670445989754179916
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 12:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=EaH5+t3v;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9034E82A0A;
	Wed,  7 Dec 2022 21:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670445987;
	bh=1oc3JvjENA59pTLzVd//qSgRMV19z1ho3umP9OzXMcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EaH5+t3vypdZHn6c8uvr/f+sUvCEmK/JqV7zLAkHVUfyhUo+yIF+QLUQcVpK0RA5f
	 6fwLiEhsV/y3QDFsKfy/TLAtASeHjbAn7i95u1LqEMeF5M8pZqHZ99aMyRj9BwKrab
	 KipVgnI8SzFL1Re+Y+xco+Iuf/s8zCPEFkDBX54THaovBq6LRjEzkdzLyJHIBG5kWM
	 6B5XUAytukpWEzudxtIX1BKH4RNeuOZ2uX3Pf7o5Q10m7HPuR9lAk1KAiwEvVtocdp
	 xY1xKyJjikyMLuM6q8Mw3nhIXfpj2Y9QIdgVK56a8VAAFXEAV0Uy5Koh9JUS05qeEu
	 7+D0KzL62tlbw==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Dec 2022 17:46:27 -0300
From: Fabio Estevam <festevam@denx.de>
To: nathan.fisher@gd-ms.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] kvmtool patch error
In-Reply-To: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
References: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <04b6fa7fd4c9db2a52e819c502fcee8a@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 20:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7747

On 07/12/2022 13:46, Nathan.Fisher@gd-ms.com via lists.yoctoproject.org 
wrote:

> ERROR: kvmtool-5.10.0+gitAUTOINC+336751fb10-r0 do_patch: Applying
> patch 'external-crosscompiler.patch' on target directory '[path to
> work
> directory]/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/git'

This looks like an old version of kvmtool.

In kirsktone and master you should see:

kvmtool-5.10.0+gitAUTOINC+faae833a74-r0

And then the patch will apply cleanly.

Regards,

Fabio Estevam

