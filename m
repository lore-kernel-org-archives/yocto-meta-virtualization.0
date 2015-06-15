Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40B69E00A2C; Sun, 14 Jun 2015 20:10:49 -0700 (PDT)
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
	*      [209.85.213.46 listed in list.dnswl.org]
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F319EE009F8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 14 Jun 2015 20:10:45 -0700 (PDT)
Received: by yhak3 with SMTP id k3so34321922yha.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 14 Jun 2015 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WpGS72H3Vm2duI0FXn7sh6iDrpmmBqQI9gFZwOk4Bc4=;
	b=QGNAGii3R+m+eKZX7lJRJiivx6A9r3SGXIfLUn86Hc7jZAeVYpmxunoA1HzZdfIVNC
	gaS74v6wphzKjVib6Bw2vpSEfkROrtKrStWp4AToqwvlNtay0lddocaehAN/stisNL4Y
	MYbfoSrP56ispEhqCNGT0K2o8PMdkt8UpAcWgtkDGcRhG3rZCj5z+5B7FLTRLLkELmTz
	MMq1/zFP70NH1hBnBOWOwI/63x26LC3/opjf2/cf/m/NtORBCIQdjRvt0pDVCV/MDK/J
	T+DV9XLoHn7kUgDuFoiuFiI1nziAc01Wi3IUug/AzcUlPEZQlsteyIHoSeGEtlkdF1RE
	fLww==
MIME-Version: 1.0
X-Received: by 10.129.146.20 with SMTP id j20mr31266362ywg.62.1434337844508;
	Sun, 14 Jun 2015 20:10:44 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Sun, 14 Jun 2015 20:10:44 -0700 (PDT)
In-Reply-To: <1434087392-20250-1-git-send-email-koen.kooi@linaro.org>
References: <1434087392-20250-1-git-send-email-koen.kooi@linaro.org>
Date: Sun, 14 Jun 2015 23:10:44 -0400
Message-ID: <CADkTA4NOaF_91WNutQHUMwWSU5AfULHPZBFQHDiQLv0D2PQAEw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Raymond Danks <ray.danks@se-eng.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] cloud-image-*: catch up with OE-core class rename
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
X-List-Received-Date: Mon, 15 Jun 2015 03:10:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 12, 2015 at 1:36 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> OE-core rev 0a3e8eb9f592c3f1edd2c7521855f7406541651a renamed 'image-vmdk' to 'image-vm'. IMAGE_FSTYPES didn't change, so keep those as 'vmdk'.

Thanks. I've merged the change.

Bruce

>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  recipes-extended/images/cloud-image-controller.bb | 2 +-
>  recipes-extended/images/cloud-image-guest.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-extended/images/cloud-image-controller.bb
> index 74f724b..0b2a67b 100644
> --- a/recipes-extended/images/cloud-image-controller.bb
> +++ b/recipes-extended/images/cloud-image-controller.bb
> @@ -26,7 +26,7 @@ IMAGE_INSTALL = "\
>      "
>
>  inherit core-image
> -inherit image-vmdk
> +inherit image-vm
>
>  IMAGE_FSTYPES = "vmdk tar.gz"
>
> diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extended/images/cloud-image-guest.bb
> index 818a513..e24bf0d 100644
> --- a/recipes-extended/images/cloud-image-guest.bb
> +++ b/recipes-extended/images/cloud-image-guest.bb
> @@ -13,6 +13,6 @@ IMAGE_INSTALL = "\
>      "
>
>  inherit core-image
> -inherit image-vmdk
> +inherit image-vm
>
>  IMAGE_FSTYPES += "vmdk"
> --
> 1.9.3
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

