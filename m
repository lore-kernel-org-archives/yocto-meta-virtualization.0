Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E26B0E00E24; Wed, 16 Sep 2015 13:05:33 -0700 (PDT)
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
	*      [209.85.160.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BF80E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:31 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so231620864ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rfuEm3nT4IqvOHypRmkWkV3r3CZiHBbI+Erfy7WoRLw=;
	b=chPHhDzyTi3E4YtMhMuk/OEsEheW8jINKnXP6p19qKG5eBTjWKRooAbKNgyHwQg8w6
	Tfa6/clIG2WojyUnaNdptMILlW1DKazpJOGoodsZgVQFTvXVIraODAEYQjqgh5sCPxn5
	Toskc7Y+Jd2aROxJhAProBNU6NYQ8ilUkINbxvoZFmA6F3hjAjDr2RwxD+BasrFnuaym
	o/AXfH02uhACo6fy0qYBcogRbqcF1eAzfNXNkArhH6A1+NPrGvdha/Kmfetm00DLdrLP
	hJc64gNuAI9PaLh5KkbYEHNIsz1MEBxQM8aQ/ChXc1Ejmcpf8V8Gqyd7nM02MFA+Savj
	SjBA==
MIME-Version: 1.0
X-Received: by 10.170.225.68 with SMTP id r65mr30907857ykf.58.1442433930801;
	Wed, 16 Sep 2015 13:05:30 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:05:30 -0700 (PDT)
In-Reply-To: <1442294286-19952-1-git-send-email-b28495@freescale.com>
References: <1442294286-19952-1-git-send-email-b28495@freescale.com>
Date: Wed, 16 Sep 2015 16:05:30 -0400
Message-ID: <CADkTA4Omya=i01Q_zt=+Rputjf+SmNVHBEN2BFH9B0ghPd+zhw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Liu Ting-B28495 <b28495@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Luo Zhenhua-B19537 <b19537@freescale.com>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] erlang: skip the host library path check
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
X-List-Received-Date: Wed, 16 Sep 2015 20:05:34 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 15, 2015 at 1:18 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <ting.liu@freescale.com>
>
> Move a previous patch from erlang_R15B.bb to erlang.inc as erlang_R16B03-1
> needs it too.
>
> Fix the below error:
> ERROR: This autoconf log indicates errors, it looked at host include and/or
> library paths while determining system capabilities.
>
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>  meta-openstack/recipes-devtools/erlang/erlang.inc     | 4 +++-
>  meta-openstack/recipes-devtools/erlang/erlang_R15B.bb | 1 -
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/erlang/erlang.inc b/meta-openstack/recipes-devtools/erlang/erlang.inc
> index 8dd2478..8a7bd5a 100644
> --- a/meta-openstack/recipes-devtools/erlang/erlang.inc
> +++ b/meta-openstack/recipes-devtools/erlang/erlang.inc
> @@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://EPLICENCE;md5=09f9063ea35bc5bd124df2fda1d9d2c7"
>
>  UPSTREAM_VERSION = "${@bb.data.getVar('PV', d, 1).replace('.', '-')}"
>
> -SRC_URI = "http://erlang.org/download/otp_src_${UPSTREAM_VERSION}.tar.gz"
> +SRC_URI = "http://erlang.org/download/otp_src_${UPSTREAM_VERSION}.tar.gz \
> +    file://erlang-fix-build-issue-in-Yocto.patch \
> +"
>  SRC_URI += "file://fix-wx-configure.patch"
>
>  S = "${WORKDIR}/otp_src_${UPSTREAM_VERSION}"
> diff --git a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
> index d7fd310..68d144b 100644
> --- a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
> +++ b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
> @@ -55,6 +55,5 @@ FILES_${PN}-staticdev += "${libdir}/*/*/*/*.a ${libdir}/*/*/*/*/*.a ${libdir}/*/
>
>  FILES_${PN}-libs-dbg += " ${libdir}/erlang/*/.debug ${libdir}/erlang/*/*/.debug ${libdir}/erlang/*/*/*/.debug ${libdir}/erlang/*/*/*/*/.debug ${libdir}/erlang/*/*/*/*/*/.debug "
>
> -SRC_URI += "file://erlang-fix-build-issue-in-Yocto.patch"
>  SRC_URI[md5sum] = "dd6c2a4807551b4a8a536067bde31d73"
>  SRC_URI[sha256sum] = "5bc34fc34fc890f84bae7ff1f7c81fbec2c9aa28a0ef51a57d7a8192204d8aa2"
> --
> 1.9.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

