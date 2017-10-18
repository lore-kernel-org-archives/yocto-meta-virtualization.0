Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FF7FE00D33; Wed, 18 Oct 2017 15:25:48 -0700 (PDT)
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
	*      [209.85.220.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E294E00C96
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 15:25:47 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id d67so8220197qkg.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Oct 2017 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ustgf9YARM/Aj/6g4M51N80m9R/aFxlkkqjB/sn2uaY=;
	b=nJ/28Ow6dGwKh0GgSxiiEvflYRuaohasUHKixwdMm3w/bJeXQes6/EOc930Ksfxh0C
	RvdLSLlKmWxv7nwkXcodciflT07WVqd6W+2xUhdJNggGWgmEd+Pn53th6q5z0fz+mlob
	EvLVIbIW9V05vecCVQvQxfPCiOTEk0ZwH2aPEtKlemhQ4Er8047mZog95XPqmlPzaOl6
	gcbaBelG8ht/CiQ0Ci/szkkGBDKWHFmDCyV6vSdXWA0jFXnHwTUa6NRRIrBxZeEp+ATG
	iK4o44uzPm19bB2PGq4noLkfSyn3uqMlRKjzVUjlDqf3+MpXLu9mlf7BDUv9zXR11sIq
	M7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ustgf9YARM/Aj/6g4M51N80m9R/aFxlkkqjB/sn2uaY=;
	b=ZxTW9+BM390YuAsKLRdCWedHa+h7T6jlGBbjxLlSxaEbIf7L+ZrR1+IOn1sCyhETJh
	9NYOlkbyYPucRw2bkMax+aPTVV+J1ERfrHHB18+NnOUZsKO2B9ZmIgb6WfYzdVC3CKor
	ue76+KcCMfvTJ7tltjMHrQtFbKGCRF3lYocxdUyFAV/sO64YuYZaADUfZeCC3iGKp+8v
	SCz/RjjOHEU+aGavAhhk06CFA1jvoU9vKg5c5+RsRr3prpRRR9X5JDA1KBZ3w7IXnN37
	60JVO6OYYInAzeahnMPioGtZtx2wKtVWs3E1zvsN1duMbe8HauPWN3zqXWCIz0Qte/7L
	a9eg==
X-Gm-Message-State: AMCzsaUkUP4jN6brS2yjp4E+tU/g5uhabWcYnkvWthIQGQu0oUosRIah
	zXIp+jkSwVqQKPssDqylqTpgjFwI3JTF6EP6Xew=
X-Google-Smtp-Source: ABhQp+QHa7JLanSLAicJmnT6Wrg+wYuGfhYmH9/EW003WviCj7tqBPYa/dhh+mr/nneWgoOhdIX0pemLoxojw1aNfaI=
X-Received: by 10.233.237.193 with SMTP id c184mr4251262qkg.265.1508365547149; 
	Wed, 18 Oct 2017 15:25:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 18 Oct 2017 15:25:46 -0700 (PDT)
In-Reply-To: <1508350380-4449-1-git-send-email-dariusz.pelowski@gmail.com>
References: <CADkTA4OK6iVbakeNM_17Fw20wG_am-YQPLQ3yBho0nFAAF3GCw@mail.gmail.com>
	<1508350380-4449-1-git-send-email-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Oct 2017 18:25:46 -0400
Message-ID: <CADkTA4O2Jdu0vj8wfLVALAbU5rwpAyq1Mo5hVCN_krP+1nj6eg@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Oct 2017 22:25:48 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Oct 18, 2017 at 2:13 PM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> Fix for building biossums on genericx86-64 machine, due to QA issue:
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> '.../0.7a-r0/packages-split/biossums/usr/bin/biossums' [ldflags]
> caused by overriding LDFLAGS variable to empty value in project's makefile.
>
> In consequence there's missing LDFLAGS settings from bitbake (including
> -Wl,--hash-style=gnu, which causes showing this QA).
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
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

