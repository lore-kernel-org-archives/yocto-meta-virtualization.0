Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05211E00876; Tue, 30 Sep 2014 21:59:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.170 listed in list.dnswl.org]
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76743E0079A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 21:58:59 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id u10so49565lbd.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GplywZ9aMqG8twun0kuYxgpH5YKY1l7Rpa8uomWglbY=;
	b=bgLS4yElzv8Ianmik4f3NX8ltuCHv+jnt3nVEQNrIP5EMoreNkLf3oO/zKXk4MGauj
	cIMvQp7kugxl4/6dek54X8wCXJm8rrSsXEsA4T0kd3LE9IDpqOT2LlsBtkMUkeJj5f0o
	wj265ZJcFIlb49/kKIFwsYHuHZ/4ULoophhXxL4z875pThENXZM9PIfMXWRyfU8UDEwB
	Ukv2L58JNEc9UshVNNjOBw8ZbR0zhU1d6iRybQw3VNH9LjUSXrIRSpswN3CttfDpMbAy
	AiweLCOhiGSMh86VkY7mlYJvs/ZmdQ3+9kfQiZ4/PJ8qpqpHgVE+QE8wHqYEgY8v1lWB
	kykQ==
MIME-Version: 1.0
X-Received: by 10.112.134.229 with SMTP id pn5mr23249248lbb.22.1412139538528; 
	Tue, 30 Sep 2014 21:58:58 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Tue, 30 Sep 2014 21:58:58 -0700 (PDT)
In-Reply-To: <1412082675-11981-1-git-send-email-josep.puigdemont@enea.com>
References: <1412082675-11981-1-git-send-email-josep.puigdemont@enea.com>
Date: Wed, 1 Oct 2014 00:58:58 -0400
Message-ID: <CADkTA4PHMgrC6BZhBgdb8NoVN3Dbzb1-uHfpE5HwfawJndsvSw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: build API docs only when required
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
X-List-Received-Date: Wed, 01 Oct 2014 04:59:03 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 30, 2014 at 9:11 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  recipes-containers/lxc/lxc_1.0.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
> index 04c027d..232a3d0 100644
> --- a/recipes-containers/lxc/lxc_1.0.5.bb
> +++ b/recipes-containers/lxc/lxc_1.0.5.bb
> @@ -38,7 +38,7 @@ PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '',
>  EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>
>  PACKAGECONFIG ??= "templates"
> -PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
> +PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>  PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> --
> 1.9.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

