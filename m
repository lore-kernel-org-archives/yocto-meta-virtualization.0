Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E555E00576; Tue,  8 Jul 2014 06:08:27 -0700 (PDT)
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
	*      [209.85.217.170 listed in list.dnswl.org]
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83110E004FF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jul 2014 06:08:23 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id 10so3988925lbg.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Jul 2014 06:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1zJoHadUyeABnVXgwNYo+KSBKjK9Z53pH3WtZ2zioq0=;
	b=Uw1+FibHMEYHu9Zj36QF+E4hUCnaImpOo1QKDwS0APCckik4AeyeMuoFC78ip1h7QX
	Wgk9XulXdwT1vSePAzNyO7hQGQEWDBGrX5JSd9z3JadLWwQkjGGa+/g35HoDRca+ojbg
	/pBGUazVyQXTJuPcf5Uumo3qUaBV573tLcNxP3EeB+zAO1hRDxzi2pWtomTUpvur3UXD
	UvpU4xXvlU/uL8MKQyyhep7S4sn3EnOWFA8ZLDrC1h8BTSYAK8TklwDpjs264ECSvRJa
	f3RnwsLU2Bq87n98oNuz/h26c0S7BCbZXdEAAzBXTGmJOzVxWv/Kx3qZpuBn6/Ye5Acg
	rejQ==
MIME-Version: 1.0
X-Received: by 10.152.9.234 with SMTP id d10mr7102997lab.56.1404824902322;
	Tue, 08 Jul 2014 06:08:22 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Tue, 8 Jul 2014 06:08:22 -0700 (PDT)
In-Reply-To: <1404817370-56388-1-git-send-email-maxin.john@enea.com>
References: <1404817370-56388-1-git-send-email-maxin.john@enea.com>
Date: Tue, 8 Jul 2014 09:08:22 -0400
Message-ID: <CADkTA4OdLy45ryGnn4QruPGMy-COy83+QQTK8JxNb2c6MEBaUw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto/3.10/3.14/3.4: replaces module_autoload with KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Tue, 08 Jul 2014 13:08:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 8, 2014 at 7:02 AM, Maxin B. John <maxin.john@enea.com> wrote:
> Replace module_autoload with KERNEL_MODULE_AUTOLOAD for "openvswitch".


Already merged:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=a66fb848db693347ae2be936eccd2ac0c4f28a48
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=7c193419ad22194755e8e9767e9ab480aa14f97c

Bruce

>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.10.bbappend | 2 +-
>  recipes-kernel/linux/linux-yocto_3.14.bbappend | 2 +-
>  recipes-kernel/linux/linux-yocto_3.4.bbappend  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> index 3e8799a..c03d7e0 100644
> --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> @@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
>             "
> -module_autoload_openvswitch = "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
>  KERNEL_MODULE_AUTOLOAD += "kvm"
> diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
> index 3e8799a..c03d7e0 100644
> --- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
> @@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
>             "
> -module_autoload_openvswitch = "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
>  KERNEL_MODULE_AUTOLOAD += "kvm"
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index de820b6..9180748 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
>             "
> -module_autoload_openvswitch = "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
>  KERNEL_MODULE_AUTOLOAD += "kvm"
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

