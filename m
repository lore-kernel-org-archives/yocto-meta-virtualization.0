Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C909E008A7; Wed, 21 Jan 2015 08:12:30 -0800 (PST)
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
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7146EE0080C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jan 2015 08:12:26 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id z12so19422531lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jan 2015 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rFGI+WHtTNLSEL8sqNP90oqqfYUw5YtIktASb8FjSno=;
	b=oWjaqXfuRR5D4zdHrHKBY5r/5iv0M+uGzKtW1DKlVKHnjyyQCQBoTwED4DHH1xpZ7E
	dvsd7mhL4ghrl2REwaaEqpGoPb2s724+80W4QQOosXy7DXn8yjWn+FqSeTSLOzPEk5Jv
	qg89YOPPeRnMrBTDHPK4X5afewaxR6b6pNzhgWhMDMkg3gQ88fErmeqEbM2Xe1nCOsO+
	bbSbWtVkYetYiH8TRA0NUvaO3HEoftBC9BahvBl6j7iXrJfwU88Asb7gts+kxHRjYEjR
	zHYj4EW16wa2sC3vkjvCIoMKEH8hYn38gUnuEeoHsvlN5l9HMsqk/yYsU8fqZuAsAXeO
	NRkQ==
MIME-Version: 1.0
X-Received: by 10.152.204.67 with SMTP id kw3mr21947862lac.92.1421856745224;
	Wed, 21 Jan 2015 08:12:25 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 21 Jan 2015 08:12:25 -0800 (PST)
In-Reply-To: <1421800370-5737-1-git-send-email-biannm@cn.fujitsu.com>
References: <1421800370-5737-1-git-send-email-biannm@cn.fujitsu.com>
Date: Wed, 21 Jan 2015 11:12:25 -0500
Message-ID: <CADkTA4PJRsoNCn7grKbH0Zh7GQTHbJ=K3GmEj1fcTmpZdM=qJQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-openstack][PATCH] slop: checkout v3 branch to fix the following build error.
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
X-List-Received-Date: Wed, 21 Jan 2015 16:12:30 -0000
Content-Type: text/plain; charset=UTF-8

merged!

Bruce

On Tue, Jan 20, 2015 at 7:32 PM, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> slop: checkout v3 branch to fix the following build error.
>
>   ERROR: Fetcher failure: Unable to find revision a009587ec2c0cf07b38bd8f0b59baa244fdbce51 in branch master even from upstream
>   DEBUG: Python function base_do_fetch finished
>   DEBUG: Python function do_fetch finished
>   ERROR: Function failed: Fetcher failure for URL: 'git://github.com/leejarvis/slop.git'. Unable to fetch URL from any source.
>
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/ruby/slop_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/ruby/slop_git.bb b/meta-openstack/recipes-devtools/ruby/slop_git.bb
> index eff1bee..c77785f 100644
> --- a/meta-openstack/recipes-devtools/ruby/slop_git.bb
> +++ b/meta-openstack/recipes-devtools/ruby/slop_git.bb
> @@ -16,7 +16,7 @@ SRCREV = "a009587ec2c0cf07b38bd8f0b59baa244fdbce51"
>  S = "${WORKDIR}/git"
>
>  SRC_URI = " \
> -    git://github.com/leejarvis/slop.git \
> +    git://github.com/leejarvis/slop.git;branch=v3 \
>      "
>
>  inherit ruby
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

