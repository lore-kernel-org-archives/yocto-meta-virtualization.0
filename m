Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31C86E00CD4; Wed, 15 Nov 2017 13:01:07 -0800 (PST)
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
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6358CE00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:05 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id n61so37572215qte.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eTDKKy4vUXtwOAjlo+taGQtOBiCESjTOkAxYtAfNOAg=;
	b=H6Ouf8EQUKvNoMRN8rDJaLxxjQAeM8rMH4utLaDBx9QCKssr7Tv4zV6JLxsGUey5UY
	yPo/DxtB2UCumaeOYxI4FfHNNGmN8P1jgJuOOZ9aAPRZspn24GdABbhcWfznEIZKeq8J
	TZzu6Rtc1EGWVsza9D2nEcz42vgIXM+8A0VpRZ5Nn1pMEB2NJlsx9/XAkOIiC+++HPDn
	ZbBQqNMnxTxEywJum/Av2fr/hVsYwkJD1Zr7oVLGKXSQx5oB1hkaNwVqeshGvcM5Aw+u
	WRkyrgGvkQ5i8TuIDo0ffa4K/DWzzd/1Hsbg1dN+Dz7uJKbA2Fis+TtN2KApyZyeBqln
	wtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eTDKKy4vUXtwOAjlo+taGQtOBiCESjTOkAxYtAfNOAg=;
	b=XpB7q2/a0VrrsvT4CAoFWucnIQuIxRDbrXfV7hKx51Zq7x1qUnN+GyTVmYbi6/WTbR
	O+SEgw4uxK6vNafhPKqkNNdQxxJTGM9n9h6q3iM+rusO47DuC3ugxE5etIPjn+xCRgi5
	8rHd6+oOzsYkAApmoPEd3BmQkzTfGBHw4pOKCgeRlyH66YiTmuW0moB9z/KH9gESER5m
	tQtZfJXk6ZiAcVfM1VCiK7BjlXJJhw6ACzgpnnHNjCj4RqptPGp+MNSj+7Ba1X3A/rZx
	WPAqt6WX3KgA0kX9S0GPC7rFJArU7FFR4qDdlbYAV4Sx1WH5I8Ac6pFZH7PbI5pyUY18
	Cxig==
X-Gm-Message-State: AJaThX5pBcK1faPnYvLmZDY1Tyb5McFnC7/mCqX3NWL5uQ1SUAVdNR1p
	6NYvLp3wYrI7tjoSP8idDm/j2hmmA4AFdpJm5gxTGg==
X-Google-Smtp-Source: AGs4zMZJOkwstTqiXVGa+9XTVnuM5vfBddsAeEaBjOhdZf6OBJTacOEP0AuBpEjUcgvot2057MQuHQbDHyi25OWfI7Q=
X-Received: by 10.237.62.67 with SMTP id m3mr13367572qtf.289.1510779665473;
	Wed, 15 Nov 2017 13:01:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:01:04 -0800 (PST)
In-Reply-To: <1510682289-23325-1-git-send-email-mark.asselstine@windriver.com>
References: <1510682289-23325-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:01:04 -0500
Message-ID: <CADkTA4NR4r=cia3WxKt58_mxfhGt1vG4i-gggcofvDHYPShX5Q@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] README: Add the '-M' to the 'git send-email' line
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
X-List-Received-Date: Wed, 15 Nov 2017 21:01:07 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Nov 14, 2017 at 12:58 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> To make reviews easier and to be consistent with other patch
> submission guidelines in other layers, add the '-M' option to the 'git
> send-email' line.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index 7d84232..d653f11 100644
> --- a/README
> +++ b/README
> @@ -64,7 +64,7 @@ Maintainers: Raymond Danks <ray.danks@se-eng.com>
>               Bruce Ashfield <bruce.ashfield@gmail.com>
>
>  When sending single patches, please using something like:
> -$ git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
> +$ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
>
>  License
>  -------
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

