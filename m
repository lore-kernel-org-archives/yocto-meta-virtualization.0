Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.29835.1631541346326842762
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 06:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=bwUvrul5;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631541346;
  x=1663077346;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=8maJ5M0zSMihwYZeIrViogmJaogGKiYg+XnSxs779g8=;
  b=bwUvrul5fpyvcnMH0JouNQE5B+4gkv1jzdudZh/Mm0MsZd80/A6PIe0U
   hwjphliZ1NqA3DIA+IWmhUyT99vjUqDoiFtjjXeCIhySpbx8MYY+24OAQ
   zJ9KpfNE9/6ACjzS0/iPaw7DldsTqS5t77gFD2mEAvQUcOODd9ntE9U2K
   zgUh5lfrqDzbHNm1DHbZidvukmWvsBt2SQhmwf22o39hzhuIpUCka50i7
   z0Oyi1+f7PXRUJcxK7gPkC5hXB4QAyAi5qC1H8y9Ah1kOR6wiK8asFVFp
   r9F/6bxJsMuEB/tRJO1jFXajAc2GghW7yQSIo0cqD2EQQIAiUszb+5TTC
   Q==;
Subject: Re: [meta-virtualization] thoughts on k3s and supporting builds of more than one k8s version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
 <CADkTA4PVaJRsbzw8E8cco8_F8u-g2J6v9S9eUqygTK+=8C70Tg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <e549678d-3267-f44d-5832-ed4e579a30fe@axis.com>
Date: Mon, 13 Sep 2021 15:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PVaJRsbzw8E8cco8_F8u-g2J6v9S9eUqygTK+=8C70Tg@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail07w.axis.com
 (10.20.40.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2021-09-10 14:34, Bruce Ashfield wrote:
>> What are your thoughts on this?
> 
> I've held pretty firm on not having multiple versions of anything in
> the layer. Multiple providers, yes, multiple versions .. no.
[...]

I reckoned you had given good thought to this already—thank you for 
clarifying and sharing those thoughts! Makes sense.

BR,


/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

