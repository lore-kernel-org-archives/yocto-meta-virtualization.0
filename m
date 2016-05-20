Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DD53E00EEB; Fri, 20 May 2016 09:41:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 335ACE00D23
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:41:42 -0700 (PDT)
Received: by mail-pa0-f52.google.com with SMTP id qo8so41487369pab.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=R0BPim/valP6ANArW4wKKJncpUTK/cLimk1xut7oYY8=;
	b=g9zYmZcF7n6B9VOFSkx0biNXtmDuHznhy6pzYOkcBfKYT5HwyI68PkemDFepwnaapQ
	ztuwnkV0COqn7xck9ClRezYO/8invMwl6vei1KTLGM7/t6eY9Yjp+gxZybGVnvGAzBDj
	eByv52dvmqeBbFmPxpSsrdKBk//KWGGOKQvgaEe+4qsmT133QQyHfGMnuH0AKf9cgbne
	zPLSXPJCtX1s7VJaGtZQQYdB+0T8xt1YmtHTg+kIs+739CQZqCbKontNs9VjUSzmgMOs
	BgjOlcW/Vsp2Rv9Pl0c6/UCMR0h67StYIGY5O8lnABYwGDtmyrZMSDTzrFHxU6e6zP1g
	SbPQ==
X-Gm-Message-State: AOPr4FVEy/xH65kdkoxYD6rQsqDKYfH6YelfAKIGph9zZouRLV3Uyc5f4ygn0E19K+Df3ZVf
X-Received: by 10.66.153.105 with SMTP id vf9mr6259765pab.47.1463762502399;
	Fri, 20 May 2016 09:41:42 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:8196:cd93:bb4:ee0])
	by smtp.gmail.com with ESMTPSA id
	g77sm28376451pfg.78.2016.05.20.09.41.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2016 09:41:41 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>, He Zhe <zhe.he@windriver.com>
References: <1463725643-4514-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4PhPeH8OtSknWb2U0AhoPz3x2-neFFxuX3HQ8epkrbpXQ@mail.gmail.com>
From: akuster@mvista <akuster@mvista.com>
Message-ID: <8ea11d6f-4707-55ce-ee18-6394cb3d4a83@mvista.com>
Date: Fri, 20 May 2016 09:41:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PhPeH8OtSknWb2U0AhoPz3x2-neFFxuX3HQ8epkrbpXQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] qemu: Add packageconfig for libseccomp to avoid rdepend QA warning
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
X-List-Received-Date: Fri, 20 May 2016 16:41:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/20/16 9:33 AM, Bruce Ashfield wrote:
> merged to master.
> 

Wont this make a depends on the meta-security layer where libseccomp lives?

- Armin


> Bruce
> 
> On Fri, May 20, 2016 at 2:27 AM, <zhe.he@windriver.com
> <mailto:zhe.he@windriver.com>> wrote:
> 
>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> 
>     "WARNING: QA Issue: qemu rdepends on libseccomp, but it isn't a build
>     dependency? [build-deps]"
> 
>     Currently qemu itself checks and links with libsecomp(if version >=
>     2.1.1)
>     for x86 and x86-64, since it is not specified in configure, and
>     causes the
>     above warning.
> 
>     This patch adds packageconfig for libseccomp and set it disabled as
>     default.
>     This feature can be enabled whenever libseccomp exists and is needed.
> 
>     Signed-off-by: He Zhe <zhe.he@windriver.com
>     <mailto:zhe.he@windriver.com>>
>     ---
>      meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 1 +
>      1 file changed, 1 insertion(+)
> 
>     diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
>     b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
>     index ca8274e..9d774c4 100644
>     --- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
>     +++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
>     @@ -1,4 +1,5 @@
>      PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
>     +PACKAGECONFIG[libseccomp] =
>     "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> 
>      PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
>      PACKAGECONFIG_class-native = "fdt"
>     --
>     1.9.1
> 
>     --
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> 
> 

