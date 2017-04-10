Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 575B7E007EE; Mon, 10 Apr 2017 12:06:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71909E0059A;
	Mon, 10 Apr 2017 12:06:12 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id 206so4876077ybe.0;
	Mon, 10 Apr 2017 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bcn7RL0eSsyy++AFmTBzVVlzGO3WgVkjU8vq2HTkJ+E=;
	b=m3Pn3AC+Iv0yw8MAqMXsmJq9w9FTH8W9vziouzeycWs9eVCI0+gLqtanLOSbG1VZoW
	nVOFf8AcAetdWEmVTPaYlVwwR5O1G/Ul4uPWwVPrT+b130rlvMNb0TPrhytEV6tDFKtc
	FOV+2eZlA/grWuX3Xf7rf8X3jODxPSLRfoQ1E3rWVkxCFwFuXlaq+S7AqNixV3z4ULIo
	ug3VEIzAWt878WLSwh58NDIVtQwtflL6PIIxXX7868tEKuuENT77uvViA8CVHj6rlRSr
	rTpNCmowkFIpzhtswNszcjlKsmjyN3llK9T9Ihkk3io3DfnzZrAOrqGrjjQJLnU3O8Lp
	QC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=Bcn7RL0eSsyy++AFmTBzVVlzGO3WgVkjU8vq2HTkJ+E=;
	b=XjIWXDOPHmCiB9eonjpyyFIgNcc0Kx4sV0UjQRqQDWslM4HR+hk1cG4rJUW7KhShZN
	IpLsfH5snu331xRnqbrcyCqzV0wROm+3RoBRrAZ29U16qeMVoorrNP6a4T73kXLA91yN
	FTPm+g8tGPb+iXsMaLJbZQ89lFriwPggdh8mOxS0SHwf6FzPW1ikMIwAAFsUtOM4pu3F
	rdmajyYzsIIlAXywxpy1kg3o6xRI9WNiiQaxHTM/kzTe9Y+9mZ/LDOo/aylm3Xa01KPU
	mEMeqO0txEfh6mizdFJ8Jxv0QPy+WG4eEl268v1/S/sQYDGanq2S+XhGb6MGlLD7Idnd
	GgnA==
X-Gm-Message-State: AN3rC/7wP/wFMY4VjRt9Sfg5R91yERZhGpnn9488cjJC022jVDdZ917Mi0UXZhPlfcad430WLVcTBnoeX5t2Ww==
X-Received: by 10.129.99.193 with SMTP id x184mr3528208ywb.306.1491851171587; 
	Mon, 10 Apr 2017 12:06:11 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.56.88 with HTTP; Mon, 10 Apr 2017 12:06:11 -0700 (PDT)
In-Reply-To: <CAFL6qn4COY_d-uRBe-ausjbW+7MOUkU6gU8kkqkHj_gokxxmEw@mail.gmail.com>
References: <CAFL6qn4COY_d-uRBe-ausjbW+7MOUkU6gU8kkqkHj_gokxxmEw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 10 Apr 2017 15:06:11 -0400
X-Google-Sender-Auth: kgMP3AS0Y-EVvWZsvml-TUlKxC8
Message-ID: <CAPuovELxeqghWkbjOu6GrWZ2kHKX5A=8QmH-fjh84EhpHmM=eQ@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: joe_macdonald@mentor.com, yocto@yoctoproject.org,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, mark.hatle@windriver.com
Subject: Re: No recipes available for meta-selinux and meta-virtualization layers
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
X-List-Received-Date: Mon, 10 Apr 2017 19:06:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 10, 2017 at 3:59 AM, Pello Heriz
<pello.heriz@alumni.mondragon.edu> wrote:
> Hi,
>
> I have tried to build a core-image-minimal image with master branch of Yocto
> and I have added the meta-virtualization layer and it's dependency layers in
> order to have virtualization functionalities enabled when creating the
> image.
>
> The problem is that the bitbake execution fails due to there are missing
> some recipes for meta-selinux and meta-virtualization layers. This is the
> message that I can see in the terminal when it fails the execution:
>
> pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_xen/poky/build$ bitbake
> core-image-minimal
> Parsing recipes: 100%
> |##################################################################################|
> Time: 0:09:00
> Parsing of 1981 .bb files complete (0 cached, 1981 parsed). 2752 targets,
> 204 skipped, 0 masked, 0 errors.
> ERROR: No recipes available for:
>
> /opt/yocto_GE/yocto_master_xen/poky/meta-selinux/recipes-devtools/rpm/rpm_5.4.16.bbappend
>
> /opt/yocto_GE/yocto_master_xen/poky/meta-selinux/recipes-extended/findutils/findutils_4.2.31.bbappend
>
> /opt/yocto_GE/yocto_master_xen/poky/meta-virtualization/recipes-kernel/linux/linux-yocto_4.8.bbappend


These are what are known as 'dangling bbappends', that is bbappends
for which there is no associated .bb. This happens for example when a
newer version of recipe is changed in one layer and we have yet to
make the associated change in meta-virt. Another case may be that we
have bbappends for recipes files which are only present when
additional layers are built. In most cases these are annoying and only
slightly concerning and thus we usually treat them as warmings and not
errors.

To make these errors become warnings set the following in your
local.conf or if you are building up your own custom layer you can
similarly do this in your layer.conf.

BB_DANGLINGAPPENDS_WARNONLY ?= "true"

Over time we usually apply updates to correct these, for example the
rpm_5 one should be corrected sometime in the near future, similarly
the kernel 4.8 one. Usually however expect some of these, be aware of
them, but don't make it stop your build.

Mark

>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> How can be solved this error? Are you planned to update some patch for
> solving this issue?
>
> Looking forward to your answer,
> Best regards,
> Pello
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

