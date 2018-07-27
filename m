Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A1BBE00CEE; Fri, 27 Jul 2018 07:07:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E1E4E0086B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jul 2018 07:07:37 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id t18-v6so1893342ywg.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jul 2018 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O33lUMOx5Ei8RE415gCaeeXJtJmw39wGfx4dUVzWWI8=;
	b=OV/iGrbbteJM+uWcI6qZTZc2raCJ6nYm44CQq3nLN1zjbp+hTZ+cAbdG1jMai1VlYi
	q21UkulR8V083tl1NW+B4Y2TykgX0b0uqsDCZwUJyzlyNagmzweb5i1gndAzSC31BTAe
	O+zR5hsM71gkMp2Luo7yYgVq5uIGElpv8lTQsKhsygGAlKH/Il0ilFhogmqW98PrOLji
	c3F9Q60z7dOJl9g9ZV16xUdwKPAwek6atUpUbP50usHtqDX+hmoD7MdY8pG4XIvgwQxL
	hQ9P87KOnCATS6Wk6MkjtZ1tG19PG0mK79jRVUoq55RPrObje8hfpq3Lct+GwkYLvH0k
	uuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=O33lUMOx5Ei8RE415gCaeeXJtJmw39wGfx4dUVzWWI8=;
	b=Df1E4MGvml7FcFBkB53qbcrN0no9+92sYq2lO8pyJZdNp5CDUGGUi8bVvRvw0l3+lO
	z4jxjJECEnfEVVPQPx1NOxMGGW74hyyioW9QydVk0XF6Um7PcOl85dlSuOFlxW3IDZlR
	30+enpNyWDzaQmB9dugYssXAypxP6EIgUqRgK7eHbP4K1Gx4dsh+0NZrtawfZOQfFgf9
	52bsGmbJ/L9cdllW/X0u9njJCQQVdhEtpt5oBSe+OvH4YXNDMQp4I0JL+YkRSdugvIDU
	ii1p60hzLbR8ml7LsdbhnV289vjnERI5ggRhXVfBF3NtFOyUJ0SNFHNjnw/ludAbdEsK
	oHUg==
X-Gm-Message-State: AOUpUlFU90sjEdZ8M+l5D95Woscz1Yf4HgsHli4K7sr2xvb/Beo8D9V4
	cl0+xkUPJ9a7zBJdCfEkFHXMKqxEsE3Diagvcro=
X-Google-Smtp-Source: AAOMgpe1y2JL09MZ2AAm7BrWz8n9OiUGgKFmE7yyDolhg5r5mPl5CQScWhQurCN4WPHrtbEIEr2iJdc81c9dZoKjHBQ=
X-Received: by 2002:a0d:c344:: with SMTP id
	f65-v6mr534913ywd.508.1532700456534; 
	Fri, 27 Jul 2018 07:07:36 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Fri, 27 Jul 2018 07:07:35 -0700 (PDT)
In-Reply-To: <924582dc-63ab-ff7d-5fad-b5220ae43ba7@windriver.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
	<CADkTA4NEFB1pKFBmbHdNGRF1nKNdxUmqHvwEPqPA8HLsG8KQMQ@mail.gmail.com>
	<CAPuovEKysxWXemV_ngox2bsHLy-VkAgt4F8ec9xRPTbiUdi8rQ@mail.gmail.com>
	<924582dc-63ab-ff7d-5fad-b5220ae43ba7@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 27 Jul 2018 10:07:35 -0400
X-Google-Sender-Auth: mhQwOVSkLTV6wKCuNAZc9ncRUhY
Message-ID: <CAPuovE+0RGpYipscThSCiRavNH+6Z1FLfzoufR_c+Q2Oih11oA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
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
X-List-Received-Date: Fri, 27 Jul 2018 14:07:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2018 at 9:42 AM, He Zhe <zhe.he@windriver.com> wrote:
>
>
> On 2018=E5=B9=B407=E6=9C=8826=E6=97=A5 23:30, Mark Asselstine wrote:
>> On Thu, Jul 26, 2018 at 10:41 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> merged.
>>>
>>> Bruce
>>>
>>> On Tue, Jul 24, 2018 at 7:08 AM, He Zhe <zhe.he@windriver.com> wrote:
>>>> systemd-modules-load.service bindly load whatever in modules-load.d/*.=
conf,
>>>> in this case, kvm_intel and kvm_amd. One of them must fail on a specif=
ic
>>>> board and causes the following failure.
>>>>
>>>> This patches remove them from KERNEL_MODULE_AUTOLOAD and leaves them t=
o udev.
>>>>
>>>> systemd-modules-load.service: Main process exited, code=3Dexited, stat=
us=3D1/FAILURE
>>>> Failed to start Load Kernel Modules.
>> Nice. I have been wanting to look at why this message was being produced=
.
>>
>> I do wonder if this change will cause an issue for folks using
>> meta-virtualization with sysvinit though. What is the behavior if this
>> is the case?
>
> It's also OK for sysvinit.
>
> With sysvinit, modutils.sh in modutils-initscripts.bb in packagegroup-cor=
e-boot.bb
> would take care of /etc/modules-load.d. And udev still takes care of kvm-=
intel and
> kvm-amd.

Great. Thanks for checking.

Mark

>
> Zhe
>
>>
>> Mark
>>
>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>> ---
>>>>  recipes-kernel/linux/linux-yocto_virtualization.inc | 2 --
>>>>  1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/rec=
ipes-kernel/linux/linux-yocto_virtualization.inc
>>>> index 9905ed9..c09b07c 100644
>>>> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
>>>> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
>>>> @@ -10,8 +10,6 @@ KERNEL_FEATURES_append =3D " ${@bb.utils.contains('D=
ISTRO_FEATURES', 'kvm', 'featu
>>>>
>>>>  KERNEL_MODULE_AUTOLOAD +=3D "openvswitch"
>>>>  KERNEL_MODULE_AUTOLOAD +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'kvm', 'kvm', '', d)}"
>>>> -KERNEL_MODULE_AUTOLOAD +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'kvm', 'kvm-amd', '', d)}"
>>>> -KERNEL_MODULE_AUTOLOAD +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'kvm', 'kvm-intel', '', d)}"
>>>>
>>>>  # aufs kernel support required for xen-image-minimal
>>>>  KERNEL_FEATURES_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>>>> --
>>>> 2.11.0
>>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

