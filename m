Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7866.1605621017813986254
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=E0xgb4CM;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9E01B38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=363; q=dns/txt; s=axis-central1;
  t=1605621016; x=1637157016;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=2ZAoXeNoiJ0xufOtsPLvKnWtHdTjjs6tZxWmVzrbdG0=;
  b=E0xgb4CMDQwfyWZRW1t1ZU8Yg4JrRmj72w9RtccxDhGLJI/Z1kgnGnZ9
   BDtKCuvc8sWPEBeF9G2hGCiX3duiXDHTlMungDKMUahWI3HFesjVMOUnf
   diWqP5T5q6YYAPHQDsYM/2CCD7saox5rkn+NO3scZvhpeyTKrq2Vs67Tt
   9ejnkD3gniXGt1d699t5hZ8kB7g+eTXlv5yH63JTelnF4/zYfSA/ofJW4
   2IgW6OoMTQvz/SuJyTDJv38Tbfgd/UMXVpmx3T49aZ/IxlbWCA97XuzMc
   uCPMVgKyKU4UKWOlmb1EOuCxFf6dsAVMm0R8enimMYKhdfDpLa+LUmX+I
   A==;
IronPort-SDR: fpRSHNj+i8Us1bzKHBXInDO3wpMdMvIV46FAMEaiXI6jv3orGTPbZXKlO7Xo3pGwqOBVJuLL4s
 QX3kYNF6YH9mqgCZp59mo2JnfMqb9brqhAIlOiiNrLPOJ+easdF04Z4HzQcrUg3M9+c0F/9DAF
 AIjZRDNjYp//VGl11SYvpPBvo5Qyz+C5KMlhiDUXNcfR0jqwmj6rclDEUuA7GCwcy6DMvm6E/K
 eJ3mijpsZdIc4sbTgIlvs0xHrzkw1bjoLVjTNkP4A5dH+66YP7ih4cEpti4IhWzRgwD5QVaW3q
 RqE=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="15128694"
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
 <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
 <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
Date: Tue, 17 Nov 2020 14:50:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-11-17 14:40, Bruce Ashfield wrote:
> 
> The agent is unable to register with the master due to one of several
>  errors

But if you have an agent, that would be 2 nodes, right? One master and
one worker node?

> I'm rebuilding on a rebased master now, and will follow up with
> better logs when I relaunch my test.

Excellent!

BR,

/Joakim
