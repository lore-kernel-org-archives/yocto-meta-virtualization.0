Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AD0BE00A7D; Mon, 10 Aug 2015 06:54:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.173 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF0B1E007B1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:54:55 -0700 (PDT)
Received: by ykaz130 with SMTP id z130so32245835yka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SAgTs8VmsVF4QzabdWYirwtpn47xeIqL/BIkThLWFSQ=;
	b=L+czxku7KnIdnEBjf1ek8FYvuNGXupQD6pfZibDx8SDKAu0kmDa6jJBFj2tLsLdTHk
	yRnQZ2wwZl622RnFsSIWkHc/YME0L8KwtMEjAfPiN4XIwpzSpPrHluthGLL+nfVBXfxS
	+rwp+Lf6qeRONbpjsygbryzhJN1W6CMdfg9ema3YHRPfRTy2AB01YSwbLeQrzUIUFfpg
	UPo3AIVWlR14zlHDGFLWTSbY9VcHy3N1ED6lizB6Q+Yho958sKBjVjp45JsbslOAUk0X
	2MsmQdNH/Hltht6V2L0aHYD+SiSX8R/zXtGt/VYC9PWsoTss61riohM4wyR+1xb/lAqb
	AmSg==
MIME-Version: 1.0
X-Received: by 10.170.74.130 with SMTP id q124mr21270805ykq.21.1439214895200; 
	Mon, 10 Aug 2015 06:54:55 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:54:55 -0700 (PDT)
In-Reply-To: <1439206546-31385-1-git-send-email-noor_ahsan@mentor.com>
References: <1439206546-31385-1-git-send-email-noor_ahsan@mentor.com>
Date: Mon, 10 Aug 2015 09:54:55 -0400
Message-ID: <CADkTA4OfqqDHHmDhfs91J7fqps3d3PDXKNkO5B1ENe_k0J35Yg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Mon, 10 Aug 2015 13:54:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 10, 2015 at 7:35 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor <noor_ahsan@mentor.com>
>
> * Fixes a dependency on a nonexistent initscripts-functions package.

Your meta-virt repository is out of date, we are on 1.2.17 in master. Can you
do a quick rebase and resend ?

Bruce

>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.15.bb |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.15.bb b/recipes-extended/libvirt/libvirt_1.2.15.bb
> index 8abd41e..6a5b67e 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.15.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.15.bb
> @@ -238,3 +238,8 @@ pkg_postinst_libvirt() {
>                  /etc/init.d/populate-volatile.sh update
>          fi
>  }
> +
> +python () {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

