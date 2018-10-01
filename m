Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 528F5E00B58; Sun, 30 Sep 2018 18:15:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C028AE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:15:17 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id u21-v6so3484472lja.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Sep 2018 18:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TeP8chqI4mJvrAy1UYS61FeYX8uNxT6wte8NRfLNLH8=;
	b=ijt3KAifYPIQPIPesbOnCa22bk7Lo4NWVJ/sinhwKO9vzHCSE3veAMzdObM2SAYd58
	YcOx2fqg8ZZJ/kcJkF952JvAaCuru9QSBW01P0iAWXpeM6NeGCHFFb/C4gFyRa5CnCqf
	gyRayuhcTwInLR37GbH1OsuHncGQaE81YII+jtBVp6GC7rG6AxewYrMZxAxUwjeQIaJP
	3lvQTQiqSP9HUy/9c9z/5U9GT68NbfPSo3f1fehjjv3W6k0HAMbF9Dzx3SonEb3i7Jm8
	8n39kJn6RHq/M8R0MfnoJgJtXH1RgyTWpmTFsoBNjrI62w8Cwq3CAKcZKme6iaE4+HlG
	S1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TeP8chqI4mJvrAy1UYS61FeYX8uNxT6wte8NRfLNLH8=;
	b=SUDUKnUNx6jAeq3BHkGAzdIwXcMKMBd5KCLb/d2MOhy1e5lsewfLMTr0eN5XPksf9w
	IpRpA6UyY9/C88is+1aC7AKrf6f15k1DeFbaDN/P9W4Goip0SLH+iztEjHzCTRFN5VNP
	erAdHGF3KiZL4jEomorZwX7TbV51IsKA0Xqd54f1KUBoUFRNEG+sS0AfDjJt55An5wd0
	lI3gZ207gB9vyegv9yerC63k1IvDtJ0JXtgl+kqlTHXUk2Rb3cKFElVM7gJd8JWSj01+
	3TnCrH0/0OOg+DZcr9lJ/3ocxOABgc49S+psGN0WHB/+2IlqXpQYK3X+sWc+p6deYI6y
	vdFw==
X-Gm-Message-State: ABuFfogG6H1WDWQF+IuHLsIuXKb1r7iVL5wv/Ma0vgiEbuzAXKDFXRC8
	71/XM4Ll3tHgcj/OHAK0sBNFmajY/2buCGW6qrdfMw==
X-Google-Smtp-Source: ACcGV60dQvDLTVH3GMA27Lg8mgINJhmF45G1iVTpr3VM9jv8TZ073yjtioysasdtVzN6rmpgLYzUBNBwPag5kPTrZ34=
X-Received: by 2002:a2e:8589:: with SMTP id
	b9-v6mr4913795lji.122.1538356516366; 
	Sun, 30 Sep 2018 18:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 30 Sep 2018 21:15:05 -0400
Message-ID: <CADkTA4Nhu=48Rbm0MO=j-qBQstZqXgFPgOe7qxe=beygV2wfCQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning[ldflags]
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
X-List-Received-Date: Mon, 01 Oct 2018 01:15:19 -0000
Content-Type: text/plain; charset="UTF-8"

The shortlog of this isn't quite right.

You are not really fixing the QA warning, but are making sure that it
is masked in some sort of multlib configuration ?
That needs to be clarified in the shortlog.

On Sat, Sep 29, 2018 at 11:17 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below warning:
> do_package_qa: QA Issue: No GNU_HASH in the elf binary:
> xxx/usr/sbin/registry' [ldflags]

And the configuration explained here.

Bruce

>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 7c7bce2..23d94c9 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -58,7 +58,7 @@ do_install() {
>  }
>
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
> -INSANE_SKIP_docker-registry += "ldflags already-stripped"
> +INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
>
>  FILES_docker-registry = "${sbindir}/*"
>  FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

