Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA00C4167B
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 08:47:00 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.70570.1669970816023234688
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 00:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=SWxz/dI7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669970816;
  x=1701506816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uLwwJDg8Xap+rgpOweK8itjRma7uAyfjkiQSJU9WEq0=;
  b=SWxz/dI7RBQx3O3gxEFlsuNkrwD6wxKYTm7OfpPqIV4QGdGWphDH/rgU
   pgUCpnnqnvgO+b7386SgSsUGw1aCQ3MY26U00qo3rn5dqPCjnN+RPlMS3
   lnApYg8uLVRy3fTsrHbT5SFe5cS/nq+4k7sqZIj0yQn6FVb0Nxh4c6gBu
   FxhPOkGPu7EUOcSZCkK2eQSCVpydcC5iLFmw5BcAFczpTKyBXUDKAv4kH
   qfSGVtE1mlvsrNtKAdgQjLAL/8aIO+dy4fM6rgNHyEZuiq98ph6h7NhzM
   ftQV52YYkYjXcv7J++9wP4MHn9RInJyzyXe0DpAV8OAatwWMHwrG3/zpf
   Q==;
Message-ID: <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com>
Date: Fri, 2 Dec 2022 09:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org>
 <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail07w.axis.com (10.20.40.13) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 08:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7729

On 2022-12-01 16:08, Bruce Ashfield wrote:
> 
> I did have some luck, and I pushed a proposed fix to master-next.
> 
> Have a look, and see if it fixes the build for you.

Thanks a lot; I tried it out immediately.
It will, however, give me the same gitsm error:

ERROR: upx-3.96+AUTOINC+8d1a98e03b-r0 do_fetch: Fetcher failure: 
Submodule refers to the parent repository. This will cause deadlock 
situation in current version of Bitbake.Consider using git fetcher instead.

BR,

/Joakim


