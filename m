Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4155.1605188599414866059
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 05:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@axis.com header.s=axis-central1 header.b=VhrFZG3X;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BC9E838C08A4
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=226; q=dns/txt; s=axis-central1;
  t=1605188600; x=1636724600;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NZ4CVKxkal3UQkAIj2xnISJ1aHQFHP8vZ/IYBwbDHJU=;
  b=VhrFZG3XJ9WEvuhzv5nXfPS4emgvd+gKfpHZ0Hxlx1A2EORlBHOL0MTE
   gLmu9ZlkXz2na0rkqlln5q3NZZMz6F16OyCAyPWMSPi4O9qw+aL/PMIUq
   eqN2UzKQRiJaHeS2IArd+VgUyZyPd74upLD45coT5WP+sESY1kY79LxEH
   YFr2cfRdb6cnKVbLvry3lEG3F1uFX7oX1cxG6hYHmEqu5sOvHp/EQWFMO
   +FYQYNEHXPu8/ndmPhZsSmh45pVb4wJuSZjHWpmjRcsF/RC1kWZ+pf3/W
   Oyu9/cQjZdZBz9yb506071sjfHVLfol8zPwIoF6+k+moNsPShyFoqTNJ3
   Q==;
IronPort-SDR: E6BzkHV9H9SAJQdre4VHUkjftpqqKW/f06tCwjEgXKL3ITezOUjxarwKlJrLXWia9qN/LXiB1U
 2394u8e9Z15FR4RiMwl0+e4pi+O3Z8nEro2vLGHpY3XFs5lFDpuTryJTLINYynOzMOQKgTflis
 C+FGVbn5pTZ3wrwuutaYNc1NvuD5fxUHi4A62rKhJVbpDPXZ6MjZdaiRA6FPbkijz+RrRVBNfz
 qaAtjpkuz+0HvLnxSPeHA5MADOexdeUpMdwjERKH+YStjRyWGU2Mx2JA0JpY2O9W7w96QDoLD3
 y7U=
X-IronPort-AV: E=Sophos;i="5.77,472,1596492000"; 
   d="scan'208";a="14468765"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
 <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <fc77738c-810e-6e67-7710-573a4610faec@axis.com>
Date: Thu, 12 Nov 2020 14:43:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-11-12 08:30, Lance Yang wrote:
>=20
> Problem 1: conflicting requests
>  =C2=A0 - nothing provides kernel-module-ip-set needed by ipset-6.38-r0

Do you have

CONFIG_IP_SET=3Dm

in your kernel config?

BR,

/Joakim
