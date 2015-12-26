Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71F4BE00D2A; Fri, 25 Dec 2015 19:53:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA0E2E00CFB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:53:38 -0800 (PST)
Received: by mail-vk0-f54.google.com with SMTP id a123so2195676vkh.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6ccsr6n0TaBZdVmiAM9csgNfuKzknSJNfy05em6sTFA=;
	b=CJ+ff7L4vF31oTn9lToXdP6AbUw/6RUpiFfi82JLtsuQbi0Fr0W0g/Q3sMiElsALuW
	WYmKgGBOvtUyW62s/KRAHK2GE6PPcK0fODsuM36asOUlYuw4MfkDyZhijuyhUmpfHiDN
	5UfXjVCEM2IfRRpDDcluR6IlAMOsmWz1kiuiGr1huhl5QfSo564bgWGcLsBHiRoCZ6Ym
	qboSwnEPrhFeQDAt5Nef2/eR0oW+W9If3GDznwQTHWS/rTV3mBWkuJCTeu7E6x1QRBJN
	tcxNqqNHZt/KNyCl4d4ZJdnsLNAdHEjHw0GeTmKgo8nfTu6+vsjyjxO4xmakU1iZ81cf
	Sjcg==
MIME-Version: 1.0
X-Received: by 10.31.44.77 with SMTP id s74mr28011602vks.4.1451102017773; Fri,
	25 Dec 2015 19:53:37 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 25 Dec 2015 19:53:37 -0800 (PST)
In-Reply-To: <1450808788-16555-1-git-send-email-cjp256@gmail.com>
References: <1450808788-16555-1-git-send-email-cjp256@gmail.com>
Date: Fri, 25 Dec 2015 22:53:37 -0500
Message-ID: <CADkTA4PcXConvbriCP2jzNV+O5J63_1=bDBNxF-9ZapMLpWYCQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] xen.cfg: update for linux 4.1
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
X-List-Received-Date: Sat, 26 Dec 2015 03:53:40 -0000
Content-Type: multipart/alternative; boundary=001a11c075a24d67b00527c50419

--001a11c075a24d67b00527c50419
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Dec 22, 2015 at 1:26 PM, Chris Patterson <cjp256@gmail.com> wrote:

> - Drop old kernel options and add some newly available ones.
>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/xen.cfg |   19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg
> b/recipes-kernel/linux/linux-yocto/xen.cfg
> index 4e796b9..096bea0 100644
> --- a/recipes-kernel/linux/linux-yocto/xen.cfg
> +++ b/recipes-kernel/linux/linux-yocto/xen.cfg
> @@ -1,27 +1,19 @@
> -###
> -# linux 3.4, 3.8
> -CONFIG_PARAVIRT_GUEST=y
> -###
> -
> -###
> -# linux 3.10
> -CONFIG_HYPERVISOR_GUEST=y
> -###
> -
>  CONFIG_PARAVIRT=y
>  CONFIG_XEN=y
>  CONFIG_XEN_DOM0=y
> -CONFIG_XEN_PRIVILEGED_GUEST=y
>  CONFIG_XEN_PVHVM=y
>  CONFIG_XEN_MAX_DOMAIN_MEMORY=500
>  CONFIG_XEN_SAVE_RESTORE=y
> -CONFIG_PARAVIRT_CLOCK=y
> +# CONFIG_XEN_DEBUG_FS is not set
> +CONFIG_XEN_PVH=y
> +CONFIG_MMU_NOTIFIER=y
>  CONFIG_HIBERNATE_CALLBACKS=y
>  CONFIG_PCI_XEN=y
>  CONFIG_XEN_PCIDEV_FRONTEND=y
>  CONFIG_SYS_HYPERVISOR=y
>  CONFIG_XEN_BLKDEV_FRONTEND=y
>  CONFIG_XEN_BLKDEV_BACKEND=m
> +CONFIG_XEN_SCSI_FRONTEND=m
>  CONFIG_XEN_NETDEV_FRONTEND=y
>  CONFIG_XEN_NETDEV_BACKEND=m
>  CONFIG_INPUT_MISC=y
> @@ -52,3 +44,6 @@ CONFIG_XEN_PRIVCMD=y
>  CONFIG_XEN_ACPI_PROCESSOR=m
>  CONFIG_XEN_MCE_LOG=y
>  CONFIG_XEN_HAVE_PVMMU=y
> +CONFIG_XEN_EFI=y
> +CONFIG_XEN_AUTO_XLATE=y
> +CONFIG_XEN_ACPI=y
> --
> 1.7.10.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c075a24d67b00527c50419
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Dec 22, 2015 at 1:26 PM=
, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com"=
 target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">- Drop old kernel options and add some newly available one=
s.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-yocto/xen.cfg |=C2=A0 =C2=A019 +++++++----=
--------<br>
=C2=A01 file changed, 7 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linu=
x/linux-yocto/xen.cfg<br>
index 4e796b9..096bea0 100644<br>
--- a/recipes-kernel/linux/linux-yocto/xen.cfg<br>
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg<br>
@@ -1,27 +1,19 @@<br>
-###<br>
-# linux 3.4, 3.8<br>
-CONFIG_PARAVIRT_GUEST=3Dy<br>
-###<br>
-<br>
-###<br>
-# linux 3.10<br>
-CONFIG_HYPERVISOR_GUEST=3Dy<br>
-###<br>
-<br>
=C2=A0CONFIG_PARAVIRT=3Dy<br>
=C2=A0CONFIG_XEN=3Dy<br>
=C2=A0CONFIG_XEN_DOM0=3Dy<br>
-CONFIG_XEN_PRIVILEGED_GUEST=3Dy<br>
=C2=A0CONFIG_XEN_PVHVM=3Dy<br>
=C2=A0CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500<br>
=C2=A0CONFIG_XEN_SAVE_RESTORE=3Dy<br>
-CONFIG_PARAVIRT_CLOCK=3Dy<br>
+# CONFIG_XEN_DEBUG_FS is not set<br>
+CONFIG_XEN_PVH=3Dy<br>
+CONFIG_MMU_NOTIFIER=3Dy<br>
=C2=A0CONFIG_HIBERNATE_CALLBACKS=3Dy<br>
=C2=A0CONFIG_PCI_XEN=3Dy<br>
=C2=A0CONFIG_XEN_PCIDEV_FRONTEND=3Dy<br>
=C2=A0CONFIG_SYS_HYPERVISOR=3Dy<br>
=C2=A0CONFIG_XEN_BLKDEV_FRONTEND=3Dy<br>
=C2=A0CONFIG_XEN_BLKDEV_BACKEND=3Dm<br>
+CONFIG_XEN_SCSI_FRONTEND=3Dm<br>
=C2=A0CONFIG_XEN_NETDEV_FRONTEND=3Dy<br>
=C2=A0CONFIG_XEN_NETDEV_BACKEND=3Dm<br>
=C2=A0CONFIG_INPUT_MISC=3Dy<br>
@@ -52,3 +44,6 @@ CONFIG_XEN_PRIVCMD=3Dy<br>
=C2=A0CONFIG_XEN_ACPI_PROCESSOR=3Dm<br>
=C2=A0CONFIG_XEN_MCE_LOG=3Dy<br>
=C2=A0CONFIG_XEN_HAVE_PVMMU=3Dy<br>
+CONFIG_XEN_EFI=3Dy<br>
+CONFIG_XEN_AUTO_XLATE=3Dy<br>
+CONFIG_XEN_ACPI=3Dy<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11c075a24d67b00527c50419--
