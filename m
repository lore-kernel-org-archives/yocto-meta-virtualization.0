Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63969E00948; Tue, 24 Mar 2015 20:53:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2338E0091A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 20:53:41 -0700 (PDT)
Received: by lagg8 with SMTP id g8so9958028lag.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 20:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vdzrNaDEfDHYlejp7eoyzAvIKbcuPH0ffsYYM4FCmdk=;
	b=Jymm9pRQQ2bRbRRGUoG+pzx3GxMAjESSvLqJNLZbYnCgmim0Q4rCe0zBl27oGHk3Ap
	b11Xp0fOWUU92OA/2VYydcO0NwT4Vu+LPfUZQU0shH4RPYX2g1rsDQULzncdAElx8UQL
	OcWAt3CRsMneJ+wQM0sjXS3WoH/mv5M+BjND9zPm9tzzdL55ePtzOrt1DZ25aSvwAhWf
	AJLm2QO6wTMt/twksKHRlolDvWP9XB6snawXGOXPohpoi3pqd639az5yyNfByBvoGBWI
	w7xa+tlq3NlrJEjSLRszdjkeqTjWgu+7C2LNJk0QRio0Rm2b90RGRf3/b96m9CAMToh/
	gJqg==
MIME-Version: 1.0
X-Received: by 10.112.235.38 with SMTP id uj6mr6615159lbc.9.1427255619678;
	Tue, 24 Mar 2015 20:53:39 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 24 Mar 2015 20:53:39 -0700 (PDT)
In-Reply-To: <CACrgodeNuWsECmFftXE3t3V8hvZGMu6spLXyw+KdPc5GPcUt6A@mail.gmail.com>
References: <CACrgodeNuWsECmFftXE3t3V8hvZGMu6spLXyw+KdPc5GPcUt6A@mail.gmail.com>
Date: Tue, 24 Mar 2015 23:53:39 -0400
Message-ID: <CADkTA4MSmK4bj=yv-YkjVwP2RzUo+_3Dn=yJcP9e9JNw1CaVSw@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Mar 2015 03:53:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 9:15 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
> according to README in meta-virtualization
> I download all the related repo. and add following to my conf/bblayers.conf
>
>   /media/data/poky/meta-virtualization \
>   /media/data/poky/oe-core/meta \
>   /media/data/poky/meta-oe/meta-oe \
>   /media/data/poky/meta-oe/meta-python \
>   /media/data/poky/meta-oe/meta-networking \
>   /media/data/poky/meta-oe/meta-filesystems \
>
> then change BBFILE_PRIORITY_openembedded-layer = "4" insdide the layer.conf
> of meta-oe/meta-oe, have I done everything right?
>
> I go following error after issue "bitbake kvm-image-minimal"

I haven't built this image type in quite some time .. but I just
configured and launched
a build.  I'll let you know the result, one way or the other.

Bruce

>
> File:
> '__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
> lineno: 2, function:
> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
>      0001:def
> __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
>  *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) == "x"
> or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
>      0003:        d.setVar("EXTRA_OECMAKE",
> d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
>      0004:        d.setVar("DEPENDS", " ".join(i for i in
> d.getVar("DEPENDS").split() if i != "gconf"))
>      0005:
> Exception: NameError: global name 'incompatible_license_contains' is not
> defined
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

