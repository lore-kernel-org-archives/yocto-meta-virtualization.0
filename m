Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.7446.1605618350114991094
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 05:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ERts/UCO;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=598; q=dns/txt; s=axis-central1;
  t=1605618350; x=1637154350;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=Faq8uMZ/MV67YjAK3AHNXW4em0SM6TOigcbqw+/Xqq4=;
  b=ERts/UCOuiAe3126oUEiJCjgoUlcuGqHsvOdNbOwXi9PyejjiINadeiS
   BCKhCeA4YGhFs4zUMi4VC+oGqx7h6cfymxfKq/7Mrg/OmAEh1l/yXVeYN
   Z5vpYKT/DGW4zQDIfij/g+Uggas4faBh3sbLYGX06HVWJAvKPs+7raIcX
   z+IcosWb4xDnWabMAh0QGji9aSrFrMqJTWBGFmb/nBN8fR3Otv/T3tmDe
   JKTShYx/fhF8JY16YsUPMHq6xKhvakrbecXf/0+R9VVjqUjoIS3r/t89D
   1ue++5UbyNwb58hA4ISvJ/1EqCS4Q+0w2HlvWAhNdB1aUbYiARL2M6EEO
   A==;
IronPort-SDR: YwZtzV1Ik86wozfAjpQB3YQu3MbkGxp0zMz+vMS3ZmqGPs5ESq0FexIgXTI+TzDRj/wOIEPSLf
 nVKodoT8VyIqKIIrsEoMUAyb2gIiTc6E77zb7UoGXgDx435L4jCMOcwlkgaK8TRnP1TGZIOgmE
 ftn+M4ckGD/67hr/r0hJ83zELV5GOTiHSe3pMfteT7PQHdCTC+6ET09NJMeqHE7YX9HfiHfeUb
 MvA9xqJVPKZ8PZQgIvIpIqm8QvwoTeYDhHcA85CaZukYyUQLbdGxSwon6GBbC4DWkWpEsclyNY
 exY=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="14595873"
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: <meta-virtualization@lists.yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <16484BFA14ED0B17.5807@lists.yoctoproject.org>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <698f9ae0-d048-7761-cd54-c718ef68ac53@axis.com>
Date: Tue, 17 Nov 2020 14:05:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <16484BFA14ED0B17.5807@lists.yoctoproject.org>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2020-11-17 13:39, Joakim Roubert wrote:
> The current stable release installed when running the regular k3s
> install script is now v1.19.3+k3s3.

I launched a multi-arch cluster with this v1.19.3+k3s3, deployed Linkerd 
2.9.0 on it and then meshed a small test application sending traffic 
back and forth between a client and a server, and it all seems to work 
quite nicely.

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

