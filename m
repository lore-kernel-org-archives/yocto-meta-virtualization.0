Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4158.1605188410657643974
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 05:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=cuamKmjk;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id EC2E838C0966
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=496; q=dns/txt; s=axis-central1;
  t=1605188410; x=1636724410;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=uBq4LhXzrj+dhEZrEqyGHrS3Pxr8fBPBV/vwUhvbl64=;
  b=cuamKmjkIk1Na1qMwN+I8RPGbfExNRfYAYwUrbzfJoYQA73nQlBKOYcU
   i3AjDOqSri2C8OJ0D0bIdyJ2pznNVJ7mLiSGG2+ZVH3IHWec0jW9qDpGp
   vTG/u+kD68Y7MMYlVruQYI9jwF32Eij+uaJMbDF/0qKiBEgMxods7viWw
   RSwmB3In14fVIia6idtKNNnek5xM31iqzi7edRCXgEzxB3dsvt2coc94j
   4xAD4d5hi+UFq8AA/YJMKFe8Wcs30Nmgk6MidvsZtrx9RmNwSdXvpgGyg
   8iNsjX6/f+rf0CqtiRAGRiJWWN17RWnblHcEw3qng26cmrFDCACGg5I3y
   w==;
IronPort-SDR: a/IL4Jla+JOA4Ac3R5EflXlF/RrKJ0A/gaZqDx8B0F7fQ3aj6x9jd7xzuzH4OCnrxV32psFNKi
 ytiezzT3ULj8sjfDxwAjsG4smJ92IXiudaMWj6biynSDDxswadwfv1CXmgwp2u7iNBwh3aOk5v
 fKm3K4JbpUaGm91TQrcL4VppCPETvhR1Ota1FDzCRkADF6FWJDSBhLY41xpTK1EU2XvezZPtuK
 jsYhc6YJ52T0kT+lXJwmzHtB0ZENMR3ci2MmoyVLt0S2zrSj/PTZd6sjPwhxqroIeXB0qR8qwB
 6zI=
X-IronPort-AV: E=Sophos;i="5.77,472,1596492000"; 
   d="scan'208";a="14994943"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <5f4c82ed-4279-293b-a5cc-c11ed83ef289@axis.com>
Date: Thu, 12 Nov 2020 14:40:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-11-10 14:17, Bruce Ashfield wrote:
 >
> But if anyone else does have an all in one working and has some tips,
> feel free to share :D

When it comes to mount issues as were mentioned here earlier, I have 
seen those when I have has /var/lib/rancher/k3s mounted on overlayfs 
file systems (which does not work when the containers are unpacking 
their layers). Mounting another file system (e.g. ext4 or someting) on 
/var/lib/rancher/k3s has mitigated such errors.

BR,

/Joakim
