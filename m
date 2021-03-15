Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.6334.1615801620692288177
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OEEMEMyY;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4A75F38C0850
	for <meta-virtualization@yoctoproject.org>; Mon, 15 Mar 2021 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615801619;
  x=1647337619;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fJDQB7se93HinZPKZtHijWfZUDakBXSFZb7X6Po0hSk=;
  b=OEEMEMyYd2lZv2WIOvkuD8vB8HMFu5q6IBKl3vIaQXqcyIRh9uwRIJes
   6Xr1/i1SKdyBYtMJf2PKRRwLZsfYXK/laNPLizIr0ocFjVpWH5FkJ0KV+
   t788MwF044aHl/sOtMZatGRYqQjACoEkhkOkZv5B4pehYkHRdRZunVlpk
   MfLDwk2u9T2CxOo8rAfru+gdNNKKTjx0NzJ4f6qav/FcxboPnKw+SyBGN
   HrcemfpKt4lqbfrcXN7dg486UsmnH9cxxb6UCQ8FtBL+VSOltpHMJvOoE
   2V2cwRUszscWj4wCpty3wuMSGLOYylGmbQGSQaznMjSxk0vWKKlEcWxLw
   g==;
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <164627F27D18DB55.10479@lists.yoctoproject.org>
 <CADkTA4MKnhDuf85C3X=CxqrMkCKy1ka3fWxVNfSN9U=m2cJWaw@mail.gmail.com>
 <DBBPR08MB4725AF4604F11A7DF0A83E0491E80@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4PgwD1OwPa4kjAGHANjHYG7fbgmZAvGSw6nEt1x1Mvh3Q@mail.gmail.com>
 <DBBPR08MB4725692B5248F6A8064C6CEC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <2a18b921-a876-5880-2f7a-43b1600695c8@axis.com>
 <CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <97612504-29ef-9181-8e0c-01d8ef4f80e8@axis.com>
Date: Mon, 15 Mar 2021 10:46:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-03-13 20:30, Bruce Ashfield wrote:
> 
> FYI: after literally 5 months of on and off (most off) debugging and
> integration, I have finally gotten to the bottom of this, and now can
> bring up my all in one node out of the box!
> 
> I can now pull k3s into lots of little bits and am confident that I
> can support it, given my recent findings and debug.

This is fantastic news, Bruce!

> I'm cleaning up changes, and will push a fully updated k3s to
> meta-virt master in the coming week.

This officially makes you the king.

BR,

/Joakim
