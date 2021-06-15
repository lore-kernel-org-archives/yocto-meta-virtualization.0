Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8510.1623760060896029499
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 05:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=I1j3Pver;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1623760061;
  x=1655296061;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=MIZ5DHZBImmuyCOOTPgxH8BbvqQivvEXd5j41ZCVfnM=;
  b=I1j3PverYOHtBTK6YMtEbr/FQBMjFb3fumfuX8S9B/w8Vc0cAsPDK808
   hWkKXw+RRUXLGGkKHJGYTB51ViXYQjp1yidIJLJONXZ8619q8Wlx2Jkud
   V8ZNahhnid2qlY9UF5n52ZqhtdeaaxvFVZoglOUNCROpCbUrb4y5cYoT2
   dsvBTBi3NncvXLGrSvR3s6eeZ5BvlK1JMVe7THSEbGjubV+PQVtxqxBdG
   9SU2viBt8EWz0l5eGr2jQHwq8nUm4jdeGYYFeu/FwYLaILzv1V9PtKVaH
   1Nymp8qkycBtascjopBm9k4J4wIpV6/LMSjffdKwCCvYE41mUdXcT8EK7
   w==;
Subject: Re: [meta-virtualization] [cni] do_compile network issue behind proxy for Hardknott
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <b345fed3-bf43-178e-70b3-6f3bacdbbb65@axis.com>
 <CADkTA4Oh8V-M-G2OOhhp70ygXNVP8b1qhkV9asJGDCf1=YdvLw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <594ed2dd-652e-92c8-97c9-e370d7c15b04@axis.com>
Date: Tue, 15 Jun 2021 14:27:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Oh8V-M-G2OOhhp70ygXNVP8b1qhkV9asJGDCf1=YdvLw@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-06-15 14:10, Bruce Ashfield wrote:
> 
> I have a note written on the paper in front of me "fix cni build for
> no-network", and a half started fix. :D

:-D

> Let me dig up my changs and see how far away they are from being ready 
> for test.

Awesome, thanks! I will be more than happy to evaluate such changes here 
in my builds.

BR,

/Joakim
