Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.8295.1605622440577884685
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 06:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=C1Cs7Fe0;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0BF2C38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=407; q=dns/txt; s=axis-central1;
  t=1605622439; x=1637158439;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=8+FYcceR6PFxZpRnl/mjhUV45kCgcCh6KUyGs+qEtSY=;
  b=C1Cs7Fe04sJACRoysLUVJmwRc3VGwNUsbys3W4dSck+HUEvmArgPJyVo
   TLXNf72akLL6P1bvpusxAfCMVTnpSxq+vVevnZ5tDTSX7gPQHblvDtxAv
   xl04Tx4n1XgFNlRWYO14wZaV9jT2FlObtIXuNy20dnu2Cq0iEP/9pPhMr
   1UhNfIFkvi4sj1KHaCGM7YR89dWgbOg6cN4otzXEPuOnPdYFNQjWjYyAn
   ivZDDPg3ARDxAk1vWU0SL6Uf8wh3K0Up1KECgz9pHchC982jqNpOhGfnd
   kR4kAlM4jwbulbmf4sKG0A7tyskfqofVcS/GbKpfjiMtoXIUBf/nswZ6V
   w==;
IronPort-SDR: 2bleDEOysVgjCQ27Ir99GjShZy7u0SEqQQ6DX5Oh4LdFSLk9SaQn82TpbrHpJ9aZZJqzAgYu8u
 mRb2gCe/jRZxTEQPbdhOwo1B/FOOC65rZdZq+g3JsitD0CiubEdSsiulpc0KENSavlVtt/ZsUz
 1i2y87UYANPRQqlPm20g08mziQ4xVN7p8llJ2ptItVADer4+RJsUmEUuxIdaj/6UK3N3g5TVgV
 Zk1yFeNsSt/rDkC5hU9UTjLOkLOf3tZuhCYaVY+UdqNGshlWM9cQns9bZjSbkfeSzDjKofClDB
 sYE=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="14599594"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: "meta-virtualization@yoctoproject.org"
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
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <2a18b921-a876-5880-2f7a-43b1600695c8@axis.com>
Date: Tue, 17 Nov 2020 15:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <DBBPR08MB4725692B5248F6A8064C6CEC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-11-12 08:04, Lance Yang wrote:
> 
> I started k3s server without agent and confirmed the node is ready. Then 
> I copied the node_token and then ran k3s agent with that token and 
> specified the server url.

Did you do this on the same device?
I always run the k3s master on one device and the k3s agents on other 
machines (and thought that was how it is supposed to work).

BR,

/Joakim

