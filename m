Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.28751.1605724056891259078
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 10:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=lR0UyWoV;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id AE23C38C06F7
	for <meta-virtualization@yoctoproject.org>; Wed, 18 Nov 2020 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=601; q=dns/txt; s=axis-central1;
  t=1605724055; x=1637260055;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=c73He+B8AWN2yoRNvd082v0hl48q3264O/ahjBVVdu0=;
  b=lR0UyWoVDQh6R2duZi8IjlQiycE/okd2qe4KVgajzMXDtglfR99eWiEK
   HW+h3pKvCWxNU4jSJDfY/nrGwqUvADt0OdIBPRC0epQC2qnqmhVWwbmAg
   aeErHId00/Sc6uljjEr15K8NHLIkjI5PsrqeUARAtDRAMRkP8nBTHtYey
   pCH3/yO4F03dlcJkVhqWTtBSzyPfhcq3x5adiKPGgzYSCFUhBCOeTzpc/
   r58spQH+M964b1cRs6ZkJXB0jkXyh9JEJWHAJx3Bd2I5sk44KMfbADO7E
   XdzHx78TmJ4eXWbuJbtw6zo+BV/MAyZ96HdFXYKKIQ92VJaTU4KRFePr/
   w==;
IronPort-SDR: 4HmkSi/o3nXyZkdgcfZM2l/w9It580+Y8LJPBrJ2I+bBB6C5UNn1TdocKXu0Pggj07jKuJMo3a
 uNtluUmaxycmF2a1HVawzMTlsuz/rapMXF23dxCqb9jI5VQKjGwyuL5Lt4Qi1IyzbpZZ4VVL3M
 lWPymKnj0ya2+AFPoZmsNSCOfW2UIlg4fI8l8mIURhH7WfrHMqznYXPixWKwm94M0Xk18jFrUO
 6D/QfhV4VRtNzVegxPuvcwLJCTIaeNGEpdciHfLV/1/v0vnDXDwZ/DyWvAsc5QmJfntoKjYxKV
 fG8=
X-IronPort-AV: E=Sophos;i="5.77,488,1596492000"; 
   d="scan'208";a="15185055"
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
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
 <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
Date: Wed, 18 Nov 2020 19:27:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-11-17 20:39, Bruce Ashfield wrote:
 >
> root@qemux86-64:~# kubectl get pods -n kube-system
> NAME READY STATUS RESTARTS AGE
> local-path-provisioner-7ff9579c6-bd947 0/1 CrashLoopBackOff 822m
> coredns-66c464876b-76bdl 0/1 CrashLoopBackOff 822m
> helm-install-traefik-mvt5k 0/1 CrashLoopBackOff 822m
> metrics-server-7b4f8b595-ck5kz 0/1 CrashLoopBackOff 822m
> root@qemux86-64:~#

 From my own experience with CrashLoopBackOff situations is that there 
may be serveral different things causing that. Can you trace down what 
is causing the CrashLoopBackOff here?

BR,

/Joakim
