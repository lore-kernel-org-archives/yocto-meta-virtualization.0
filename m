Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8744.1605623239093915534
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 06:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=LC3SsIX3;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 957BB38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=547; q=dns/txt; s=axis-central1;
  t=1605623238; x=1637159238;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=qh4IX4ZKXlUX/NJ8IQrxT2EAMAujyMoUbLrJGnsHKa4=;
  b=LC3SsIX3ICUCX6/yL2Up9LxVOArHtr+VAmip79PZg3etb+x2PZwkRn9S
   GtRIDDUGsPGTY7B8Io1gxWwHTG3y7dzSxsiSLPUH9m8psdPDQh1GctWzQ
   lCNEYk+JFXwCnnQqWMjX8xkuL4MxGXGQb6MmUhhVFEBKY5806HI62ze+X
   i9esQiyfwZ0LJTuIpBlfAlqG0IUiPPgunBYs3HzbKa7OhXMfNgQzvSVPj
   cSHZgLG3HWqqueueCJ8T458w5kwSgSeV5bHpfrT9GuKEI8K5H7sioM5Zq
   D95lK61dPg/z5FPoNU9G260DQn4sj0AMjnbI2kRNJLHNQL1sy4/bues4R
   Q==;
IronPort-SDR: inhYCZR4XDyMdv986JbfYHk8Kg95twyhxj6/8YgxODgCcYjq9I2uEXq/lPSaicQMUG7y5t0mfe
 Nmw6wcmVqjPerZ02Kycsv3WeSLC7u6dA9lCHrU4o1b770wL4VbwW72/BIab2Kf7US0RJRLHChw
 E5nVapd6bGOGowr79RotxBpetcjd24UJh+PiWLvqCuuUxoc2aDBsVMIN+8S85Ksl5hm6zvesKd
 I/EEPfeVwW/85i1Lvoed4nvovowZYFNzOUZWFJUH1PqwkVrPTx66xxn4asQ4Sl6RflqC2rPm/a
 8qk=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="14600195"
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
 <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
 <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
 <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
Date: Tue, 17 Nov 2020 15:27:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-11-17 15:19, Bruce Ashfield wrote:
> 
>         But if you have an agent, that would be 2 nodes, right? One
>         master and
>         one worker node?
> 
>     In kubernetes terms, perhaps. But physical boxes .. no. This needs
>     to be testable under a single instance (qemu in my case).

I see. Well, I have never tried that, but would in that case use one 
qemu instance for the master and a separate qemu instance for each 
worker node. (I should try to run both master and a worker on one 
machine and see what happens on my setup.)

BR,

/Joakim

