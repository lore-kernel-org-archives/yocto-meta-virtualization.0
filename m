Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809C8C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 15:03:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.9892.1643987036874250690
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 07:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Jlc0GeDi;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643987037;
  x=1675523037;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XisNqL1HS5713GvCKcS9rsLZ2sXKpks39VyOitV3VQM=;
  b=Jlc0GeDiwJxHwRzLBjJcdyPxC7ZvolSlKS4C9Qime+fOt9epSTEvlaqa
   pHc0LJsZH6r1LTpFvxlT7sR7DUNp2KkNQoiuk8HoHL45ic1uL6b8ZL/nQ
   F1t/KvG4Js6nh1RBblcMUzbRYcb0LRnPiQ1jUs0sRyOfIQguCmCQm/iKZ
   aDXKZoSmk0TuXj0G2ZbeIKWdwEBHOyGdWLPGc6+uXgbqfLBhMFyiLTmWY
   Te+msUWSq2qsoKWXi43ZKihJ4QLVQjDRrNVIckMecnodmYCrOY6QKmvzO
   XoDEHWVOeMxvYD7s7vLm1UzccONuVR3mSDCYSf0AmN16Muv2x+4iu4mcl
   A==;
Message-ID: <7a9d1bd3-730c-e84e-1f49-0860ea34eb95@axis.com>
Date: Fri, 4 Feb 2022 16:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-virtualization] Docker and GPLv3
Content-Language: en-US
To: <meta-virtualization@lists.yoctoproject.org>
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
 <CAEhQi8mJcecVMa0xozbsP1DcxV1LwkN25x6GdEgApKMQvW9WNA@mail.gmail.com>
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: 
 <CAEhQi8mJcecVMa0xozbsP1DcxV1LwkN25x6GdEgApKMQvW9WNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail05w.axis.com (10.20.40.11) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 15:03:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7047

On 2022-02-04 15:30, Mans Zigher wrote:
 >
> with our current understanding our customer cannot comply with GPLv3
> so we have to avoid it at all cost.

I think this is a situation where

https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/

might come in handy, together with something like

PREFERRED_VERSION_bash ?= "3.2.%"

in the local.conf (or similar suitable configuration place).

BR,

/Joakim


