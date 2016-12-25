Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44E6DE00726; Sun, 25 Dec 2016 10:07:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7953E0071C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:07:10 -0800 (PST)
Received: by mail-yb0-f195.google.com with SMTP id h184so5610125ybb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=apaQyR+HTmCFCyDWt1UkDhYro5gsh65ERvUf/2WThmk=;
	b=B8uMolffp2NYpR34irOxmrWbDUeT5FG5Eq6Vz2d1MhvPxEVg95G4xWallfRvZhzMbw
	XnnSH6SpZYUREZr1rr3hFUaWo1FFdbIJ5BRMlqPNBrI6tsMlp6RyT2lSeto6dIskRn6Z
	MIjsq1DHETuXwTZiLbzSbQDowz4WV2JN3Xc1H6zU1sjrH0StwQ5bUzTuWgjvRJ8yO1Cy
	QupRtvx7s7r3kDutRt+tjFidgQdzbmcsCKhNqjiSQbZapESzDtah2BzHRn8Mo3fesEDE
	M3mcQzDV3uZzB7yVqh693Y4zopboLZ0fJP5orzAsZL1wbZF4s/zkXEF6jtem9hCz2NcU
	AGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=apaQyR+HTmCFCyDWt1UkDhYro5gsh65ERvUf/2WThmk=;
	b=igol2IYSQ2wR/iAx59kbgR4+Juv0ECq/CmfT4hTA46hmHc26rwv4X79GgL0ToTlmsR
	iC2+n94EJpVHDZ8ZiwgtT7Hz6gC8r3FhpbGUNuObCTpUqYs4nM3pdioENzJshkFWUm+a
	4jpFLJKjKACurhlMneXs8GPBdHlimSTUVxWASg9n2Ximfn/Ga+5kJvbXlOgyjE//3h//
	xXJ8sBNXpslDjjYvnOAiT1HiDYtDpFVdnkzWNgkt7c8iv85QnuMlIu/8FhLQgI9DjfqU
	5pO9RU4AxGepENMuRs0SFkkN4KMRyzL2XYhcY0ZCCGe4MWkMyUT1Tx+Skb1/0zmFjAs2
	CKBg==
X-Gm-Message-State: AIkVDXLv635smMnvwEjs5DUmditruRYU0ZXyeUT/m/L1xjykYh2+TNKW1BSi9Y7HH+Up3rg412wXlaq4b31RSw==
X-Received: by 10.37.29.131 with SMTP id d125mr17294281ybd.89.1482689229532;
	Sun, 25 Dec 2016 10:07:09 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:07:09 -0800 (PST)
In-Reply-To: <1404741470-4980-2-git-send-email-Alexandru.Vaduva@enea.com>
References: <1404741470-4980-1-git-send-email-Alexandru.Vaduva@enea.com>
	<1404741470-4980-2-git-send-email-Alexandru.Vaduva@enea.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:07:09 -0500
X-Google-Sender-Auth: wbGqnUvXWqLCUonthtcLd_EcBC0
Message-ID: <CAPuovEJhj8V4L7VEBxQUhyTdrYD5y-UmUCHzaZOEoi+MqLUFag@mail.gmail.com>
To: "Alexandru.Vaduva" <Alexandru.Vaduva@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] multipath-tools: added support for autotools-brokensep.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Dec 2016 18:07:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 7, 2014 at 9:57 AM, Alexandru.Vaduva
<Alexandru.Vaduva@enea.com> wrote:
> Separed build dir caused problem, the autotools support needs fixing.

It is best to take the time to describe the problem in the commit log,
no need to keep it a mystery.

Mark


>
> Signed-off-by: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
> ---
>  recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
> index 633b9f2..e2076d3 100644
> --- a/recipes-extended/multipath-tools/multipath-tools_git.bb
> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
>  SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>  PV = "0.4.9+gitr${SRCPV}"
>
> -inherit autotools
> +inherit autotools-brokensep
>
>  EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

