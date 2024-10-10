Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F183CF11D0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 11:58:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.41452.1728561530008349525
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 04:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O2TeQLQs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C05E240006;
	Thu, 10 Oct 2024 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728561528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1RTSFG9qmDRh4H87pSYrIAbZsp8uHhGTnAGWB23AEB0=;
	b=O2TeQLQsiJas8wABPYeMi7clwWNldtI38LCZOrxj5I+x6UbHM3Vw/sCEN7Rqw/y2alhg0N
	/28WDBeqoJ+cWkpQRp+DgipirWGNfEPU5xOltSy09VIXIicnxStQ18MnCYof0IEjnqutsR
	9dinWZy8EJ+cJqb9HMcQx6NRdk5/i740l8dcoGshfp3csWPfHuAVTT0+Ky1ON0VulEdq8S
	sOPCVHooumVNGZ+16gvFxAoj3VLdGw348RiR7fVk+L1hvK6v6CK9E6htqnNpxxLb3vkF5j
	kqat65LDk6Z52Elnn74TzpwPdwrp+Xs7yJGnB9e6X3xUZ4iFEBCww1Yr0NDujg==
Date: Thu, 10 Oct 2024 13:58:46 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: swat@lists.yoctoproject.org
Cc: meta-virtualization@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [swat] meta-virt fails check-layer-nightly
Message-ID: <ZwfBKi4w0sQxrh1N@bootlin-mathieu>
References: <17F8C1F31315C292.31778@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17F8C1F31315C292.31778@lists.yoctoproject.org>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 11:58:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8920

On Thu, Sep 26, 2024 at 11:41:42AM +0200, Mathieu Dubois-Briand via lists.yoctoproject.org wrote:
Hi Bruce,

> meta-virtualization fails the check-layer-nightly test on the scarthgap
> branch.
> 
> Fails are related to the python3-colorama copied recipe, as the licence
> was changed in the original recipe. I saw you made changes on the master
> branch to fix the same issue, could you fix the scarthgap branch as well
> ?

Sorry, same issue, once again, now on the kirstone branch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2314/steps/23/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/85/builds/14/steps/23/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/85/builds/12/steps/23/logs/stdio

Can you fix it ?

-- 
Mathieu Dubois-briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

