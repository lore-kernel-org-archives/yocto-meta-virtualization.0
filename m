Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49E41E009C9; Fri, 23 Mar 2018 14:12:03 -0700 (PDT)
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
	*      [209.85.215.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A503CE00708
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 14:12:02 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id m16-v6so16486475lfc.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=70uYf1wzJLAsUxftB64BYIeD9FlIXXxAMVMSLsWgdmM=;
	b=pVYKQ5c4bXCjIcBCkRc0BaRgKyCux6XGn4rDAmjYICUk5iQ2IBD9Z9NCSeCFELAjkU
	CUhl5cqqbucQXTGvgLFscioBL/haE5k9DN807gT28yQErPRHEOIaIzzMe8VXcTVAA0LV
	BGo4iZYaFo1RcfCLOwYhmLKRl1z/774OvqBvtMac+9I2NvwWS3JgC7etbC0sG6hnkpW5
	Z369FQgYQWDh5m4HOaZ/WGd4biqOD1suh4/q/HiDWgT6Dcxp+k8LCoFPrE1fMei/91nr
	CH6Ee3IliDFpvU4TUtLDQDr+l73ymlCXAim3j5D+R9Z5oaLus6w31qrnCN7wSN6N3yFX
	Pz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=70uYf1wzJLAsUxftB64BYIeD9FlIXXxAMVMSLsWgdmM=;
	b=ahe8jNlLp3QGq7TcSJ92eJax34R388ERaA48B0bjZY0EQcL2XG+xsu87cWlvIRDBMn
	sRzWgrwiWz8bTahtB+PwBQApCu1ZefobtEpa8U1Ukhpdj0ZFlnYIWVaWa0xzkuzIl0QL
	r4A4IpeU9cVSZM2YbhayYIV9ABGfnlMFNljVOJy9SGLzU+D/zGYGJ0aDzvJITv8XZK/a
	HclQREenuGD9myznNTfwREzQJUcKgaFb3sCx5nJvY4A+oPPvDNXBx7/IYOVLuNrZRTI5
	kgT2SMJRK6SzYR7DlJkl0NwuqSJVKzWyOxetKTHdCbFC8n55wdt1odEq/FWwfF6RjzYv
	BQkA==
X-Gm-Message-State: AElRT7FsfAn7xEmYxL+OCnj/xhSxIfH3POQALlC9j7t6wWO/p21pAvA1
	aWyo8J98j3ixqgpQPMdz1KAXQR2Etr1sUaBC3QGJ3awh
X-Google-Smtp-Source: AG47ELtrPu4S6OnLq/liW1Z7G3d2ueECABVRUtLzsaOJJtURZRcHTDjzPPqu02W7D5a+F/TbNmGNHZ+diWlMgZqzdY4=
X-Received: by 10.46.25.83 with SMTP id p80mr20014399lje.142.1521839521359;
	Fri, 23 Mar 2018 14:12:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 23 Mar 2018 14:12:00 -0700 (PDT)
In-Reply-To: <a7b9bbec9718fc4325304e3656a0013d@mail.ecognize.me>
References: <20180323195016.30251-1-elfy@ecognize.me>
	<a7b9bbec9718fc4325304e3656a0013d@mail.ecognize.me>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Mar 2018 17:12:00 -0400
Message-ID: <CADkTA4Ns0e4jnTmKjNKvvwUT=pOZRuXzO1e5=EfBa_RuQizYfA@mail.gmail.com>
To: elfy@ecognize.me
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] New URL for go-fsnotify
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
X-List-Received-Date: Fri, 23 Mar 2018 21:12:03 -0000
Content-Type: text/plain; charset="UTF-8"

This has already been fixed:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e63819669747585baa0284528ac76bdd34fc9e78

Bruce

On Fri, Mar 23, 2018 at 4:09 PM,  <elfy@ecognize.me> wrote:
> The owner changed the repo URL 3 days ago and set up a repo to break auto-redirects on purpose
>
> https://github.com/go-fsnotify/fsnotify#my-project-is-not-compiling-anymore-what-can-i-do
> ---
> recipes-devtools/go/go-fsnotify_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
> index e5bcf14..1d9fbdc 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>
> SRCNAME = "fsnotify"
>
> -PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
> +PKG_NAME = "github.com/fsnotify/${SRCNAME}"
> SRC_URI = "git://${PKG_NAME}.git"
>
> SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
> --
> 2.15.1
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

