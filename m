Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBFCDE00BBD; Thu,  8 Nov 2018 11:54:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8903EE00A54
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Nov 2018 11:54:16 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id z13so5102360lfe.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Nov 2018 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LskyBB9YLN81weg4zBaoraxwbpLc1C1GL5n/63WrJb8=;
	b=enXs5Fo7avwRe2aPo66I/rWfebl6btlaNHHwySTx4HYQg0eKq+7d1Xtmw0IJt1lmVv
	/APMnyBQnwDIRTRgFZpuTxzPHmMvEKxDtrJedHp/NCjhe8u/51AXg42YorFDBZi5DvKc
	0sDilnT/kymrpb+TKJlLqnTRSXe/g6RnU/td4Sshu0t2Q0qtTEap9vJ5NUzTKgzIihxb
	AZBo3bJ0qAItehtGD6hhLEbq5yPrVary0VxD5EYUE2PPcQSzUuCki5F0MJ2iEXyI/ZBa
	p2UI5SZIbNvVOb/LIsEUde/GBmphCRYr5vmOaPhmXxu0e16fQMTVSkgFxcS6OLuibkoK
	HLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LskyBB9YLN81weg4zBaoraxwbpLc1C1GL5n/63WrJb8=;
	b=mdrQkKpYrPrrzqY+7E1nyqkySQQkrn3lVg2WJsAhqs+0Lk7G6VyfNrSbzn7Gz624K2
	F+5vR5fAw5aGIVbN3JvWPGdWMp0fRSdtyWBC/cu7cES3cXdu1S8NlC71nCKQZunw0cR5
	Jq3iS7/hD2qYkzez8/JxKl2ViIYqxrP/S2Sw6aRSWBAak185Q1t8S9eY1/1o7izGt4CV
	mEGO/X1XxTorY0GW6wNHdD0Jqp1/PaChuA2S32uojhnLh3RfnLb7DR9psiZVQiuPHlLY
	nSgDgLj+k2a/ryee86y9u0ZGByzzu529icFlQDszl0nOcQmW2YnUocB9Frvg75fChKcl
	0IfQ==
X-Gm-Message-State: AGRZ1gLLBbHoG+MbqEIGt9jEz2OiIYhaNxE564RynF1pSdSSHoWaR3ZF
	1eCh4OcqUkDyUb4zE/2uFCT55liHHJdVQQyqcGs=
X-Google-Smtp-Source: AJdET5fEGOgboNmCnI+T5eEXn51aqT2N24oARKKGtGZfz9oS8hoIWLDl0uPb8rc+2UhwrJ5rDOLs/wmu+1X23E2PrVg=
X-Received: by 2002:ac2:4188:: with SMTP id z8-v6mr3740506lfh.3.1541706855098; 
	Thu, 08 Nov 2018 11:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20181105182805.12356-1-kerriganb@ainfosec.com>
In-Reply-To: <20181105182805.12356-1-kerriganb@ainfosec.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Nov 2018 14:54:03 -0500
Message-ID: <CADkTA4MQ-EdX8aAXJj=yLs2RciCBYzAyVopoj+R9DkkD3he17A@mail.gmail.com>
To: brendank310@gmail.com
Cc: meta-virtualization@yoctoproject.org, kerriganb@ainfosec.com
Subject: Re: [PATCH] xen: remove sse tuning flag
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
X-List-Received-Date: Thu, 08 Nov 2018 19:54:17 -0000
Content-Type: text/plain; charset="UTF-8"

I don't hear any dissenting opinions on the patch, so it is now merged.

Bruce
On Mon, Nov 5, 2018 at 1:28 PM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> Strip out the sse4.2 tuning flag to prevent sse instructions
> from being generated in the build, which breaks the hvmloader
> on some machine types (specifically core-i7 from meta-intel).
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 2650413..7eb2ac4 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -842,6 +842,7 @@ export LDFLAGS=""
>  # conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
>  # patching the build to be ok with this
>  TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
> +TUNE_CCARGS := "${@oe.utils.str_filter_out('-msse4.2', '${TUNE_CCARGS}', d)}"
>
>  # Supply the full set of compiler flags via the tool variables
>  # Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

