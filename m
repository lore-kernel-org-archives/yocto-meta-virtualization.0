Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8020E00DAC; Thu, 10 Sep 2015 11:46:55 -0700 (PDT)
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
	*      [209.85.160.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE558E00BB9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:54 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so67322946ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ks0NglyBpR/RuJeitPhu95vts952TkZI5mF/Dw/6jfw=;
	b=gxDSucV0R4oi/383iT50LUso1VI5Hz1Y8SFZNDtRQqHObJHYEK2MNhf6Qm5ILbRkQj
	A6swqA/Piyp+48yv5ah4RW1S39b7UX2dG5hPBTv0N8YfBoRoC+r3oAQicGE4fFYyPztO
	E/wY4YJKr7AjTNOKtfqeaAXo571U1l21CDzTrw204X8DxVlOIgzBkjIlzk4XHhvhDz37
	UX6kfAQPhkES1YEDkBloWu8O9n0VsmyOiDwe1YiKLdPF0UKzv2nBSBoJIid8cOw8o5Iv
	RwVZp0A7ORDKcBNETVYHFAZTnNu5JAYC8jk54UTvBK506I8Ws4Ae92l07tV59ZRaAVPI
	c3LA==
MIME-Version: 1.0
X-Received: by 10.129.75.3 with SMTP id y3mr48834279ywa.92.1441910814028; Thu,
	10 Sep 2015 11:46:54 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 10 Sep 2015 11:46:53 -0700 (PDT)
In-Reply-To: <1441876545-29061-1-git-send-email-josep.puigdemont@enea.com>
References: <1441876545-29061-1-git-send-email-josep.puigdemont@enea.com>
Date: Thu, 10 Sep 2015 14:46:53 -0400
Message-ID: <CADkTA4MOWBZtym+KX1s8b62wFLMa2wmfNJ+qXzeJmKd_T+z4SQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [fido-kilo][PATCH] dhcp: fix QA issue files installed but not shipped
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
X-List-Received-Date: Thu, 10 Sep 2015 18:46:55 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Sep 10, 2015 at 5:15 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> The value of FILES set in this bbappend was overriden after
> bitbake expanded it from the value set in the recipe.
> This patch solves this issue:
>
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
> ERROR: QA Issue: dhcp: Files/directories were installed but not shipped
>   /etc/dhcp/dhclient-exit-hooks [installed-vs-shipped]
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf) replaces original key FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks                      ).
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  recipes-connectivity/dhcp/dhcp_%.bbappend | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
> index a23f7c9..2babae9 100644
> --- a/recipes-connectivity/dhcp/dhcp_%.bbappend
> +++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
> @@ -12,5 +12,6 @@ do_install_append () {
>
>  }
>
> -FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
> -                     "
> +FILES_${PN}-client += " \
> +       ${sysconfdir}/dhcp/dhclient-exit-hooks \
> +       "
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

