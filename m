Return-Path: <festevam@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B81C47089
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:23:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.21860.1670433802848519284
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 09:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=tjCE09ZU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A759480EAF;
	Wed,  7 Dec 2022 18:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670433800;
	bh=JXliN/Ew4I5wLxUwfdio+aovtqFveFzoORB6nOE30Ws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tjCE09ZULqf6zkfIXQW0ce5yHyn2jkmeldiNZL+Ct+gf8o9CekFPpLtrDCuLoRr+5
	 spFMKbSsvFPVBd/6Mb0UFR3hjZFIpQkFsZcy5OSok95RhP2XhbUHmZbZJ7ke68h2JZ
	 2phAK2LIwlKfDjVxJ1Pww7AoYjGSV2NTaI+t7xXg13qQRVVktuuU0eefyauQNlfcM+
	 Ga3zxoPmWLq2lwrdN9AOSLiUsclznBIWkp5mZ3INmVXqDJMU5QWLYndgG+rCrVQ5Iz
	 u9SXmt3zpNui5t1wr66kO9AF9BzvU/5qw9UnNO6OrDyjgq+m4agP4rn8LZ8LzpCna1
	 CFsu+JwHfYy2A==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Dec 2022 14:23:20 -0300
From: Fabio Estevam <festevam@denx.de>
To: nathan.fisher@gd-ms.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] kvmtool patch error
In-Reply-To: <10752.1670433336167964170@lists.yoctoproject.org>
References: <CADkTA4MN2zsffiyVtYx_DLDutMW-cHon3LbKASbOdCs22wwauQ@mail.gmail.com>
 <10752.1670433336167964170@lists.yoctoproject.org>
Message-ID: <3404780a8bc392338e7e5b8e3c719145@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 17:23:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7742

Hi Nathan,

On 07/12/2022 14:15, Nathan.Fisher@gd-ms.com via lists.yoctoproject.org 
wrote:
> I just tried a build using the master-next branch and I got the same
> error

I am on kirstone using aarch64 and kvmtool built without errors for me.


