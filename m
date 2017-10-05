Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAEEBE00D85; Thu,  5 Oct 2017 09:14:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.128.195 listed in dnsbl.sorbs.net]
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18A1FE00C77
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 09:13:51 -0700 (PDT)
Received: by mail-wr0-f195.google.com with SMTP id z1so9878088wre.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tG/tTbN71o+NyVZP018hfeBw211sGJG2QXEUAVjMCRY=;
	b=jAgw/jz4pPAeTjzb8jfEHBDyPVYpTwulycCar8bymRx5eJO2kAHo6O7P658Af7P99W
	OprSp9Jn34DBa/V0JifMRp7f91lpAF7KjWJG6TH+96DrDny2zUT+QhPIhSS5eQDMtUW6
	JxL617BtlXMzPpkMWUtvFopA4vz2pOFMgb2sTokILSX+s+t7sRgKG0jFJiJL/VqOR61r
	nG1k9rctl5IGOGNTrpLUBHlORoevzQJRCq84irtiur6hKBGtBqDQ4UIBLBmgTHsqD0jL
	5IfDKQp34Hm3ppOVfo8Yl5PDwM598Pb0bh//+sYra2O096KCuRASLtBQl9JpxgZgC8Ri
	XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tG/tTbN71o+NyVZP018hfeBw211sGJG2QXEUAVjMCRY=;
	b=EcIi6zE5uXK5mR4oHOeOe66YqtD5L/DTLKuXfPpPfKWJXAP8Z7g97511a9GlmirorJ
	tvdnf6SE559tOF96BA3WhMPNqfnibhBU1gYtFg0Qszx3F3JvxGSQsef36L8j0cTr0kKO
	udhPPS/DfGjOPsFzr5jVTQd3X9Er2GtKyaTsh4H47VUgUw8+iXWeIOdfS6t4oRM00jvi
	4M0jCYOdvC13Urtd43uYuPQnKfEoI7milHso2qXXIHNHajS5bfHlusCSO6kCtdF8R5jU
	bcyH5ZF63PAMzmaLLNCIqLgF6nFZ1XAGXHaKyc5oSXWEEOI014Etup8qpdp3rdlczqLT
	h1fg==
X-Gm-Message-State: AHPjjUgwJHwloqloOI+zx7VjQQfRGlgfYxMyzX/CvVWhxn76fQ8Z3lY2
	bwzTVnK/gbpBNOHINRKwHxOF3Mk3uDAX4Vq7RA8=
X-Google-Smtp-Source: AOwi7QAHAnPKRGy43F3jI/b8KnPvf41kraA+KhYN9HO4OVUDWTVqCaIHb621R79aoGCjfsg/oxlOtSG6zCvAOa4/+EU=
X-Received: by 10.223.169.143 with SMTP id b15mr26507862wrd.127.1507220030938; 
	Thu, 05 Oct 2017 09:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Thu, 5 Oct 2017 09:13:20 -0700 (PDT)
In-Reply-To: <1507194014-6933-1-git-send-email-dariusz.pelowski@gmail.com>
References: <1507194014-6933-1-git-send-email-dariusz.pelowski@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Oct 2017 09:13:20 -0700
Message-ID: <CAKmqyKPMwCqi4JXPa8HUbdTsub=VxqF5LpP3uJ1KxEmpmiTa1Q@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] seabios: uri corrected to https
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
X-List-Received-Date: Thu, 05 Oct 2017 16:14:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 2:00 AM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> There's a problem with fetching SeaBIOS source code via http.
> SeaBIOS server returns 308: Permanent Redirect which fails on
> wget 1.17.1. The official source code uri goes to https, this
> patch aligns SRC_URI to officialy provided by SeaBIOS team.
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
> index 5c095ac..144b13c 100644
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
>  SECTION = "firmware"
>
>  SRC_URI = " \
> -    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
> +    https://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
>      file://hostcc.patch \
>      "
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

