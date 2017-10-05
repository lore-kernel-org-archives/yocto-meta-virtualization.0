Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F3D4E00D87; Thu,  5 Oct 2017 12:56:38 -0700 (PDT)
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
	*      [209.85.220.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3932DE00C9F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 12:56:36 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id a12so7974238qka.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FbQJqttOaKAUrVWaGL6V6poinwbcvDhRhIrzP1dGKQo=;
	b=I+VSd7wsFREdAVf2FgiUT6csgqFCKOfC76OkKh38aaV3M72ta8kcRQ5GUdrRZpuKCj
	9Z6fOKZKxpuy8x2cBOfAa59FRRf6MpkI0n4ao0raGNa0yBFQxu1SwZjgieKGNuz7c+iW
	Ov3ypFYAK+ACqfJw32q/lGNeu6SgBsAwT0z1AdRqOsOZV5cqqHqrZWGuyxSNn5pU8Hae
	vYeYuTWX7Tlff9uyVb69212o/UppWlj9tSWhnCEGO83Va0Zw/ThTRKe5Z/h+0BKMdj4d
	yJCUtqvoB5KmQ5OOW6gaZAd+R48ugQNaNj+PqgpiuokwZSoD6BAfAAhr118jaS4xaexV
	0nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FbQJqttOaKAUrVWaGL6V6poinwbcvDhRhIrzP1dGKQo=;
	b=Ig/emYTD2UNHmPaD33yP2L8uFAK72c98h2sYUfS6iDp/XZlPIPPTJ3U998gVZOg0ax
	aVmWCDXG8disvrCnjY7AH0dERE6f8tFqLkGCUHTH6dBLq/AHpWXg93CV1KUgHSvV/YG8
	YdjBimDDvfAJwrJtcuvqAyliE9CHSNSRcZRKx9ib560KAm6sUyi1TLtHWyEgPwiPz9S4
	t1CxwT8gW5xhP1dRpMEvdlGd4QOjHFkaH0Mxhy3UqL/NXXEFEscsslm/8BM4zGOtYyvC
	/iYJlAGIeHF/+u8jEuIQ3cKWm34PvNRSzlux0OG14R5z4G/UTxs5qR6bQPmmBE6lNp0b
	KClQ==
X-Gm-Message-State: AMCzsaVx8PbMVP933FaaTO0HwNLDA6CW1is0qnpnPO+CnXpzAJxdChV6
	WTIwa+aBb0m4lkKP1TfNu+VLyNsqE44quMgbOI4=
X-Google-Smtp-Source: AOwi7QAghbIYOc9fVHwhWBasfKAHDNVf4AafMeDOJyydkwrAsOgslGUohb2bs1JdYT76KO7vJg1CN9h2tNT0FWdPMkM=
X-Received: by 10.55.159.4 with SMTP id i4mr30342105qke.339.1507233396182;
	Thu, 05 Oct 2017 12:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Thu, 5 Oct 2017 12:56:35 -0700 (PDT)
In-Reply-To: <1507194014-6933-1-git-send-email-dariusz.pelowski@gmail.com>
References: <1507194014-6933-1-git-send-email-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Oct 2017 15:56:35 -0400
Message-ID: <CADkTA4MtzYSitV6yqc8bdJkVz_96N390kdGnTqJK-32OKLiABA@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:56:38 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Oct 5, 2017 at 5:00 AM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> There's a problem with fetching SeaBIOS source code via http.
> SeaBIOS server returns 308: Permanent Redirect which fails on
> wget 1.17.1. The official source code uri goes to https, this
> patch aligns SRC_URI to officialy provided by SeaBIOS team.
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

