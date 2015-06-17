Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A3ABE00A53; Wed, 17 Jun 2015 13:12:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6768DE009C5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 13:12:10 -0700 (PDT)
Received: by wgv5 with SMTP id 5so46144596wgv.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2s3CzWvFtgvbMMVB70xY5Ze+81OyAGqi4n4sv3iNh4g=;
	b=y3IYpmkxM/N9eo6mw+G+NjcSkgqfOlXhx9oo8nAmGc6n6631uALRvqi7yC+JAc7nr7
	PJPycxU732deDEvmnt8dNwlJL9MB7EWWvI0jLWgesEFC/d2vEH6eYY9DaZrYCmwEQEke
	P1SDCRJyVbJjGH8UyCdBGJWiZvC1qWdETQtV9K7SRWD7yYsinfPc6erQRyAh5vN6DoAU
	JeZ5nlrZWrtEs959aQ6+PnnUcEGUcS2bviPF7wAmc3ZyzUkzCOZpAQ5li+MqT/UnEOXi
	F5di6sy9x5q59uC8G+XmF2a2nJLwK+2VwlD5Av6DgOxilVpBJNGSuvS256shA6mvLli7
	yMgQ==
MIME-Version: 1.0
X-Received: by 10.180.189.209 with SMTP id gk17mr57290152wic.93.1434571928500; 
	Wed, 17 Jun 2015 13:12:08 -0700 (PDT)
Received: by 10.28.129.82 with HTTP; Wed, 17 Jun 2015 13:12:08 -0700 (PDT)
In-Reply-To: <1434445318-2437-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434445318-2437-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Wed, 17 Jun 2015 16:12:08 -0400
Message-ID: <CADkTA4N4ZQ=9WKnvjenbMfiESp5z0_SiecdxHqoAaCQzm_cZOw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-setuptools-git: add native support
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
X-List-Received-Date: Wed, 17 Jun 2015 20:12:11 -0000
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Tue, Jun 16, 2015 at 5:01 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> index 9447744..61408c3 100644
> --- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> @@ -19,3 +19,4 @@ inherit setuptools
>  do_install_append() {
>         rm -f ${D}${libdir}/python*/site-packages/site.py*
>  }
> +BBCLASSEXTEND = "native"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

