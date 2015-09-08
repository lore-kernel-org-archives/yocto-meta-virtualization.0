Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CD31E00D1A; Tue,  8 Sep 2015 07:03:14 -0700 (PDT)
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
	*      [209.85.160.180 listed in list.dnswl.org]
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 528F3E00B66
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:03:06 -0700 (PDT)
Received: by ykcf206 with SMTP id f206so119768544ykc.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/NpRlHT4N7NOG4PxSpi8uoTc2DTy1ir+h8YlntKIaNQ=;
	b=JX6zrDK9B0AQZZXXUTaglyhQShn7ArioFCe1HaRYyLKG8nxF2JrBlL5v7WzqCVCtUx
	zJg4U5DO5okIqSNui/QW0elBFvk4mVbycmc8u+HNYgo04y1ZUA1NlhZmdq1KmVQAMTL0
	NYa7IeXAE9TP8AJ1R/fqmJJFQDO3TP0UhrTGPpVo+B8WSsD+npvxYbcDEKZjHtvAblDg
	s8CxJpIRoww0F7pMWGv5fWqDU0cTIJZOwoN4jckH/SXD+YgwVjk5bjP1nyv+uJxzfLHW
	1KDfbnL1TW3ATWVZHUKIZsIVAr2XR2SGxVhDMaJDVyuIaAx6I/SINN12KLJONJvb36XW
	ICaQ==
MIME-Version: 1.0
X-Received: by 10.170.196.201 with SMTP id n192mr27005721yke.16.1441720984727; 
	Tue, 08 Sep 2015 07:03:04 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:03:04 -0700 (PDT)
In-Reply-To: <1441310366-6478-1-git-send-email-mark.asselstine@windriver.com>
References: <1441310366-6478-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 8 Sep 2015 10:03:04 -0400
Message-ID: <CADkTA4Mw_36e7EUa=WR=mnuzccc15OSvhEgMJ9KtdDuro2-ChA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: DEPEND on libxslt-native to fix build issue
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
X-List-Received-Date: Tue, 08 Sep 2015 14:03:14 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Sep 3, 2015 at 3:59 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Configure searches for and sets XSLTPROC and will not get a proper
> value unless we have made sure libxslt-native is built prior to
> libvirt. So we need to add it as a DEPENDS. Failing to do this we
> could end up with libvirt configuring before libxslt-native has built
> and installed xlstproc in the -native sysroot, resulting potential
> host contamination or in a potential build error:
>
> cat: acl.html.tmp: No such file or directory
> Makefile:2215: recipe for target 'acl.html' failed
>
> (xsltproc is used in the generation of acl.html.tmp)
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.17.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
> index a945792..d3d7252 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.17.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
> @@ -8,7 +8,7 @@ SECTION = "console/tools"
>  PR = "r1"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> -          iptables dnsmasq readline"
> +          iptables dnsmasq readline libxslt-native"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

