Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 582AFE00948; Tue, 24 Mar 2015 21:17:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDBD6E0091A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 21:17:52 -0700 (PDT)
Received: by labe2 with SMTP id e2so10158082lab.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tSXYITguawKm6qmp3SX/wkXvjlTvA0mGJmclHoNKpME=;
	b=gXGkBhNjyq7dUJjuN1CEBmEWJRzpHUUDd151asnNDg/90nFxht7DI1dC1X3nqg4Z2B
	xGLuyAz9DthYXFC2Hw98YB6NaSMLoenj3MjJ0KeKzhlnjg+4gmgAocYr+KOOr6oN19NY
	AiDXSNOy1rmieP1HcISGdqto8hxs1PnfPawToILJSro8KFZp8HIRISkxPCJK1v7Qyhm8
	LWt4YcMiYBx0HNhZboi0jCmdg6+exLpWo0aVCYKAkHOoMDq/od2CuFLl16952/UG4m0z
	gt9mLSuCa9/7WybPg6ob8DIV4LXdq3KT6Pkdv4hfkOu6+vv9DdJ4KwiMPfg2XoJZZUv+
	bMmA==
MIME-Version: 1.0
X-Received: by 10.152.179.42 with SMTP id dd10mr6723918lac.122.1427257070242; 
	Tue, 24 Mar 2015 21:17:50 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 24 Mar 2015 21:17:50 -0700 (PDT)
In-Reply-To: <CADkTA4MSmK4bj=yv-YkjVwP2RzUo+_3Dn=yJcP9e9JNw1CaVSw@mail.gmail.com>
References: <CACrgodeNuWsECmFftXE3t3V8hvZGMu6spLXyw+KdPc5GPcUt6A@mail.gmail.com>
	<CADkTA4MSmK4bj=yv-YkjVwP2RzUo+_3Dn=yJcP9e9JNw1CaVSw@mail.gmail.com>
Date: Wed, 25 Mar 2015 00:17:50 -0400
Message-ID: <CADkTA4MnUz6zq-QTjNZa9PYGGSJczOtrrcPck6hz0XQUcAEo1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: bblayers configuration
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
X-List-Received-Date: Wed, 25 Mar 2015 04:17:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 11:53 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Mar 24, 2015 at 9:15 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>> according to README in meta-virtualization
>> I download all the related repo. and add following to my conf/bblayers.conf
>>
>>   /media/data/poky/meta-virtualization \
>>   /media/data/poky/oe-core/meta \
>>   /media/data/poky/meta-oe/meta-oe \
>>   /media/data/poky/meta-oe/meta-python \
>>   /media/data/poky/meta-oe/meta-networking \
>>   /media/data/poky/meta-oe/meta-filesystems \
>>
>> then change BBFILE_PRIORITY_openembedded-layer = "4" insdide the layer.conf
>> of meta-oe/meta-oe, have I done everything right?
>>
>> I go following error after issue "bitbake kvm-image-minimal"
>
> I haven't built this image type in quite some time .. but I just
> configured and launched
> a build.  I'll let you know the result, one way or the other.

My build did complete (fast machine), and I was able to generate this image just
fine.

Do you have anything in particular set in your local.conf that is
setting incompatible
licenses ? That's what the error message you are getting suggests to me.

Bruce

>
> Bruce
>
>>
>> File:
>> '__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
>> lineno: 2, function:
>> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
>>      0001:def
>> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
>>  *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) == "x"
>> or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
>>      0003:        d.setVar("EXTRA_OECMAKE",
>> d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
>>      0004:        d.setVar("DEPENDS", " ".join(i for i in
>> d.getVar("DEPENDS").split() if i != "gconf"))
>>      0005:
>> Exception: NameError: global name 'incompatible_license_contains' is not
>> defined
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

