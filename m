Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B195E00D1A; Mon, 25 Sep 2017 17:47:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.176 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1038E00D16
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:47:54 -0700 (PDT)
Received: by mail-qk0-f176.google.com with SMTP id b23so8571706qkg.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pzwFRoFkv/UvykG4w4QLWuku0EPYn9Y+YXvOk/fwUZU=;
	b=azMxFEwa0YOVm9o1IFCDZjj2ougSTDQSBuzrLtQyggM0EuIpkzJbIPaJooYN1rzf90
	YU87sJ+PappXOeRCrexmrpeI5sZuZdr85DAzhyPLmovpfTtSvufcKRtaO/xBVE5z1kvW
	kFCXGFxr3pCgtASo03QVtwDgblUr9Bg8lEo7hincW6s+uSz0Yfqi2FPJynYnqRXJW4Tn
	ZFfSuuhuq9YYLxyk6qZEqe0PnLvSkTHKS2L4D0UVssq23uQK09dQGVw7MfQMZBrhwcIe
	5tm4LDoXUExU6ZF/QfWKCgmEY80Hdtj1FcwHqq2Nf7txsYrquBDFbqIcYAlEmAxeQLI1
	cZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pzwFRoFkv/UvykG4w4QLWuku0EPYn9Y+YXvOk/fwUZU=;
	b=t6mBBYPAlhg6JWIdPr+rdsCnhcMW07F50HbeqV2zUtA2AdCL+07PYOVL0TTkMOKZ4X
	l/Yj7Mbk8ur77juUAjGDa0+xlDJTvnkUaNQlWzS9B5FNfw6T61/OJxxnKdwkdpKQI5Wb
	Zg/dngEBbzGmQ7NGrHg7/IMc5nKOwP6j0K9WT7FF6utgPuaxMfzCx7Hejh0HC/uHatWr
	VX46bakcjepJxo9XuQ6O6H4zSmSYrpxsiTrO5tyk9YrT/xXcx/q/5pDu2QEoeMlFBAJZ
	KqooNn+rxAXP2W/SXmJ+fBhCgi2TOca2ZXHEPsDiRox6Pn3ounq4w0aiTJ1oJABXQaXm
	59Tg==
X-Gm-Message-State: AHPjjUhPhyaCBWqQwczErG0HsuRZyqw90b8/jGQpEHoAX96XR8pAHuhD
	6I777cyiCITS6pnEDrW85GtgLx8nJZh9NV26OV8=
X-Google-Smtp-Source: AOwi7QBAe4wynfaADIyIH3iRaVivVg9snXx1yIRWVN78PQc6QDbsCvJOUj6CM9/GRIn9QYv4pmYpzuUAFCRmNQbgwQI=
X-Received: by 10.55.187.133 with SMTP id l127mr12191584qkf.94.1506386873859; 
	Mon, 25 Sep 2017 17:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Mon, 25 Sep 2017 17:47:53 -0700 (PDT)
In-Reply-To: <CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
	<CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 20:47:53 -0400
Message-ID: <CADkTA4OBuR=WWsiHW1r07nboKUtPuZNQBR9dN_uPPfv5zfvBzA@mail.gmail.com>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Tue, 26 Sep 2017 00:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 8:16 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>
> Thanks Bruce,
>
> but I still don't understand,now I have following in my bblayrs.conf
>
> BBLAYERS ?= " \
>   /home/user/poky/meta \
>   /home/user/poky/meta-poky \
>   /home/user/poky/meta-yocto-bsp \
>   /home/user/poky/open-embedded-core/meta \
>   /home/user/poky/meta-cloud-services \
>   /home/user/poky/meta-cloud-services/meta-openstack \
>   /home/user/poky/meta-intel \
> "
> anything else I should add?


You do need more. The meta-openstack README states:

layers: meta-oe
meta-networking
        meta-ruby
        meta-filesystems
        meta-webserver
        meta-python


Which means:

meta-openembedded/meta-oe
meta-openembedded/meta-networking

... etc

And as Paul just pointed out, you don't repeat poky/meta and
poky/open-embedded-core/meta,
since poky/meta is a combination of open-embedded-core/meta and some
other layers

Cheers,

Bruce


>
> 2017-09-26 8:07 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>>
>>
>> On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>>>
>>> after clone the oe-core: git://git.openembedded.org/openembedded-core
>>> there are only 3 folder inside (meta, meta-selftest meta-skeleton)
>>> seems meta-cloud-services need things like meta-networking and meta-python
>>> where can I found them?
>>>
>>> (that's why I think the needed dependency is  git://github.com/openembedded/meta-openembedded.git )
>>
>>
>> They are sublayers of that repo, the single clone gets you all the layers you need, but
>> you do need to add them to your bblayers.conf file as they sit in the clone.
>>
>> Bruce
>>
>>>
>>>
>>> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>>>
>>>>
>>>>
>>>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>>>
>>>>> Clearly the README is out of date (and wrong).
>>>>>
>>>>> That should be oe-core: git://git.openembedded.org/openembedded-core
>>>>>
>>>>> Plus that isn't nearly the only layer dependency
>>>>>
>>>>> I'll have a look at what has gone wrong and update the README.
>>>>
>>>>
>>>> I pushed a fix for the meta-cloud-services/README, which is mostly empty since the
>>>> majority of the packages are actually in the meta-openstack sublayer.  That layer had
>>>> the same issue with the layer references, so I fixed it as well.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>>
>>>>> Bruce
>>>>>
>>>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>>>>>>
>>>>>> according to layer README
>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>>>>>> it said
>>>>>>
>>>>>> This layer depends on:
>>>>>>
>>>>>> URI: git://github.com/openembedded/oe-core.git
>>>>>>
>>>>>> but seems failed to clone from that URL
>>>>>> should that be
>>>>>> git://github.com/openembedded/meta-openembedded.git
>>>>>> or other repo available?
>>>>>>
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> meta-virtualization mailing list
>>>>>> meta-virtualization@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>>>
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

