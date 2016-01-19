Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDBB6E00AB9; Tue, 19 Jan 2016 05:34:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90C8CE0090A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:34:25 -0800 (PST)
Received: by mail-io0-f180.google.com with SMTP id 77so549085191ioc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=scXyVfTa0sI31L7xulEr/WcgImPRU/L94tG4DPkv8Jw=;
	b=TRKzriv1s3N2B2dtItMDi5jgGXyEDLTNKMH6go7DlidFsDDOIGOgN2nh7ubiJH7QTp
	EC98hsbPOA4E5856dentowLNgGCoVm6BtS7v75kd+bcHaZsj3QfofIMQrmtspPRqbO6j
	xcK60tJ//pvA+WTYf1MMCeQSUkKgZsWQk7kt2I6YoNCbDGIY2h73eNl5Orsie0Q64RO/
	z4bH50OpnP3s927e7v8AIZn8SZcEuI8I87TPgCZEpV7gm0v1AsWpZ7UOCVjIhqlJs4fo
	w7wrnnuQK5unsaM3mTPtXF4Mlcr/Oj9s6WQB/g7Kg3mLkE3NvSHCPsHdMVOvu400x4oz
	vp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=scXyVfTa0sI31L7xulEr/WcgImPRU/L94tG4DPkv8Jw=;
	b=IZ8uftppCkeXUCh1IiPwvF0JYgwV1H+hUzLBJoKXGqJ1GVzFnA/iL5I3gE7QyS3YQE
	W8gedOs5wyuD4gwAIyMypbppc/JLTFlH24MSHgOCv588rrxv2wJj1G0nF9l8qJ06GTVT
	1J6UZZTgrUREYW0eJqueixXjOF7hyFIiq4s38Xnx96Leoju9ChpXnRLCevBu/jcFbBCq
	PDWVJvnwZ+R2Eer/CHQ2vs4Mwurz0eyuA613Qkf0NjGzQip8dA2D8Fj/afgbpYyg/ub3
	11s3PDrp/6lsxlOHZwWW5RbALkgMkNPUOnKLKG6kIVu/0/YiTdXwGh4vbm/Y25BCF7sa
	lbOg==
X-Gm-Message-State: ALoCoQk8AX66tk1bH1BDjMM4hMUF/ytGFL06cbP45PEMGrRotXHz1y48O/Hk7LoQP7zhiI243vVbwx+W8KbuGtHUOkqSYhc1aw==
MIME-Version: 1.0
X-Received: by 10.107.28.82 with SMTP id c79mr24906710ioc.86.1453210464624;
	Tue, 19 Jan 2016 05:34:24 -0800 (PST)
Received: by 10.79.115.5 with HTTP; Tue, 19 Jan 2016 05:34:24 -0800 (PST)
In-Reply-To: <569E2842.3090704@tycho.nsa.gov>
References: <569962FB.8070601@tycho.nsa.gov> <56996543.9070709@mvista.com>
	<569D0DBF.2020007@cardoe.com>
	<CADkTA4PFkbhtMk0FZdU9_11fu6L2P+UDr3hzy2fJ43MW3i9MRA@mail.gmail.com>
	<CABZSBQciLB0t5jn_FoHW6s8pD6PV8Q9S5h9z4t7k_--C++-5AQ@mail.gmail.com>
	<569E2842.3090704@tycho.nsa.gov>
Date: Tue, 19 Jan 2016 08:34:24 -0500
Message-ID: <CABZSBQcOEvJ3dzkw14Dtt_trUzR5fFZv771LY5=Jn362aMmypA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: "M. Gregory" <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Tue, 19 Jan 2016 13:34:27 -0000
Content-Type: text/plain; charset=UTF-8

Sorry Machon, you're right.  I did a fresh build yesterday and did not
get a QA warning.  I neglected to account for the fact that my tree is
using systemd...

Thanks!

On Tue, Jan 19, 2016 at 7:12 AM, M. Gregory <mbgrego@tycho.nsa.gov> wrote:
> I am up-to-date (6ec960100...). When I remove the patch (below) I get
> the same QA Issue (below). All the meta-virtualization dependencies are
> up-to-date on master, also. My local.conf is the default yocto
> configuration with MACHINE ?= "genericx86-64" and DISTRO_FEATURES_append
> = " xen". Am I missing something? And why is the ${PN}-devd not need in
> the PACKAGE variable?
> -Machon
>
> Patch:
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ac9796b..c63cb2c 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -149,6 +149,7 @@ PACKAGES = "\
>      ${PN}-console \
>      ${PN}-dbg \
>      ${PN}-dev \
> +    ${PN}-devd \
>      ${PN}-doc \
>      ${PN}-flask \
>      ${PN}-fsimage \
>
> QA Issue:
>
> ERROR: QA Issue: xen: Files/directories were installed but not shipped
> in any package:
>   /etc/init.d/xendriverdomain
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install.
> xen: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: Fatal QA errors found, failing task.
> ERROR: Function failed: do_package
> ERROR: Logfile of failure stored in:
> /home/mbgrego/work/yocto/poky/build/tmp/work/core2-64-poky-linux/xen/4.6.0-r0/temp/log.do_package.4500
> ERROR: Task 337
> (/home/mbgrego/work/yocto/poky/meta-virtualization/recipes-extended/xen/xen_4.6.0.bb,
> do_package) failed with exit code '1'
>
>
>
> On 01/18/2016 03:37 PM, Chris Patterson wrote:
>> Everything looks good on my end.  Machon, can you confirm you are
>> up-to-date on master?
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

