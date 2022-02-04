Return-Path: <yocto@optimcloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80513C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:19:30 +0000 (UTC)
Received: from mail.optimvoice.io (mail.optimvoice.io [46.23.82.140])
 by mx.groups.io with SMTP id smtpd.web12.9652.1643984367930755114
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no public key found in DNS TXT" header.i=@optimcloud.com
 header.s=dkim header.b=nbr5p4R3;
 spf=pass (domain: optimcloud.com, ip: 46.23.82.140,
 mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (mail.optimvoice.io [46.23.82.140])
	by mail.optimvoice.io (Postfix) with ESMTPA id A709D64002D;
	Fri,  4 Feb 2022 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optimcloud.com;
	s=dkim; t=1643984364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krlT3BJQzEMEyRO2HKXoUgBpfzCVNDziVTexr2o3gB8=;
	b=nbr5p4R3PdMDuPhDeDj25yIzWOGclZC9x+O3uaXzOpeMsetTGhfZMKRiVQl908zxehvcG7
	24tEP+QaqFa93c4bHppnE6VEqCrilCPklGNaO5VgM90B720zjLkP9ZbR7pku4nQ/H6DONb
	DdlVJq6tbiS8LKWmZo2z1S2eDzsFjun9fnO960rqvB3BIXTEl8mvt8uHiG8fW1Ut4+hLQv
	ogA+AZdZHLQEawb/vbqK+UelISkS0fNXMjqQrNJRxstd0jidHZir0mJyq00R/CqCbCeYhL
	kKy2e2sN6lITj4+TrUR3u7adruw7650Q50HkmxpJORZYH00WNa7r5sw9XoY3nA==
Content-Type: text/plain; charset=utf-8
Message-Id: <1643984300490.3283050020.1432816834@optimcloud.com>
From: Embedded Devel <yocto@optimcloud.com>
To: Mans Zigher <mans.zigher@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Docker and GPLv3
Date: Fri, 04 Feb 2022 14:19:18 +0000
In-Reply-To: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Authentication-Results: mail.optimvoice.io;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
X-Spamd-Bar: /
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:19:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7043



On Friday 04 February 2022 15:53:42 PM (+07:00), Mans Zigher wrote:

> Hi,
>
> A client of mine wants to have docker on it's product and they are
> having secure boot enabled which prevents us from having any GPLv3
> licensed code on the target. 
Okay, wait, why does enabling secure-boot prevent including GPLv3 packages??
Ive never heard this before.

