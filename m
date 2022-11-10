Return-Path: <ml@calgera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520B3C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 19:25:40 +0000 (UTC)
Received: from t4v1.calgera.eu (t4v1.calgera.eu [80.208.226.141])
 by mx.groups.io with SMTP id smtpd.web11.126.1668108338687930599
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 11:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@calgera.com header.s=mail header.b=mlgx0vgO;
 spf=pass (domain: calgera.com, ip: 80.208.226.141, mailfrom: ml@calgera.com)
Message-ID: <5ea5178b-7229-72cf-9fa8-d7fccc83ee51@calgera.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1668108336; bh=xqtpj53SaLE1pPf+AFVBO1apZezVFW3+BPEsmf9s45A=;
	h=Date:To:From:Subject:From;
	b=mlgx0vgOJAMMPwpKFn+AD7xpYl5tzl/H5BkktYUDMjckqiqE07B/PQPIRmNfCzp82
	 S8IKz/ycEqMulIle6RZ0MFEBCJvhoSR8/FW1w0rlwWAtdOGPKONEVyCbG5kbVNXRPO
	 axUW5e9C3VJsHuqoDnue5+g0PG7k4OjjbEIjzXLgUig63uC+pnF+X90TWNKxeJyiJ/
	 GA/U2vF3jWn/prhxu3PplvEausjBMsbi7P8IyKfuXXXn3MJRV/QB2NinaKcWXrNFy5
	 5GkGUvDKLDpcvZnHUqVoNNZDXskhNYJHxBwl7F3aQRukIV51pS1NtpXg0u9J6RwqwX
	 SZEEvD2OYJxLQ==
Date: Thu, 10 Nov 2022 19:25:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
From: Renato Caldas <ml@calgera.com>
Subject: packagegroups and unnecessary builds/fetches
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Nov 2022 19:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7680

Hello,

I'm adding "packagegroup-k8s-host" to my image, and noticed the "k3s" 
package also being built.

Investigating further, it seems that by bundling kubernetes and k3s in 
the same .bb file causes both packages to be built. The same probably 
applies to the "packagegroups" in packagegroup-container.bb, all get built.

In both cases, the norm I guess is for people to just want one of the 
alternatives (kubernetes vs k3s; lxc vs podman vs docker).

Would it make sense to split the packagegroups into individual recipes? 
I'd be happy to submit a patch.

Cheers,
   Renato

