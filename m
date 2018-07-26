Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82162E00CE0; Thu, 26 Jul 2018 08:30:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94859E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 08:30:54 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id x10-v6so792223ybl.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Jul 2018 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n888e/bF+dLCo+fCOMjbQSKkj0a4HAcgaH6+Agccows=;
	b=Ys05mHXzpVCSlYQsmSZtkKmOG8jTjOVFIpbXAkugVVF/oF2wZeja407cI2Uh7HFNGu
	YUvv9K1flRtYd1T1xS3pPa4rmw78dy/m/JmSYHZh6GwT1UK2dp91vV162wd8iPPdL7TY
	64a8xMLQezeJ/BbMQ6hMGwxTStAYLuWLNgBIvR0l/oXQcSyDqxyd2JVDzpZW7HEIznh1
	wervL/KE+PSNRDquHWBBUSwuhcC7yKUVziYDjZIWkc8acbTAq/58q8STlWYEEfP5qnrt
	IzvE+OMEdsH+y6iq0BI2swd6XXUV/zOTEdrHuw23zrBjW0Nc//wB6QS1Cd0gcJql79Mn
	ZH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=n888e/bF+dLCo+fCOMjbQSKkj0a4HAcgaH6+Agccows=;
	b=gbH2RGfsfgHugalMXDJ27aRM6VBftz2t5w61ZNajbCl7ItLSEU7awRwaX61BUkjRjA
	RBUDYUsCkTUB7v4ZDdfGYBzg9EcYp3bTMX5MOdi9lukbeBN4VCfWSiLMJMacPOr4pNaq
	V78bG509ATSG4g7nU4I/qxMAVd/zyhg3jn8EqY0suPYC406S0jrQl+8Pg0fsLGQ9moP3
	b4MsMT0CWQsf6ZaXnDFOn4pRk62Ybe4Ij83NtcWC6sZwLPlL0nF0uvu8mT7UHee7GA1U
	NsDyeK4vO2vs5gphNUmovq7R4W3pUG8dRzA/vVkt5WFShmFpvLzbjKnWOC2TgaW8Qsz0
	Mz5Q==
X-Gm-Message-State: AOUpUlFxpG5mSbYogxj0RBcauDLxHdwiMdGC5WF/Qb76plokygtmQTL5
	bHtlUL8n+EvrNRJtsmM3r6urp1he3heIj6WvNAw=
X-Google-Smtp-Source: AAOMgpdmp7wPQ2WoO1jEHtWs1r9CiIwmEVfaS6lQKEwRspKb9BijrTincnLN7oc4QYgmA39JIB/pdo7cZkl1Aw6Z5qk=
X-Received: by 2002:a25:5344:: with SMTP id
	h65-v6mr1272958ybb.232.1532619053464; 
	Thu, 26 Jul 2018 08:30:53 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Thu, 26 Jul 2018 08:30:52 -0700 (PDT)
In-Reply-To: <CADkTA4NEFB1pKFBmbHdNGRF1nKNdxUmqHvwEPqPA8HLsG8KQMQ@mail.gmail.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
	<CADkTA4NEFB1pKFBmbHdNGRF1nKNdxUmqHvwEPqPA8HLsG8KQMQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 26 Jul 2018 11:30:52 -0400
X-Google-Sender-Auth: xW8qN4CvWue66QI1eI04ISBr4IE
Message-ID: <CAPuovEKysxWXemV_ngox2bsHLy-VkAgt4F8ec9xRPTbiUdi8rQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: Fix systemd-modules-load.service start failure
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 15:30:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 10:41 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> merged.
>
> Bruce
>
> On Tue, Jul 24, 2018 at 7:08 AM, He Zhe <zhe.he@windriver.com> wrote:
>> systemd-modules-load.service bindly load whatever in modules-load.d/*.conf,
>> in this case, kvm_intel and kvm_amd. One of them must fail on a specific
>> board and causes the following failure.
>>
>> This patches remove them from KERNEL_MODULE_AUTOLOAD and leaves them to udev.
>>
>> systemd-modules-load.service: Main process exited, code=exited, status=1/FAILURE
>> Failed to start Load Kernel Modules.

Nice. I have been wanting to look at why this message was being produced.

I do wonder if this change will cause an issue for folks using
meta-virtualization with sysvinit though. What is the behavior if this
is the case?

Mark

>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
>> index 9905ed9..c09b07c 100644
>> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
>> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>> @@ -10,8 +10,6 @@ KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'featu
>>
>>  KERNEL_MODULE_AUTOLOAD += "openvswitch"
>>  KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
>> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-amd', '', d)}"
>> -KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm-intel', '', d)}"
>>
>>  # aufs kernel support required for xen-image-minimal
>>  KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>> --
>> 2.11.0
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

