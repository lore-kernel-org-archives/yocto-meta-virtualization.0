Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E134E00A54; Thu, 11 Oct 2018 11:34:16 -0700 (PDT)
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
	*      [209.85.167.45 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5E78E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:34:14 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id o21-v6so7469523lfe.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QJD/uG+y2WJ7KzfHdeQBXsoNiGCa43QYRn77AeG62Fg=;
	b=CxyNG9hxriLAkRXW6BpyBImPL6/3GD2WhCnWMKcGMwHUTymabPaWoil00Azed5pay/
	NZGulemyTlShPM+zqKA5v7qgDtI3Z0mRT8Tih6XC4obLL870e2uEU40JICqTPOKwj8Lc
	Qz7q1PU5U0OtR8wtGEhq4O62FBhIfXN1wUXxXPyutYas8iy7tJwFZfZS39k41Tamzv7h
	7BMz+W5G1JgKwbeW/id5IW+E9BXgvvvOFHF2Di4eIonWmB0n2cCXdKwqsnlViMrQ0iyB
	CDnm/Ln9x/MlucFdTxaojlMpYNXaHoLUAYJ1ConEmYAelJulCKCcst1qTdlznHeioFhK
	bX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QJD/uG+y2WJ7KzfHdeQBXsoNiGCa43QYRn77AeG62Fg=;
	b=Dw49/oUbw6Szcrh2+ueGKBvYA5NXl8KwAIQmTUZOh9tE19+2l2pvIURZ2q18bZ4muX
	MiQUhEaDMcPUzGzQywsibG0KcUPD76c71i9XHl4lTyA2QB2l3DOpHhNki3YWXa9/y+CL
	MFtcEAv5/b47LuPnS022Xu9A31pV33ylAEXb0ooAd9k/svP4Bc7UYr+eE8T+pgNFPTMQ
	TcOcLLhRFgg9yWsV2X2Q45jyX7tDvvbLNHYxr5qGWP0mL22RccpOkEUo58VtbwPsOWvc
	zup+uOynptK6xMhn6qrcYsr09+qkC3z9LZejO9i+c9iRa7I9MSd8ntvAHPG/Z/bCUTdk
	havg==
X-Gm-Message-State: ABuFfoiIjhThP+hmAP+8F2f0xB7frOMZHj73+4WMQ61zr52h4cUqkgOR
	lhIDW52NtVtIWGwtvn76fyXICwk9FEX7qvpAhEw=
X-Google-Smtp-Source: ACcGV62Tnup2YSzq2ArXAV1ojuHS+GXTAMKU99TKoJ6CraCJ4/Moi+l2N6o+5vjhQeW92J/jCYg3c6VlFuftfsKZSfc=
X-Received: by 2002:a19:504e:: with SMTP id
	z14-v6mr1891410lfj.120.1539282853481; 
	Thu, 11 Oct 2018 11:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:34:02 -0400
Message-ID: <CADkTA4MC3LzLWYiThB6NLFRfNzVTxyzhYymi-m-VfSM4HK-NFg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH][meta-cloud-services] consul: add INSANE_SKIP for textrel
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
X-List-Received-Date: Thu, 11 Oct 2018 18:34:16 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 2:59 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. for i586, bitbake consul will have QA error of textrel.
>    consul-git-r0 do_package_qa: QA Issue: ELF binary i
>    'work/i586-wrs-linux/consul/git-r0/packages-split/consul/usr/bin/consul'
>    has relocations in .text [textrel]
>
>    according to go doc:
>    -buildmode=pie
>    Build the listed main packages and everything they import into
>    position independent executables (PIE). Packages not named
>    main are ignored.
>
>    checked use command "eu-findtextrel ./consul", functions not
>    compiled with -fpic/-fPIC are from packages not named main, and
>    also not imported into package main.
>
>    so -buildmode=pie cannot reslove this problem. so refer commit
>    b689c72a of oe-core, just skip it.
>
> 2. This problem is caused since security_flags.inc is used by default.
>    so alternative work around is:
>       SECURITY_CFLAGS_pn-consul = "${SECURITY_NOPIE_CFLAGS}"
>       SECURITY_LDFLAGS_pn-consul = ""
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index a44e0b2..ee49c5e 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -23,3 +23,6 @@ do_install_append() {
>  }
>
>  FILES_${PN} += "${systemd_unitdir}/system"
> +
> +#for i586, executable consul contains textrel
> +INSANE_SKIP_${PN} += "textrel"
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

