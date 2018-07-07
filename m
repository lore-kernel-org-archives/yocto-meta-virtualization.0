Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBDD9E01136; Fri,  6 Jul 2018 19:50:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A6A3E00A4C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 19:50:05 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id i9-v6so5298069ybo.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 19:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=GAfwFLOTd4RYGn6aeYHchA+bP+tcaBZeJa0bcjD8C7Q=;
	b=Laa6x8O7XIuzeorxoK/OYr/yEpOuvD5CcjPRsNzbbJd+TrkoY595IHrjbWrsHD82ML
	FvePPIAFgwB2pr4EDk3xiiOAPyub9AQo/VNgJx9Gsl2wFo4/RFcisnFho/Ouq8uCWGTA
	PAAGLMbVeFrlOlms2uU9PbpNb3u6T7zbC43wY7Q1QABo4OIIXLNag1hVIT1ZxCG18Ycd
	Q+SL2DFCNNConztCdImmLfrRQLLYBiVlTAti+smjFTsq/GJOCaOJ8I5pSXt06l/v+pZQ
	qu1JK6TlzAGGGnKZ2eshZVU1DvjHQR6Ypig+siU0aY+tQ3mOs5DdiEbmtAKENboxE+9L
	eYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GAfwFLOTd4RYGn6aeYHchA+bP+tcaBZeJa0bcjD8C7Q=;
	b=ERz8YJJr7nbBBtcW1oj74E6nO14P0hdVlXhl4sHwfwZhxMMl6sm66aVCkEUCXbBSfr
	KdK1/tu+qgDRNIdTe+IlWN2YGnH/yGz637+71NceHPW3+swBKMZmshYAkzQfAkLT0br3
	OKbERGu1K+fbhlcccMr0KDAPKn2tbo0snP0gwcNSbkuZ9JyhKNEQlmbUcPcCgNHlUFdC
	IC23LEXw8mMkcmRuCranYrcPmaQK3OOYN7c/7D31jyWfxHmJwr8ATdsz8G58Aa5DU5rG
	cNIfEKpBx/XoTJfbWqlrOe3EgJo9ZxNdm6WGed+TZtblOXQah4LxVoS7TlMJ2ZqyDlN+
	0fig==
X-Gm-Message-State: APt69E2VsF1/m6pNPp3Mchx0pey9WZQwaXAJga87qw9xrWFg/SOhwN+2
	ZZmRbJ/3C3smEdWO1jex6i2S77KhmfE=
X-Google-Smtp-Source: AAOMgpczoSTVsTOOTxjmM/dz0CHKQs7LNB0qEepCHHAAaMrEgT8nLDIANyCtx0Oe/aSeBXBDY3oYdw==
X-Received: by 2002:a25:b087:: with SMTP id
	f7-v6mr6286364ybj.293.1530931804231; 
	Fri, 06 Jul 2018 19:50:04 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	b190-v6sm3716000ywf.16.2018.07.06.19.50.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 19:50:03 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
Date: Fri, 6 Jul 2018 19:50:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] libbsd: Remove dangling append that no longer is needed
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2018 02:50:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Going back through the log I didn't see any indication of the problem it 
was trying to solve. I assumed it was
a standard configure doesn't work with a split build. Currently it 
doesn't apply to master at all and I haven't
seen any actual issues. What where the specific steps to reproduce?

On 7/6/2018 7:33 PM, Bruce Ashfield wrote:
> Can we log why it is no longer necessary ? i.e. which version of the
> package has fixed
> the old clean -> rebuild problem.
>
> Bruce
>
> On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
>>   1 file changed, 1 deletion(-)
>>   delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>
>> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>> deleted file mode 100644
>> index 7447c56..0000000
>> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -inherit autotools-brokensep
>> --
>> 2.11.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


