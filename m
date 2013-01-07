Return-Path: <B29882@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe004.messaging.microsoft.com [216.32.180.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D8ACE01461
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 12:26:43 -0800 (PST)
Received: from mail198-va3-R.bigfish.com (10.7.14.253) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.23; Mon, 7 Jan 2013 20:26:42 +0000
Received: from mail198-va3 (localhost [127.0.0.1])	by
	mail198-va3-R.bigfish.com (Postfix) with ESMTP id 1011D201D5;
	Mon,  7 Jan 2013 20:26:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1de0h1202h1e76h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758hbe9i1155h)
Received: from mail198-va3 (localhost.localdomain [127.0.0.1]) by mail198-va3
	(MessageSwitch) id 1357590400364199_29830;
	Mon,  7 Jan 2013 20:26:40 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.245])	by
	mail198-va3.bigfish.com (Postfix) with ESMTP id 50DA342027F;
	Mon,  7 Jan 2013 20:26:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 7 Jan 2013 20:26:40 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.21]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Mon, 7 Jan 2013 20:26:39 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 2/2] Created new
	target:kvm-image-minimal
Thread-Index: AQHN7RVLFH/zW7uy9kSHF2clh4s1gQ==
Date: Mon, 7 Jan 2013 20:26:38 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A818CA5@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-3-git-send-email-mihai.prica@intel.com>
	<CADkTA4N3E2JpKxm6tzBz6TOs0cAx+OkB_q2e+=bExLSgFUyPNg@mail.gmail.com>
In-Reply-To: <CADkTA4N3E2JpKxm6tzBz6TOs0cAx+OkB_q2e+=bExLSgFUyPNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Mon, 07 Jan 2013 23:26:27 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] Created new target:kvm-image-minimal
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 20:26:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5AD30CFD2A8DEE489CF57CD45EA6B865@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 7, 2013 at 7:47 AM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
>
>
> On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <mihai.prica@intel.com> wrote=
:
>>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>  recipes-extended/images/kvm-image-minimal.bb |   22
>> ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>>
>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
>> b/recipes-extended/images/kvm-image-minimal.bb
>> new file mode 100644
>> index 0000000..486cd9c
>> --- /dev/null
>> +++ b/recipes-extended/images/kvm-image-minimal.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "A minimal kvm image"
>> +
>> +IMAGE_INSTALL =3D " \
>> +    packagegroup-core-boot \
>
>
> Have you thought about an image variant that isn't actually bootable ? Th=
ere
> are
> quite a few use cases where having the build not depend on a kernel, but
> instead
> simply creates a userspace that can be booted via feeding an external ker=
nel
> directly to qemu on the command line.
>
> Not having the kernel decadency turns out to be quite useful when you wan=
t
> to
> build a KVM host and KVM guest kernel with different configurations, in a
> single
> build.

I've shared this with Bruce before so I thought I would share on this
list also. It's hacky and possibly not the way to go but we have been
doing this in a kvm image. Not the depends, and the post process
addition.

fsl-image-kvm.bb:

#
# Copyright (C) 2007 OpenedHand Ltd.
#
IMAGE_INSTALL =3D "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} u-b=
oot"
IMAGE_LINGUAS =3D " "

PR =3D "r1"

LICENSE =3D "MIT"

inherit core-image

IMAGE_ROOTFS_SIZE =3D "8192"

# remove not needed ipkg informations
ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; mkdir
${IMAGE_ROOTFS}/images; cp
${DEPLOY_DIR_IMAGE}/fsl-image-minimal-${MACHINE}.ext2.gz.u-boot
${IMAGE_ROOTFS}/images"

IMAGE_FSTYPES =3D "tar.gz ext2.gz.u-boot"

# pkgconfig is here for qemu, and it's not in DEPENDS because of multilib
# build issues. to fix later
IMAGE_INSTALL +=3D "pkgconfig qemu kernel-image"

do_rootfs[depends] +=3D "fsl-image-minimal:do_rootfs"

>
> Cheers,
>
> Bruce
>
>>
>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>> +    qemu \
>> +    libvirt \
>> +    libvirt-libvirtd \
>> +    libvirt-virsh \
>> +    "
>> +
>> +IMAGE_FEATURES +=3D "ssh-server-openssh"
>> +
>> +IMAGE_LINGUAS =3D " "
>> +
>> +LICENSE =3D "MIT"
>> +
>> +inherit core-image
>> +
>> +IMAGE_ROOTFS_SIZE =3D "8192"
>> +
>> +ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; "
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>=


