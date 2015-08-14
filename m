Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 896B4E00A3C; Thu, 13 Aug 2015 20:42:18 -0700 (PDT)
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
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DFD9E00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:42:14 -0700 (PDT)
Received: by ykek5 with SMTP id k5so7151225yke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wfo5SMdMGA7CCNw6yT15o8/5Q0a5cZ/Ifb0Sw62eUKw=;
	b=oEyoTJwaUZe1/g/Vt3vMxRfXS29gulV0EQizR7s3uai0dwMykgvOCkoj+9wSP8DVtY
	qy/NIXHu+w7Ib1rJ8pgXI92ZPBILb9fTmsAC4fae9/I5vJxpMQyhJ3brcu0InGOkkXgm
	IXDJ/Jw0cQ5VmjG+Sif/Sqv84K5ycL9qa9uesAJUu+82yzJoC/mQeXAwqGbp4/FdGlzC
	jATMsNdTjKg8yJaSiKeoWXwQGS0FHuj7kYuXVssJdKufsJu1cNKXaBBBR3b+BcQlQ8dx
	NNY/Moxa5/JEaWMauLKB5OsnIE2zo/6r2P5PFSA4Hulz5BJWpL2q7lENvyXywyBwhPz9
	2M5g==
MIME-Version: 1.0
X-Received: by 10.13.222.129 with SMTP id h123mr636592ywe.30.1439523734311;
	Thu, 13 Aug 2015 20:42:14 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Thu, 13 Aug 2015 20:42:13 -0700 (PDT)
In-Reply-To: <1439218251-7707-1-git-send-email-noor_ahsan@mentor.com>
References: <1439218251-7707-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 13 Aug 2015 23:42:13 -0400
Message-ID: <CADkTA4MQeDm_ijE+23pQOcwiP7XJTr8+HTxawP02ay5GsGT20g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2] libvirt: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Fri, 14 Aug 2015 03:42:18 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Aug 10, 2015 at 10:50 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor <noor_ahsan@mentor.com>
>
> * Fixes a dependency on a nonexistent initscripts-functions package.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.17.bb |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
> index 9f8c3af..a945792 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.17.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
> @@ -239,3 +239,8 @@ pkg_postinst_libvirt() {
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

