Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BF8EE0206
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 17:39:15 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.27968.1726076348934486122
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 10:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 48BHc3r5009572;
	Wed, 11 Sep 2024 12:38:04 -0500
Received: from [192.168.2.37] ([192.168.2.37])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 48BHc346023681;
	Wed, 11 Sep 2024 12:38:03 -0500
Message-ID: <06d86796-518e-49ff-b287-0c33fbcf9757@kernel.crashing.org>
Date: Wed, 11 Sep 2024 12:38:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][2024.2][PATCH v2] u-boot-xlnx-scr.bbappend:
 Enable xen boot script using variable
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, mark.hatle@amd.com
References: <20240905122652.793160-1-johnvicky.vykuntapu@amd.com>
 <CADkTA4N+L=guRkgV+GE5wCj8gXCGYeG9qgusRh+7tLZu9JXAJw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CADkTA4N+L=guRkgV+GE5wCj8gXCGYeG9qgusRh+7tLZu9JXAJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 48BHc3r5009572
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 17:39:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8885

Sorry should be for both master and scarthgap.  I've not tried it elsewhe=
re..  I=20
did not build it on master, only scarthgap -- but the code affected is th=
e same=20
in both.

--Mark

On 9/11/24 12:35 PM, Bruce Ashfield wrote:
> On Wed, Sep 11, 2024 at 1:21=E2=80=AFPM Mark Hatle <mark.hatle@kernel.c=
rashing.org=20
> <mailto:mark.hatle@kernel.crashing.org>> wrote:
>=20
>     From: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com
>     <mailto:johnvicky.vykuntapu@amd.com>>
>=20
>     Xen related boot script offset was override from
>     meta-virtualization for non xen builds.
>=20
>     ERROR: RD image overlaps OS image (OS=3D0xe00000..0x2610000)
>=20
>     Add to include xen boot script only if ENABLE_XEN_UBOOT_SCR variabl=
e
>     set from the configuration file and xen enabled in DISTRO_FEATURES =
to
>     avoid override.
>=20
>     Signed-off-by: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com
>     <mailto:johnvicky.vykuntapu@amd.com>>
>     Signed-off-by: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@am=
d.com>>
>     ---
>     (v1 was directly sent to Bruce)
>=20
>     Update in v2: Added "and" condition between xen distro enable and
>     the ENABLE_XEN_UBOOT_SCR variable is set from the configuration fil=
e
>=20
>=20
> Is this for master ? or master=C2=A0+ a -stable branch ?
>=20
> Bruce
>=20
>     ---
>      =C2=A0.../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend=C2=A0=
 =C2=A0 =C2=A0 | 6 ++++--
>      =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
>     diff --git
>     a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     index ae847cb..819a0c6 100644
>     --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbap=
pend
>     +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbap=
pend
>     @@ -1,2 +1,4 @@
>     -# Include xen-boot-cmd.inc only if xen distro features is enabled.
>     -include ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen-boot-c=
md.inc',
>     '', d)}
>     +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set fro=
m
>     configuration
>     +# file and xen enabled in DISTRO_FEATURES.
>     +ENABLE_XEN_UBOOT_SCR ?=3D ""
>     +include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =
=3D=3D '1'
>     and bb.utils.contains('DISTRO_FEATURES', 'xen', true, false, d) els=
e ''}
>     --=20
>     2.44.1
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at=20
> its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

