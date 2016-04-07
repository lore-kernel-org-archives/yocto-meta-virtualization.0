Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 355F3E00C1F; Wed,  6 Apr 2016 23:57:17 -0700 (PDT)
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
	*      [209.85.214.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7216AE00BEA
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Apr 2016 23:57:15 -0700 (PDT)
Received: by mail-ob0-f179.google.com with SMTP id j9so46907405obd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Apr 2016 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=5QqicSDirYrOi0YWoRCTzRRP2uZAntmsUZIt9QYVyMw=;
	b=aqkk2KVgIPlonbrS1IgI8OlSzNCvwA0x/kjQph7b71UCP5CAeXx/OzDNJnt2WwcrEL
	+g4cZNkF6C2DX+9HZwmJfVW+0CidCjnjs7VP5jIjO40rOaGisz6yVl2f+w0dHuxInQT0
	ySNagPfzjJ2y2MjXbhhc5PGzqjZyXlmmFAi2dnz4Ot6J6w0kkDl2kJfakv0O+XZk2UMC
	2pBYaF9Cqx7dbSCnJqrfprYoMyZGowe3mYtPI0npWOmoZRS4jt1EjAafzqf1kh9jlQ+Y
	whDZm3Q6lgTHv38dCheXIRIlsh0wSx6dDLHIP/0ifM7lcgdmARLrFP9XhvjOg6/v8m9v
	lq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=5QqicSDirYrOi0YWoRCTzRRP2uZAntmsUZIt9QYVyMw=;
	b=j95Qu+K+zJUmRqEbeg2419WBZWMkq2kBtorEfLqSfE6MrzwVrduADGMEZgAyLG/Wwr
	koADc2Pg6k3S+U63vNzkG9u4ZoqGHFha63dGXC35r6IeOJzhwjdptbnr4wd7ZIphaK9I
	Q5LayP54yNCtCcHtmmcyaZHqQ+w/tbE3Jaa1kxmSlEQlmLGuVcCJ37clR8FX3tgwmgcu
	QhMpoNQAVTkT60TZBlwx5YqnoFo61ZT3TsxvxpN/ReBNfst431CICckDA5B0t2Houbpv
	W25cZMhzRBGGd+QwzYNuvfLYZY99KYjIfpjKX5sQYXmfIW7hK6CLF1jFBxXA24pJTwRc
	yHyg==
X-Gm-Message-State: AD7BkJKsGEo03tOP5VzEdGeosHcTTjs7QuEN5WXLHDUgvbM6VsiPve3dNDvUPnBZEZOA2dlLDcPG7Hq/7OO22g==
MIME-Version: 1.0
X-Received: by 10.182.110.198 with SMTP id ic6mr687406obb.15.1460012234435;
	Wed, 06 Apr 2016 23:57:14 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Wed, 6 Apr 2016 23:57:14 -0700 (PDT)
In-Reply-To: <1459871312-872-1-git-send-email-bogdan.purcareata@nxp.com>
References: <1459871312-872-1-git-send-email-bogdan.purcareata@nxp.com>
Date: Thu, 7 Apr 2016 02:57:14 -0400
Message-ID: <CADkTA4PvBVAJFWQkb1LsceVqxfnGHwR4CoqspKmbfo-7DwJyhQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@nxp.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Fix bug in assigning virtio-mmio disks with qemu
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
X-List-Received-Date: Thu, 07 Apr 2016 06:57:17 -0000
Content-Type: multipart/alternative; boundary=089e0112c0da99f547052fdf9646

--089e0112c0da99f547052fdf9646
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 11:48 AM, Bogdan Purcareata <
bogdan.purcareata@nxp.com> wrote:

> Patch contains a more detailed description. Basically allows adding
> virtio-mmio
> block device to QEMU guests. Tested on ARM64.
>
> Please apply on jethro branch.
>

We don't want to create functionality on old branches that isn't also on
master.
Is there any reason why this wouldn't be applicable to master as well ?

Bruce


>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> ---
>  ...io-mmio-disks-in-qemuAssignDevicePCISlots.patch | 81
> ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.2.19.bb         |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644
> recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
>
> diff --git
> a/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> new file mode 100644
> index 0000000..f0b7ab5
> --- /dev/null
> +++
> b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> @@ -0,0 +1,81 @@
> +From d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Mon Sep 17 00:00:00 2001
> +From: Pavel Fedin <p.fedin@samsung.com>
> +Date: Wed, 9 Sep 2015 15:02:53 +0300
> +Subject: [PATCH] Ignore virtio-mmio disks in qemuAssignDevicePCISlots()
> +
> +Fixes the following error when attempting to add a disk with bus='virtio'
> +to a machine which actually supports virtio-mmio (caught with ARM virt):
> +
> +virtio disk cannot have an address of type 'virtio-mmio'
> +
> +The problem has been likely introduced by
> +e8d55172544c1fafe31a9e09346bdebca4f0d6f9. Before that
> +qemuAssignDevicePCISlots() was never called for ARM "virt" machine.
> +
> +Upstream-status: Accepted
> +[
> https://libvirt.org/git/?p=libvirt.git;a=commit;h=d526e37bad2515cf91caa0e4ff3edaf41e45b5c2
> ]
> +
> +Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> +---
> + src/qemu/qemu_command.c | 11 +++++++++--
> + src/qemu/qemu_command.h |  1 +
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c
> +index b56670c..25f57f2 100644
> +--- a/src/qemu/qemu_command.c
> ++++ b/src/qemu/qemu_command.c
> +@@ -2261,7 +2261,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> +                 virDomainPCIAddressReserveNextSlot(addrs, &info, flags)
> < 0)
> +                 goto cleanup;
> +
> +-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
> ++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
> +                 goto cleanup;
> +
> +             for (i = 1; i < addrs->nbuses; i++) {
> +@@ -2294,7 +2294,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> +             if (qemuValidateDevicePCISlotsChipsets(def, qemuCaps, addrs)
> < 0)
> +                 goto cleanup;
> +
> +-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
> ++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
> +                 goto cleanup;
> +
> +             for (i = 0; i < def->ncontrollers; i++) {
> +@@ -2426,6 +2426,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> +  */
> + int
> + qemuAssignDevicePCISlots(virDomainDefPtr def,
> ++                         virQEMUCapsPtr qemuCaps,
> +                          virDomainPCIAddressSetPtr addrs)
> + {
> +     size_t i, j;
> +@@ -2618,6 +2619,12 @@ qemuAssignDevicePCISlots(virDomainDefPtr def,
> +             VIR_DOMAIN_DEVICE_ADDRESS_TYPE_CCW)
> +             continue;
> +
> ++        /* Also ignore virtio-mmio disks if our machine allows them */
> ++        if (def->disks[i]->info.type ==
> ++            VIR_DOMAIN_DEVICE_ADDRESS_TYPE_VIRTIO_MMIO &&
> ++            virQEMUCapsGet(qemuCaps, QEMU_CAPS_DEVICE_VIRTIO_MMIO))
> ++            continue;
> ++
> +         if (def->disks[i]->info.type !=
> VIR_DOMAIN_DEVICE_ADDRESS_TYPE_NONE) {
> +             virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
> +                            _("virtio disk cannot have an address of type
> '%s'"),
> +diff --git a/src/qemu/qemu_command.h b/src/qemu/qemu_command.h
> +index 767d31f..4aa7f2d 100644
> +--- a/src/qemu/qemu_command.h
> ++++ b/src/qemu/qemu_command.h
> +@@ -284,6 +284,7 @@ virDomainPCIAddressSetPtr
> qemuDomainPCIAddressSetCreate(virDomainDefPtr def,
> +                                                         bool dryRun);
> +
> + int qemuAssignDevicePCISlots(virDomainDefPtr def,
> ++                             virQEMUCapsPtr qemuCaps,
> +                              virDomainPCIAddressSetPtr addrs);
> +
> + int qemuAssignDeviceAliases(virDomainDefPtr def, virQEMUCapsPtr
> qemuCaps);
> +--
> +1.9.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb
> b/recipes-extended/libvirt/libvirt_1.2.19.bb
> index df53d59..774eea4 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.19.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
> @@ -33,6 +33,7 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://libvirt-use-pkg-config-to-locate-libcap.patch \
>             file://0001-to-fix-build-error.patch \
>             file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
> +
>  file://Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch \
>            "
>
>  SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
> --
> 1.9.1
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

--089e0112c0da99f547052fdf9646
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 5, 2016 at 11:48 AM, Bogdan Purcareata <span dir=3D"ltr">&l=
t;<a href=3D"mailto:bogdan.purcareata@nxp.com" target=3D"_blank">bogdan.pur=
careata@nxp.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Pat=
ch contains a more detailed description. Basically allows adding virtio-mmi=
o<br>
block device to QEMU guests. Tested on ARM64.<br>
<br>
Please apply on jethro branch.<br></blockquote><div><br></div><div>We don&#=
39;t want to create functionality on old branches that isn&#39;t also on ma=
ster.<br></div><div>Is there any reason why this wouldn&#39;t be applicable=
 to master as well ?<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nx=
p.com">bogdan.purcareata@nxp.com</a>&gt;<br>
---<br>
=C2=A0...io-mmio-disks-in-qemuAssignDevicePCISlots.patch | 81 +++++++++++++=
+++++++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 82 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/libvirt/Ignore-virtio-mmi=
o-disks-in-qemuAssignDevicePCISlots.patch<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-q=
emuAssignDevicePCISlots.patch b/recipes-extended/libvirt/libvirt/Ignore-vir=
tio-mmio-disks-in-qemuAssignDevicePCISlots.patch<br>
new file mode 100644<br>
index 0000000..f0b7ab5<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssi=
gnDevicePCISlots.patch<br>
@@ -0,0 +1,81 @@<br>
+From d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Mon Sep 17 00:00:00 2001<br>
+From: Pavel Fedin &lt;<a href=3D"mailto:p.fedin@samsung.com">p.fedin@samsu=
ng.com</a>&gt;<br>
+Date: Wed, 9 Sep 2015 15:02:53 +0300<br>
+Subject: [PATCH] Ignore virtio-mmio disks in qemuAssignDevicePCISlots()<br=
>
+<br>
+Fixes the following error when attempting to add a disk with bus=3D&#39;vi=
rtio&#39;<br>
+to a machine which actually supports virtio-mmio (caught with ARM virt):<b=
r>
+<br>
+virtio disk cannot have an address of type &#39;virtio-mmio&#39;<br>
+<br>
+The problem has been likely introduced by<br>
+e8d55172544c1fafe31a9e09346bdebca4f0d6f9. Before that<br>
+qemuAssignDevicePCISlots() was never called for ARM &quot;virt&quot; machi=
ne.<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dcommit;h=3Dd526e3=
7bad2515cf91caa0e4ff3edaf41e45b5c2" rel=3D"noreferrer" target=3D"_blank">ht=
tps://libvirt.org/git/?p=3Dlibvirt.git;a=3Dcommit;h=3Dd526e37bad2515cf91caa=
0e4ff3edaf41e45b5c2</a>]<br>
+<br>
+Signed-off-by: Pavel Fedin &lt;<a href=3D"mailto:p.fedin@samsung.com">p.fe=
din@samsung.com</a>&gt;<br>
+---<br>
+ src/qemu/qemu_command.c | 11 +++++++++--<br>
+ src/qemu/qemu_command.h |=C2=A0 1 +<br>
+ 2 files changed, 10 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c<br>
+index b56670c..25f57f2 100644<br>
+--- a/src/qemu/qemu_command.c<br>
++++ b/src/qemu/qemu_command.c<br>
+@@ -2261,7 +2261,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virDomainPCI=
AddressReserveNextSlot(addrs, &amp;info, flags) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup=
;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePCISlots(de=
f, addrs) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePCISlots(de=
f, qemuCaps, addrs) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; addrs=
-&gt;nbuses; i++) {<br>
+@@ -2294,7 +2294,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemuValidateDevicePCIS=
lotsChipsets(def, qemuCaps, addrs) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup=
;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePCISlots(de=
f, addrs) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePCISlots(de=
f, qemuCaps, addrs) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; def-&=
gt;ncontrollers; i++) {<br>
+@@ -2426,6 +2426,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,<br=
>
+=C2=A0 */<br>
+ int<br>
+ qemuAssignDevicePCISlots(virDomainDefPtr def,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0virQEMUCapsPtr qemuCaps,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 virDomainPCIAddressSetPtr addrs)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0size_t i, j;<br>
+@@ -2618,6 +2619,12 @@ qemuAssignDevicePCISlots(virDomainDefPtr def,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_DOMAIN_DEVICE_ADDRESS_=
TYPE_CCW)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Also ignore virtio-mmio disks if our machi=
ne allows them */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (def-&gt;disks[i]-&gt;info.type =3D=3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VIR_DOMAIN_DEVICE_ADDRESS_TYPE_=
VIRTIO_MMIO &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virQEMUCapsGet(qemuCaps, QEMU_C=
APS_DEVICE_VIRTIO_MMIO))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (def-&gt;disks[i]-&gt;info.type !=3D =
VIR_DOMAIN_DEVICE_ADDRESS_TYPE_NONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_CON=
FIG_UNSUPPORTED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _(&quot;virtio disk cannot have an address of type=
 &#39;%s&#39;&quot;),<br>
+diff --git a/src/qemu/qemu_command.h b/src/qemu/qemu_command.h<br>
+index 767d31f..4aa7f2d 100644<br>
+--- a/src/qemu/qemu_command.h<br>
++++ b/src/qemu/qemu_command.h<br>
+@@ -284,6 +284,7 @@ virDomainPCIAddressSetPtr qemuDomainPCIAddressSetCreat=
e(virDomainDefPtr def,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool dryRun);<br>
+<br>
+ int qemuAssignDevicePCISlots(virDomainDefPtr def,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virQEMUCapsPtr qemuCaps,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainPCIAddressSetPtr addrs);<br>
+<br>
+ int qemuAssignDeviceAliases(virDomainDefPtr def, virQEMUCapsPtr qemuCaps)=
;<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" =
rel=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a> b/recipes-extend=
ed/libvirt/<a href=3D"http://libvirt_1.2.19.bb" rel=3D"noreferrer" target=
=3D"_blank">libvirt_1.2.19.bb</a><br>
index df53d59..774eea4 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/libvirt-${PV}.tar.gz;name=3Dlibvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirt-use-pkg-config-to-=
locate-libcap.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-to-fix-build-error.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Revert-build-add-prefix-to=
-SYSTEMD_UNIT_DIR.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Ignore-virtio-mmio-disks-i=
n-qemuAssignDevicePCISlots.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.md5sum] =3D &quot;bc3ab1ba5b6fabd2e4516c70ddd4d97c&qu=
ot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--089e0112c0da99f547052fdf9646--
