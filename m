Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26F53E00B47; Thu, 18 May 2017 15:17:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.46 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E70EBE00B43;
	Thu, 18 May 2017 15:17:03 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id h4so72188617oib.3;
	Thu, 18 May 2017 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NzX6GP4+PhKXjx6vT5Iui4M1s5n2i7oEX01dk2KtTjo=;
	b=nAi1M+SL/cxTW1GBRtA8QWfuOcKqtLZa3TjNqz968hi61Ur7x1QioSFsBK9WZ2Deei
	/ZTzviJegGkRMh9x7t0JoEn1Rm450O2Y9UPdS44xA16f9O/hRM/RmpnSEuwpA/0ZaOnh
	AyP0wzWx/jZJk+5JEcQo2Qm8WqNlS/bvBKeYZVSPFGnLGjxiNXLsn1sF61OTkkzPHezm
	NU1OpP9k5rk+74qYFuewnx/qsgpQ6o6NN/1isTDF13vjSURGzbtRqNo9HQ/F3A5Uo3jq
	KwCEutf6K+iAC6u25XNoUVZxOSa9P4a5xoagdKK/UqACyGehHrnhCRFIexonQcmQIJyv
	Cn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NzX6GP4+PhKXjx6vT5Iui4M1s5n2i7oEX01dk2KtTjo=;
	b=rD6vRUiT5sOlFM7jr46I5mvEdAsG4YnEbOecJzwoReR0CuzCvpCufV1Kxii1DwZEu1
	xtbuGeGtVF2QGgRDdN4yyv6lupRWXzQHgBHShpOoXSzmBhnaV6vexC3pDpi60csul2xB
	OuhVEU9pVebf6GLUbnpn5VPR8dVwIwLSu4XKoMUhEB+7PnYIM1gzoVdsFS5pu8JO5VWo
	Y+6nJbpqBExSIgPTiy2z76do3jDcy+kFABaxWWe5lJwsLepwp1z2LKSp8hNqopvzsli3
	pGCK/pZL6D+kXta7yYWwLWHmjE8oCDEKUMy+xCgu7P9nNaThUXaE5QflOVMOe2Ez2Ufy
	9Bug==
X-Gm-Message-State: AODbwcAxlkSfXwLwx4JtneBBURIKNtxFtfdDTdcDXtMuUsp2Y24M22AB
	w9tfQn1ppWpqfOXwJ3q5ar0wjdTBVzl5tIQ=
X-Received: by 10.157.0.105 with SMTP id 96mr3783583ota.196.1495145822539;
	Thu, 18 May 2017 15:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.16.163 with HTTP; Thu, 18 May 2017 15:16:32 -0700 (PDT)
In-Reply-To: <CAFL6qn5QCWsUHag+2jWCg_imLQHE+FQVKC09iuP1=vY3DJQqcA@mail.gmail.com>
References: <CAFL6qn5QCWsUHag+2jWCg_imLQHE+FQVKC09iuP1=vY3DJQqcA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2017 15:16:32 -0700
Message-ID: <CAKmqyKO1hpeMOeiek2C6fzsmsXKr4UtxmCEVnkM0mqSg87ajwQ@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: yocto@yoctoproject.org, meta-virtualization@yoctoproject.org,
	meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org
Subject: Re: [yocto] Trying to build a xen-image-minimal with petalinux v2016.4
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
X-List-Received-Date: Thu, 18 May 2017 22:17:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 1:08 AM, Pello Heriz
<pello.heriz@alumni.mondragon.edu> wrote:
> Hi all,
>
> I'm trying to build a xen-image-minimal using petalinux v2016.4 following
> the steps that are given in the ug1144 documentation. Anyway, when it starts
> to execute the bitbake, it shows the next errors making the building
> impossible:
>
> generalelectric@mlan11214m117linux:/opt/xen_test$ petalinux-build -c
> xen-image-minimal
> [INFO] building xen-image-minimal
> [INFO] sourcing bitbake
> INFO: bitbake xen-image-minimal
> Loading cache: 100% |############################################| ETA:
> 00:00:00
> Loaded 2940 entries from dependency cache.
> Parsing recipes: 100% |##########################################| Time:
> 00:00:04
> Parsing of 2327 .bb files complete (2291 cached, 36 parsed). 2942 targets,
> 195 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing RunQueue
> NOTE: Checking sstate mirror object availability (for 320 objects)
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Failed to fetch URL
> git://github.com/Xilinx/xen.git;protocol=https, attempting MIRRORS if
> available
> WARNING: libglu-2_9.0.0-0 do_fetch: Failed to fetch URL
> ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.0.tar.bz2, attempting MIRRORS
> if available
> ERROR: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Fetcher failure: Unable
> to find revision b49f2bffb7fb64eb8e9835161afeaca642ad0bac in branch master
> even from upstream
> ERROR: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Function failed: Fetcher
> failure for URL: 'git://github.com/Xilinx/xen.git;protocol=https'. Unable to
> fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /opt/xen_test/build/tmp/work/aarch64-xilinx-linux/xen/4.7.0+gitAUTOINC+b49f2bffb7-r0/temp/log.do_fetch.6468
> ERROR: Task 345
> (/opt/petalinux_2016.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended/xen/xen_4.7.0.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2437 tasks of which 2421 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:

This is strange, it looks like the commit doesn't exist, but it does
exist. I can see it here:
https://github.com/Xilinx/xen/commit/b49f2bffb7fb64eb8e9835161afeaca642ad0bac

Do you have branch=none (or something like that) in the recipe?

Thanks,

Alistair

>
> Summary: 1 task failed:
>
> /opt/petalinux_2016.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended/xen/xen_4.7.0.bb,
> do_fetch
> Summary: There were 2 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> ERROR: Failed to build xen-image-minimal
> webtalk failed:PetaLinux statistics:extra lines detected:notsent_nofile!
> webtalk failed:Failed to get PetaLinux usage statistics!
> generalelectric@mlan11214m117linux:/opt/xen_test$
>
> Can anybody tell me how can I solve the problem?
>
> Any answer will be welcome,
> Best regards,
> Pello
>
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>

