Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1E91E00C01; Tue, 17 Oct 2017 10:12:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.180 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA3A2E00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:12:26 -0700 (PDT)
Received: by mail-qk0-f180.google.com with SMTP id x82so2939347qkb.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iob2ETPL8Rw7bvTyHgetpISrYgy7GWHEmgBjtHA1o1o=;
	b=KkhCEnwoGe3xb/i1kcN3GTNGAbViD2teuIBkwhwI2tm48zaELIjR0QI7enry0QCKA2
	LeNwiDYZGwiUVEAW2CyjhiQZ3t6Get3Xsv/vOev535MQ97k+OmtEttVGh0OJeftusqS6
	VciMHeJBTM/+9YIao85GKb/8jFWS+CcevghZWw6p61O3wAOMTF6LnaDhU+mXWaehiFsY
	PF/T6/+KYiKA9iqrO57tewm+KZYJhyRbZiUaF+NMeAeoixQ66J3/ZP1TOi8EnsZ65oMV
	ibrTuLm7sMVZ3mJxfM9ooVjwjQsbYQBQWk7r4qbKH43mDtTIfKA712XVNqYZZlFQUrxz
	lDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iob2ETPL8Rw7bvTyHgetpISrYgy7GWHEmgBjtHA1o1o=;
	b=rBPihmkV80PmKWKeb+bz/Mv7opscudkr1uwquwhTZ2R39P6xbWFS0Bs2LRF8ONqOt3
	vzwHc3yyGsie7yTmNXlr0XqMBkqlYlaLbwLPniRHNAX0sfgUZZgEsq2TJRcBDEJDz+j2
	oQpd6r48Ljk6Y10Tc3H6nmn6oS2fZaAp+W4ojTA7pLoUyTUFbEbxEa3fu89m/eNRNAr6
	1CO16tfiXOA7A4Zm7fPFodKI6M2vSdExeAbQ5gYlYD/PfNytQkw44FLKV5gxN8uY9qXx
	LlnDPrMz3Bs3PosfJSAAAtGaJQ29ZKs0gfYXsCTIkYqy1YAU0KGVqV0ToWa1BeM4S0OL
	3Qew==
X-Gm-Message-State: AMCzsaX2hAheYUW+S8FJX98GSXN2b7joLAIwcgnVY6sAAxflLOoWCLiI
	zPCQF4YvAgNCu9n0ElT5l5sRuVDep+IQECd/XLQ=
X-Google-Smtp-Source: AOwi7QAluiDmCHGdBPuFZetOP3HfC7826S8RaFCHl6V/p09wG0WQQuVTYb8w7R6nAaI5g/ZX2jsI68cynR5ySR5d+LM=
X-Received: by 10.233.237.193 with SMTP id c184mr17834327qkg.265.1508260345845;
	Tue, 17 Oct 2017 10:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Tue, 17 Oct 2017 10:12:25 -0700 (PDT)
In-Reply-To: <1508256804-4341-1-git-send-email-dariusz.pelowski@gmail.com>
References: <1508256804-4341-1-git-send-email-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Oct 2017 13:12:25 -0400
Message-ID: <CADkTA4NPWR1Yjnt-2mx=FxRRBj3O5U71tETOtATPiqH4VP8RNw@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] vgabios: don't override the compiler ldflags
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
X-List-Received-Date: Tue, 17 Oct 2017 17:12:28 -0000
Content-Type: text/plain; charset="UTF-8"

This needs a long log.

What issue are you fixing ? What arches is that issue showing up on, etc.

Bruce

On Tue, Oct 17, 2017 at 12:13 PM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> ---
>  recipes-extended/vgabios/biossums_0.7a.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
> index 10bd014..e66bade 100644
> --- a/recipes-extended/vgabios/biossums_0.7a.bb
> +++ b/recipes-extended/vgabios/biossums_0.7a.bb
> @@ -20,6 +20,7 @@ do_configure() {
>      # Don't override the compiler or its flags:
>      sed 's,^CC,DISABLED_CC,' -i Makefile
>      sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
> +    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
>      # Supply the C flags to the compiler:
>      sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
>  }
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

