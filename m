Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89BC7E00A85; Wed,  5 Sep 2018 13:43:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA3DEE00A54
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 13:43:18 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id u83-v6so7385181lje.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Sep 2018 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=POgW6RHH3vyALrPM7P7oxI7z4g/atpV7I1g1bSEA6p4=;
	b=j1DxtKB6vvHF4yhIrgDvKc6jPffTeKEZs/zX1ZF7uDAtL9yQTzSjnKwV9bQqhLGE8J
	IgzZFO+dyl+JdmY5BacJWiYQGnS5I+6vSW4voD1mR+Y6XBcZrG4JpShoLQQp9Iz8JyL6
	KV46cOfI2pDZdMDewx9UlR4bMdXtPO5fP1tLGlhaUKl9Aq0+V2m/mmMILSbKIhlkGo8T
	g7+uhhVOOfpLR9b91CkDJ0/PDzr9708HSmYUZtv0zgX1/T4WsX5BQGgVPenp35SYcP5N
	A5gDvFmtAnrrx+aIx5PfsW1l/OgCUpxpYNFw5LYC5I6MusaAjowp08UzBjQR9dPcneTb
	pqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=POgW6RHH3vyALrPM7P7oxI7z4g/atpV7I1g1bSEA6p4=;
	b=XIHwzu+ywt4xK4rynTEQ1aPyTxYZgXTPu2H+aAp7yCGbI3DJT6lRlFvhPrTonM+ud3
	E5w7v2uGrFcS8+o3PlzS0ktdUBnEJR81EqomwUonVi+dAGwmN8mVrsDq1YLWFK3z3w+M
	NT0QItNafLf3NX+FA6upefTzhGKCc2x8ZOm/eH7iww2JrDenjwTjjoc+K+A/L1UHNU6v
	PMHi7bWD09MwWTXH+oQodsMDUETK4T3ssXwsVxugKMCrPeQ9POW2F0iHxWn+wWlajPmY
	5Jh4OWOK2ysB9CVaWdH0nQY4cIB5mmQZ8D+EBDL0CJrWzgEO/HhIzr4nDiIAQXBRZnqm
	sX6g==
X-Gm-Message-State: APzg51BuYlmI8vLyy/rMaa01MdSpifrYg5aqe1WuSbIJSG8K/LUSZXHv
	y7GnawMNhsWHlbyqP39J9ghHa+j2NTRu+lvoDGRrcQ==
X-Google-Smtp-Source: ANB0VdaBmM/dI4vQH3OlugNQ/jvzLV/0OYjscV5f+QpGxcvSxBe5f0yd9FB01mnUazHyMp0d+qyhiOYqFQAbk0yC8AM=
X-Received: by 2002:a2e:84c6:: with SMTP id
	q6-v6mr16263103ljh.65.1536180197680; 
	Wed, 05 Sep 2018 13:43:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 13:43:17 -0700 (PDT)
In-Reply-To: <1536029271-11750-6-git-send-email-Qi.Chen@windriver.com>
References: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
	<1536029271-11750-6-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Sep 2018 16:43:17 -0400
Message-ID: <CADkTA4O3Z3YjBGGb4hNUPBLAv2+hy8_T6ckfq13Er2OcZnTL6Q@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 6/6] layer.conf: depend on meta-webserver as nagios-core depends on apache2
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
X-List-Received-Date: Wed, 05 Sep 2018 20:43:19 -0000
Content-Type: text/plain; charset="UTF-8"

But nagios won't always be installed/used, so this is not a hard dependency of
meta-virtualization.

So while I don't mind this going into the README as a depends, I don't think it
belongs in the layer.conf.

Also, can we have a README for how nagios works, and should be sanity tested ?
As it stands right now, I have no way to know how to build and test it.

I'll wait for a v2 with those changes.

Bruce

On Mon, Sep 3, 2018 at 10:47 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index eaef1b7..ad2c96e 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> +    webserver \
>  "
>
>  # Override security flags
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

