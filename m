Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D043E00C62; Thu,  7 Apr 2016 07:55:11 -0700 (PDT)
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
	*      [209.85.218.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C26C9E007C5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Apr 2016 07:55:06 -0700 (PDT)
Received: by mail-oi0-f51.google.com with SMTP id s79so101984265oie.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Apr 2016 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9WsVkmyP+W30cuoIL40uqh4HlcvkhTDPUNd5Lt+ukoo=;
	b=FtQ8H/TjO4YQOoTuqDFFSC/uoTIhXkTF+03STBKf24A/YzOhmLgnOHeZnYgKJGd9xy
	WpBz2xcC/kyCFFdcfVmL1lt09GKLJquFnjl6mKizc6mwLb5PUTSgL47Rb9KDLdK36pLA
	/t+3OcYdBW+y/IV1vt3FDGqpEQYIeGPknBGRXO97vOCO02PxELhyrwURu0vzm7/uvvfI
	x5CQuBmdyn3IgSLXgtlmg5XOhKbMaug4PU6h98sg9lscmEYx6AYReappAiPX5ETf9aLN
	LQVgoCZeMSQHdeMdFUjE1k6OOnXS4fGq7iMKS86TA2tklV0WaxK5uT8pQNWBk5mmkaor
	BVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9WsVkmyP+W30cuoIL40uqh4HlcvkhTDPUNd5Lt+ukoo=;
	b=jJGLg6VhwSy8drwleWDN0lm48oYGgcXPK4x6E+64Gh+L3mCvmgFUJqSfixKcdmRJtX
	jy32oNGuBEW/7c+KRcPv6yJh408j13HjrCXkhb+JWO4f741NgVO1R+qrnOUcHiCqeKZi
	ldHiSNaUeZTQ1oewfN3wIsbOmjTUbcQvv6F+Kq0tvjyr6ytwCSZmqr0EKBQENSrryTyA
	w/+BAhrg55TyNPYWO50FgWaUQFd/BRlqKV/jwmGgssMuVJNHe7e9CCoOQ+P5uZyEnyXS
	K7RD7//Zd2m5cVxk2f+diQAxwT5s8FcEYqRhuzTsS+THwCo1AaSyXwtjgTk4Zg1gLtra
	p+sg==
X-Gm-Message-State: AD7BkJIWn2wTK3eHpFRARe3sHVMQh1YPvEwXinWh1xFKnw7rU8GDE5Ts9PB4iFJJ0kY0SFFu87sPEu/nRcmhSw==
MIME-Version: 1.0
X-Received: by 10.157.47.207 with SMTP id b15mr1754379otd.118.1460040905827;
	Thu, 07 Apr 2016 07:55:05 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 7 Apr 2016 07:55:05 -0700 (PDT)
In-Reply-To: <570624B3.7040005@nxp.com>
References: <1459871312-872-1-git-send-email-bogdan.purcareata@nxp.com>
	<CADkTA4PvBVAJFWQkb1LsceVqxfnGHwR4CoqspKmbfo-7DwJyhQ@mail.gmail.com>
	<570624B3.7040005@nxp.com>
Date: Thu, 7 Apr 2016 10:55:05 -0400
Message-ID: <CADkTA4MFp=78TzU1biV7nc=F5yP2PumwFBEyHOuz84mXrvfuEQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Apr 2016 14:55:11 -0000
Content-Type: multipart/alternative; boundary=001a11353a2c8caf11052fe643a6

--001a11353a2c8caf11052fe643a6
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 7, 2016 at 5:13 AM, Bogdan Purcareata <bogdan.purcareata@nxp.com
> wrote:

> On 07.04.2016 09:57, Bruce Ashfield wrote:
> > On Tue, Apr 5, 2016 at 11:48 AM, Bogdan Purcareata <
> > bogdan.purcareata@nxp.com> wrote:
> >
> >> Patch contains a more detailed description. Basically allows adding
> >> virtio-mmio
> >> block device to QEMU guests. Tested on ARM64.
> >>
> >> Please apply on jethro branch.
> >>
> >
> > We don't want to create functionality on old branches that isn't also on
> > master.
> > Is there any reason why this wouldn't be applicable to master as well ?
>
> Master delivers libvirt 1.3.2 [1] which has this patch included:
>
> [libvirt]$ git checkout v1.3.2 && git log --pretty=oneline | grep "Ignore
> virtio-mmio"
> d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Ignore virtio-mmio disks in
> qemuAssignDevicePCISlots()
>


Great. Just what I was looking for .. I hadn't looked all the way down into
the embedded
patch, where I see the info was included via the upstream status.

merged to jethro.

Bruce


>
> [1]
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/libvirt
>
> Thank you,
> Bogdan P.
>
> >>
> >> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> ---
> >>   ...io-mmio-disks-in-qemuAssignDevicePCISlots.patch | 81
> >> ++++++++++++++++++++++
> >>   recipes-extended/libvirt/libvirt_1.2.19.bb         |  1 +
> >>   2 files changed, 82 insertions(+)
> >>   create mode 100644
> >>
> recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> >>
> >> diff --git
> >>
> a/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> >>
> b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> >> new file mode 100644
> >> index 0000000..f0b7ab5
> >> --- /dev/null
> >> +++
> >>
> b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch
> >> @@ -0,0 +1,81 @@
> >> +From d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Mon Sep 17 00:00:00 2001
> >> +From: Pavel Fedin <p.fedin@samsung.com>
> >> +Date: Wed, 9 Sep 2015 15:02:53 +0300
> >> +Subject: [PATCH] Ignore virtio-mmio disks in qemuAssignDevicePCISlots()
> >> +
> >> +Fixes the following error when attempting to add a disk with
> bus='virtio'
> >> +to a machine which actually supports virtio-mmio (caught with ARM
> virt):
> >> +
> >> +virtio disk cannot have an address of type 'virtio-mmio'
> >> +
> >> +The problem has been likely introduced by
> >> +e8d55172544c1fafe31a9e09346bdebca4f0d6f9. Before that
> >> +qemuAssignDevicePCISlots() was never called for ARM "virt" machine.
> >> +
> >> +Upstream-status: Accepted
> >> +[
> >>
> https://libvirt.org/git/?p=libvirt.git;a=commit;h=d526e37bad2515cf91caa0e4ff3edaf41e45b5c2
> >> ]
> >> +
> >> +Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> >> +---
> >> + src/qemu/qemu_command.c | 11 +++++++++--
> >> + src/qemu/qemu_command.h |  1 +
> >> + 2 files changed, 10 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c
> >> +index b56670c..25f57f2 100644
> >> +--- a/src/qemu/qemu_command.c
> >> ++++ b/src/qemu/qemu_command.c
> >> +@@ -2261,7 +2261,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> >> +                 virDomainPCIAddressReserveNextSlot(addrs, &info,
> flags)
> >> < 0)
> >> +                 goto cleanup;
> >> +
> >> +-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
> >> ++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
> >> +                 goto cleanup;
> >> +
> >> +             for (i = 1; i < addrs->nbuses; i++) {
> >> +@@ -2294,7 +2294,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> >> +             if (qemuValidateDevicePCISlotsChipsets(def, qemuCaps,
> addrs)
> >> < 0)
> >> +                 goto cleanup;
> >> +
> >> +-            if (qemuAssignDevicePCISlots(def, addrs) < 0)
> >> ++            if (qemuAssignDevicePCISlots(def, qemuCaps, addrs) < 0)
> >> +                 goto cleanup;
> >> +
> >> +             for (i = 0; i < def->ncontrollers; i++) {
> >> +@@ -2426,6 +2426,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPtr def,
> >> +  */
> >> + int
> >> + qemuAssignDevicePCISlots(virDomainDefPtr def,
> >> ++                         virQEMUCapsPtr qemuCaps,
> >> +                          virDomainPCIAddressSetPtr addrs)
> >> + {
> >> +     size_t i, j;
> >> +@@ -2618,6 +2619,12 @@ qemuAssignDevicePCISlots(virDomainDefPtr def,
> >> +             VIR_DOMAIN_DEVICE_ADDRESS_TYPE_CCW)
> >> +             continue;
> >> +
> >> ++        /* Also ignore virtio-mmio disks if our machine allows them */
> >> ++        if (def->disks[i]->info.type ==
> >> ++            VIR_DOMAIN_DEVICE_ADDRESS_TYPE_VIRTIO_MMIO &&
> >> ++            virQEMUCapsGet(qemuCaps, QEMU_CAPS_DEVICE_VIRTIO_MMIO))
> >> ++            continue;
> >> ++
> >> +         if (def->disks[i]->info.type !=
> >> VIR_DOMAIN_DEVICE_ADDRESS_TYPE_NONE) {
> >> +             virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
> >> +                            _("virtio disk cannot have an address of
> type
> >> '%s'"),
> >> +diff --git a/src/qemu/qemu_command.h b/src/qemu/qemu_command.h
> >> +index 767d31f..4aa7f2d 100644
> >> +--- a/src/qemu/qemu_command.h
> >> ++++ b/src/qemu/qemu_command.h
> >> +@@ -284,6 +284,7 @@ virDomainPCIAddressSetPtr
> >> qemuDomainPCIAddressSetCreate(virDomainDefPtr def,
> >> +                                                         bool dryRun);
> >> +
> >> + int qemuAssignDevicePCISlots(virDomainDefPtr def,
> >> ++                             virQEMUCapsPtr qemuCaps,
> >> +                              virDomainPCIAddressSetPtr addrs);
> >> +
> >> + int qemuAssignDeviceAliases(virDomainDefPtr def, virQEMUCapsPtr
> >> qemuCaps);
> >> +--
> >> +1.9.1
> >> +
> >> diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb
> >> b/recipes-extended/libvirt/libvirt_1.2.19.bb
> >> index df53d59..774eea4 100644
> >> --- a/recipes-extended/libvirt/libvirt_1.2.19.bb
> >> +++ b/recipes-extended/libvirt/libvirt_1.2.19.bb
> >> @@ -33,6 +33,7 @@ SRC_URI = "
> >> http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
> >>              file://libvirt-use-pkg-config-to-locate-libcap.patch \
> >>              file://0001-to-fix-build-error.patch \
> >>              file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
> >> +
> >>   file://Ignore-virtio-mmio-disks-in-qemuAssignDevicePCISlots.patch \
> >>             "
> >>
> >>   SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>
> >
> >
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11353a2c8caf11052fe643a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 7, 2016 at 5:13 AM, Bogdan Purcareata <span dir=3D"ltr">&lt=
;<a href=3D"mailto:bogdan.purcareata@nxp.com" target=3D"_blank">bogdan.purc=
areata@nxp.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On 07.04.2016 09:57, Bruce Ashfield wrote:<br>
&gt; On Tue, Apr 5, 2016 at 11:48 AM, Bogdan Purcareata &lt;<br>
&gt; <a href=3D"mailto:bogdan.purcareata@nxp.com">bogdan.purcareata@nxp.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Patch contains a more detailed description. Basically allows addin=
g<br>
&gt;&gt; virtio-mmio<br>
&gt;&gt; block device to QEMU guests. Tested on ARM64.<br>
&gt;&gt;<br>
&gt;&gt; Please apply on jethro branch.<br>
&gt;&gt;<br>
&gt;<br>
&gt; We don&#39;t want to create functionality on old branches that isn&#39=
;t also on<br>
&gt; master.<br>
&gt; Is there any reason why this wouldn&#39;t be applicable to master as w=
ell ?<br>
<br>
</span>Master delivers libvirt 1.3.2 [1] which has this patch included:<br>
<br>
[libvirt]$ git checkout v1.3.2 &amp;&amp; git log --pretty=3Doneline | grep=
 &quot;Ignore<br>
virtio-mmio&quot;<br>
d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Ignore virtio-mmio disks in<br>
qemuAssignDevicePCISlots()<br></blockquote><div><br><br></div><div>Great. J=
ust what I was looking for .. I hadn&#39;t looked all the way down into the=
 embedded <br>patch, where I see the info was included via the upstream sta=
tus.<br><br></div><div>merged to jethro.<br><br></div><div>Bruce<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<br>
[1]<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/t=
ree/recipes-extended/libvirt" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extende=
d/libvirt</a><br>
<br>
Thank you,<br>
Bogdan P.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purc=
areata@nxp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...io-mmio-disks-in-qemuAssignDevicePCISlots.patch | 8=
1<br>
&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.2=
.19.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 82 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt;&gt; recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qemuA=
ssignDevicePCISlots.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qem=
uAssignDevicePCISlots.patch<br>
&gt;&gt; b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qem=
uAssignDevicePCISlots.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..f0b7ab5<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/recipes-extended/libvirt/libvirt/Ignore-virtio-mmio-disks-in-qem=
uAssignDevicePCISlots.patch<br>
&gt;&gt; @@ -0,0 +1,81 @@<br>
&gt;&gt; +From d526e37bad2515cf91caa0e4ff3edaf41e45b5c2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Pavel Fedin &lt;<a href=3D"mailto:p.fedin@samsung.com">p.fe=
din@samsung.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 9 Sep 2015 15:02:53 +0300<br>
&gt;&gt; +Subject: [PATCH] Ignore virtio-mmio disks in qemuAssignDevicePCIS=
lots()<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes the following error when attempting to add a disk with bus=
=3D&#39;virtio&#39;<br>
&gt;&gt; +to a machine which actually supports virtio-mmio (caught with ARM=
 virt):<br>
&gt;&gt; +<br>
&gt;&gt; +virtio disk cannot have an address of type &#39;virtio-mmio&#39;<=
br>
&gt;&gt; +<br>
&gt;&gt; +The problem has been likely introduced by<br>
&gt;&gt; +e8d55172544c1fafe31a9e09346bdebca4f0d6f9. Before that<br>
&gt;&gt; +qemuAssignDevicePCISlots() was never called for ARM &quot;virt&qu=
ot; machine.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-status: Accepted<br>
&gt;&gt; +[<br>
&gt;&gt; <a href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dcommit;h=
=3Dd526e37bad2515cf91caa0e4ff3edaf41e45b5c2" rel=3D"noreferrer" target=3D"_=
blank">https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dcommit;h=3Dd526e37bad25=
15cf91caa0e4ff3edaf41e45b5c2</a><br>
&gt;&gt; ]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Pavel Fedin &lt;<a href=3D"mailto:p.fedin@samsung.=
com">p.fedin@samsung.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/qemu/qemu_command.c | 11 +++++++++--<br>
&gt;&gt; + src/qemu/qemu_command.h |=C2=A0 1 +<br>
&gt;&gt; + 2 files changed, 10 insertions(+), 2 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c<br=
>
&gt;&gt; +index b56670c..25f57f2 100644<br>
&gt;&gt; +--- a/src/qemu/qemu_command.c<br>
&gt;&gt; ++++ b/src/qemu/qemu_command.c<br>
&gt;&gt; +@@ -2261,7 +2261,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPt=
r def,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vir=
DomainPCIAddressReserveNextSlot(addrs, &amp;info, flags)<br>
&gt;&gt; &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0got=
o cleanup;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePC=
ISlots(def, addrs) &lt; 0)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePC=
ISlots(def, qemuCaps, addrs) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0got=
o cleanup;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &=
lt; addrs-&gt;nbuses; i++) {<br>
&gt;&gt; +@@ -2294,7 +2294,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPt=
r def,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemuValidateD=
evicePCISlotsChipsets(def, qemuCaps, addrs)<br>
&gt;&gt; &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0got=
o cleanup;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePC=
ISlots(def, addrs) &lt; 0)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemuAssignDevicePC=
ISlots(def, qemuCaps, addrs) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0got=
o cleanup;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &=
lt; def-&gt;ncontrollers; i++) {<br>
&gt;&gt; +@@ -2426,6 +2426,7 @@ qemuDomainAssignPCIAddresses(virDomainDefPt=
r def,<br>
&gt;&gt; +=C2=A0 */<br>
&gt;&gt; + int<br>
&gt;&gt; + qemuAssignDevicePCISlots(virDomainDefPtr def,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0virQEMUCapsPtr qemuCaps,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainPCIAddressSetPtr addrs)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0size_t i, j;<br>
&gt;&gt; +@@ -2618,6 +2619,12 @@ qemuAssignDevicePCISlots(virDomainDefPtr d=
ef,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_DOMAIN_DEVICE=
_ADDRESS_TYPE_CCW)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Also ignore virtio-mmio disks if =
our machine allows them */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (def-&gt;disks[i]-&gt;info.type =
=3D=3D<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VIR_DOMAIN_DEVICE_ADDR=
ESS_TYPE_VIRTIO_MMIO &amp;&amp;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virQEMUCapsGet(qemuCap=
s, QEMU_CAPS_DEVICE_VIRTIO_MMIO))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (def-&gt;disks[i]-&gt;info.t=
ype !=3D<br>
&gt;&gt; VIR_DOMAIN_DEVICE_ADDRESS_TYPE_NONE) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VI=
R_ERR_CONFIG_UNSUPPORTED,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _(&quot;virtio disk cannot have an addre=
ss of type<br>
&gt;&gt; &#39;%s&#39;&quot;),<br>
&gt;&gt; +diff --git a/src/qemu/qemu_command.h b/src/qemu/qemu_command.h<br=
>
&gt;&gt; +index 767d31f..4aa7f2d 100644<br>
&gt;&gt; +--- a/src/qemu/qemu_command.h<br>
&gt;&gt; ++++ b/src/qemu/qemu_command.h<br>
&gt;&gt; +@@ -284,6 +284,7 @@ virDomainPCIAddressSetPtr<br>
&gt;&gt; qemuDomainPCIAddressSetCreate(virDomainDefPtr def,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool dryR=
un);<br>
&gt;&gt; +<br>
&gt;&gt; + int qemuAssignDevicePCISlots(virDomainDefPtr def,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virQEMUCapsPtr qemuCaps,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainPCIAddressSetPtr addrs);=
<br>
&gt;&gt; +<br>
&gt;&gt; + int qemuAssignDeviceAliases(virDomainDefPtr def, virQEMUCapsPtr<=
br>
&gt;&gt; qemuCaps);<br>
&gt;&gt; +--<br>
&gt;&gt; +1.9.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.=
2.19.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
&gt;&gt; b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" re=
l=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
&gt;&gt; index df53d59..774eea4 100644<br>
&gt;&gt; --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb=
" rel=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
&gt;&gt; +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb=
" rel=3D"noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a><br>
&gt;&gt; @@ -33,6 +33,7 @@ SRC_URI =3D &quot;<br>
&gt;&gt; <a href=3D"http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=3D=
libvirt" rel=3D"noreferrer" target=3D"_blank">http://libvirt.org/sources/li=
bvirt-${PV}.tar.gz;name=3Dlibvirt</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirt-use=
-pkg-config-to-locate-libcap.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-to-fix=
-build-error.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Revert-buil=
d-add-prefix-to-SYSTEMD_UNIT_DIR.patch \<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0file://Ignore-virtio-mmio-disks-in-qemuAssignDevicePCI=
Slots.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI[libvirt.md5sum] =3D &quot;bc3ab1ba5b6fabd2e451=
6c70ddd4d97c&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 1.9.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/l=
istinfo/meta-virtualization</a><br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div cl=
ass=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end&quot;</div>
</div></div>

--001a11353a2c8caf11052fe643a6--
