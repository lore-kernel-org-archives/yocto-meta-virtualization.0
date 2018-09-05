Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30C9CE00A94; Wed,  5 Sep 2018 13:25:23 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A7FDE00A64
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 13:25:22 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id s12-v6so7397724ljj.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Sep 2018 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TCExem4pf8vRnYjE1IitCbX7AZEUfGw9PaMuO77+Nrk=;
	b=sQnslWMRooQ62qsEqjXPylT74Af3roLZbkDAFUxCHzsDUppovmTrV9hTtxEZ1Chvzb
	113VpzVLDttvW6Y5UMnIT95CJj7pMya0JoFoKrOl+CMlxk3UkRwbuZoKH1mVa80X21Kb
	kTIH9CBTVQcKS6ohYvc2HvwjdA7mHl3QNCu7VEkTW8CJC5HlpqEl8XPqzAbDeaVlQ5J6
	ioa0UObHf+X2VjSIgrv7tn+Y/+TxAGinGmXL3HglRem8uZLHdFKEe1UcZvzoty8pRVpN
	CNBO3NgubEGEPeV7JE8OR35OUYjw9B6YjUw56MoktEF8iLp+Od+gFe7xcPJUWUfMG6yh
	8h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TCExem4pf8vRnYjE1IitCbX7AZEUfGw9PaMuO77+Nrk=;
	b=uX1KdUvhDOLbd72nqQx8swL73E5pJAJ7llp0FzgdC9RoXViS/CvkqDgLGk1gEiKftV
	PGIVE6c4/2Vgai0ynNwPLM4cbSxq8MFBUCb8gtGAUVV9HCCvnPoeWfzi03mqqsjFCH19
	QNC7kr/yFwg37tBaEixVHMIF+WKSrkKSSrVmkObINw+vGCWSGKKw1LljDERY6cb/pm9u
	nz4GcKlms4yj1MXkCp+zjl8bHK67T7dvi6KpwTj3RqWxeRtajDCtg6zq5u/DiMHswWzD
	qgoaZGSivzpGpKYGK7ZYHQjk8Iop59vUUtQWmO1c7noWL0C5heki7y6Z7xrqCwuS7C7d
	Rr5Q==
X-Gm-Message-State: APzg51Bu3Tq1xWDjlJD92oyjpavdqRjzSBqFEVQzV5cspm5ADvBWircn
	VxpCwQol1FmQmxeE4wJWhKXziBprBlsS2b/fy9g=
X-Google-Smtp-Source: ANB0VdYIwbEcfQrO/671bJSXNd5MGHgimINq5W2Z8IHGog+uXKvh7PYHjVef4lJ3j9XLkPQFf4vRDSsu1YQ8GT1HJto=
X-Received: by 2002:a2e:800e:: with SMTP id
	j14-v6mr5690200ljg.114.1536179121260; 
	Wed, 05 Sep 2018 13:25:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 13:25:20 -0700 (PDT)
In-Reply-To: <1536150724-171359-1-git-send-email-hongxu.jia@windriver.com>
References: <1536150724-171359-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Sep 2018 16:25:20 -0400
Message-ID: <CADkTA4NotZQPS32w+R9YMKQOipohk1Mvex+O0y+WdtyH1Gj88A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 20:25:23 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Sep 5, 2018 at 8:32 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Since `229f4e9 package.bbclass: add support for
> pkg_postinst_ontarget()' applied in oe-core, use
> pkg_postinst_ontarget to run postinst at first boot.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 70ac5bc..8aab739 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -134,22 +134,13 @@ do_install_append() {
>         cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
>  }
>
> -pkg_postinst_${PN}-pki () {
> -       # can't do this offline
> -       if [ "x$D" != "x" ]; then
> -               exit 1
> -       fi
> +pkg_postinst_ontarget_${PN}-pki () {
>         if test ! -d $D/${datadir}/${PN}/pki; then
>                 ovs-pki init --dir=$D/${datadir}/${PN}/pki
>         fi
>  }
>
> -pkg_postinst_${PN}-testcontroller () {
> -       # can't do this offline
> -       if [ "x$D" != "x" ]; then
> -               exit 1
> -       fi
> -
> +pkg_postinst_ontarget_${PN}-testcontroller () {
>         if test ! -d $D/${datadir}/${PN}/pki; then
>                 ovs-pki init --dir=$D/${datadir}/${PN}/pki
>         fi
> --
> 2.8.1
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

