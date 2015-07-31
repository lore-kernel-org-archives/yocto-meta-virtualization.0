Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2851E009F8; Fri, 31 Jul 2015 07:20:02 -0700 (PDT)
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
	*      [209.85.160.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82DBDE009E5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 07:20:01 -0700 (PDT)
Received: by ykdu72 with SMTP id u72so60180572ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tK17tCg0RCENqjOt69xzExErAwz5wRUYYF4/+FtCcpo=;
	b=IKZ/A3OYPSFkU+SvUFwAEIoFN2+IQ5lW3PKP9DwNnSFSe8z/xkR9AcqmZupKjX1uGj
	nNOgXe9nZ1rzVOJOVHkZceqm2HjYAemN/FQ4Q1MC4xhtnQM9+V6wcHaZtlumZo1oiUsj
	DOzJyRd7Hl5aYYVATwURBGKqO6/C2b7VLpUE2JP1K6cnt+DPJGsaNsNQXd4Fx0o5BG42
	bcbclcvL5BBRFR5E3HWouqGfKT2vJSAFHqOKMjSxXfj8rzhxi7xIe3Nh2Bk5TVOFFpuW
	6OMXUFF/M92cIjTkN4JhhSuDxmON4dM7/mYoTdz7Z/hEjO/eZR5usnwblLbICKL1v0Mh
	d7LA==
MIME-Version: 1.0
X-Received: by 10.129.130.69 with SMTP id s66mr3518416ywf.62.1438352400754;
	Fri, 31 Jul 2015 07:20:00 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Fri, 31 Jul 2015 07:20:00 -0700 (PDT)
In-Reply-To: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 31 Jul 2015 10:20:00 -0400
Message-ID: <CADkTA4MThWXcbXzNaVZts1eS_Wxh9Q_zR4F_Mg-Ar=ykgP_5JQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] nss-pam-ldapd: upgrade 0.9.4 -> 0.9.6
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
X-List-Received-Date: Fri, 31 Jul 2015 14:20:02 -0000
Content-Type: text/plain; charset=UTF-8

Thanks,

Everything is merged to master.

Bruce

On Thu, Jul 30, 2015 at 11:43 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../nss-pam-ldapd/{nss-pam-ldapd_0.9.4.bb => nss-pam-ldapd_0.9.6.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.4.bb => nss-pam-ldapd_0.9.6.bb} (90%)
>
> diff --git a/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb b/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> similarity index 90%
> rename from meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb
> rename to meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> index 65ed66f..9f822f3 100644
> --- a/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.4.bb
> +++ b/meta-openstack/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> @@ -21,9 +21,8 @@ SRC_URI = "\
>
>  inherit autotools
>
> -
> -SRC_URI[md5sum] = "0d74202700efdde3b6e551bfff49c132"
> -SRC_URI[sha256sum] = "fd2e3e0935acfd3d2b13682962f51d28d5855472e690d787e36a476fa40c88e6"
> +SRC_URI[md5sum] = "fa5ec49cb54428d6c73e244a11021695"
> +SRC_URI[sha256sum] = "101d5a7fa10549cc77be48d07f2b8141f59182f10f2cc0fea93efd13c3a5a6f2"
>
>  DEPENDS += "libpam openldap"
>
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

