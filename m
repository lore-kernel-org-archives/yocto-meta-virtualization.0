Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E46C4708C
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 12:02:24 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.13651.1670241741507954021
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Dec 2022 04:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WPSwNTWB;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670241742;
  x=1701777742;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=5jwQpQFjz/lUkA5ZKIJYG7lS1dSNguwsd6stFDoFCAI=;
  b=WPSwNTWBhWJihBevSWQKFWU+r9/ALxVEgORa5R3laorBtVkaYW05ctYs
   77yIwPN8UJIsUH96liO62i8XsiOaw/FtUmZb/gY7ElRKDQQ5E+3NWklq0
   qeUjntDYVawYUYFK/poV2TwScCPSgd1sfvhqDXuRCd408W23yqrtUncsy
   ae8hHzcaztWHipL8qDjbM1n/85VzogW0HFRtMkjaT94N55EsXoNuyRO6+
   d4l1lYjPlAIMYgB6JBh3ank1wJDupsIPRKylXFGAG0ZHdcRhv29F6krg2
   l30qViGqwNHfZdTX322dkdFSEVFgKBOoPRCBl7hrpTFsXZaACGLC9x1u8
   A==;
Message-ID: <dd323bc1-d1ac-ef32-7923-3b8f67fb19b5@axis.com>
Date: Mon, 5 Dec 2022 13:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
Content-Language: en-US
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org>
 <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com>
 <CADkTA4PB0ntC1xpOnEgHK7eFiuyDEvvx9MpM=y=T2dBDd6s7Sw@mail.gmail.com>
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <CADkTA4PB0ntC1xpOnEgHK7eFiuyDEvvx9MpM=y=T2dBDd6s7Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail08w.axis.com (10.20.40.14) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Dec 2022 12:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7737

On 2022-12-02 14:11, Bruce Ashfield wrote:
> 
> That being said, I've written multiple recipes like your follow up
> patch, and I do prefer the clarity of everything being directly in the
> SRC_URI.

Excellent!

On 2022-12-02 15:58, Bruce Ashfield wrote:
 >
 > I still can't reproduce the issue here, but everything still works
 > with your patch on top .. so I've added it to the queue on
 > master-next.

Do you think it could be allowed to reach the kirkstone branch too?

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com


