Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ACCCE011AB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2013 05:58:33 -0800 (PST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jan 2013 05:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="277598488"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2013 05:58:31 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 16 Jan 2013 13:58:30 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Wed, 16 Jan 2013 13:58:30 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: lei yang <lei.yang@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH v2 2/2] Created new
	target:kvm-image-minimal
Thread-Index: AQHN8BiHtWdZ/usQO028YMJ+BamZwphEXrgAgAXaMOCAARnRgIAAr6lA
Date: Wed, 16 Jan 2013 13:58:30 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF905906@IRSMSX101.ger.corp.intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
	<50F04908.2020103@windriver.com>
	<97BD068FB200C44AA73C2B641F162ECF8FC42C@IRSMSX101.ger.corp.intel.com>
	<50F61E35.9000204@windriver.com>
In-Reply-To: <50F61E35.9000204@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Wed, 16 Jan 2013 13:58:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: lei yang [mailto:lei.yang@windriver.com]
> Sent: Wednesday, January 16, 2013 5:28 AM
> To: Prica, Mihai
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new target:kvm-=
image-
> minimal
>=20
> On 01/15/2013 06:44 PM, Prica, Mihai wrote:
> >> -----Original Message-----
> >> From: Lei Yang [mailto:lei.yang@windriver.com]
> >> Sent: Friday, January 11, 2013 7:17 PM
> >> To: Prica, Mihai
> >> Cc: meta-virtualization@yoctoproject.org
> >> Subject: Re: [meta-virtualization] [PATCH v2 2/2] Created new
> >> target:kvm-image- minimal
> >>
> >> On 01/12/2013 12:27 AM, Mihai Prica wrote:
> >>> Signed-off-by: Mihai Prica<mihai.prica@intel.com>
> >>> ---
> >>>    recipes-extended/images/kvm-image-minimal.bb |   28
> >> ++++++++++++++++++++++++++
> >>>    1 file changed, 28 insertions(+)
> >>>    create mode 100644 recipes-extended/images/kvm-image-minimal.bb
> >>>
> >>> diff --git a/recipes-extended/images/kvm-image-minimal.bb
> >>> b/recipes-extended/images/kvm-image-minimal.bb
> >>> new file mode 100644
> >>> index 0000000..275c43b
> >>> --- /dev/null
> >>> +++ b/recipes-extended/images/kvm-image-minimal.bb
> >>> @@ -0,0 +1,28 @@
> >>> +DESCRIPTION =3D "A minimal kvm image"
> >>> +
> >>> +IMAGE_INSTALL =3D " \
> >>> +    packagegroup-core-boot \
> >>> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> >>> +    qemu \
> >>> +    libvirt \
> >>> +    libvirt-libvirtd \
> >>> +    libvirt-virsh \
> >>> +    "
> >>> +
> >>> +IMAGE_FEATURES +=3D "ssh-server-openssh"
> >>> +
> >>> +IMAGE_LINGUAS =3D " "
> >>> +
> >>> +LICENSE =3D "MIT"
> >>> +
> >>> +inherit core-image
> >>> +
> >>> +IMAGE_ROOTFS_SIZE =3D "8192"
> >>> +
> >>> +ROOTFS_POSTPROCESS_COMMAND +=3D "remove_packaging_data_files ; "
> >>> +
> >>> +PACKAGE_INSTALL_ATTEMPTONLY =3D "\
> >> Hi Mibai
> >>
> >> can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see this
> >> variable first time
> > In an image recipe you can't use RRECOMMENDS to specify a list of packa=
ges
> that extend the usability of the image being built.  In this type of reci=
pe you can
> use PACKAGE_INSTALL_ATTEMPTONLY that has the same functionality.
>=20
> and I think both can be used, from below, it tells me, they can perform t=
he same
> function, do you try RRECOMEEDS and meet an error?

I tried using RRECOMMENDS. I didn't get any errors but the kernel modules w=
ere not loaded onto the image. I tried a number of times to be sure it's be=
cause of the shared state, but with the same result. With PACAKAGE_INSTALL_=
ATTEMPTONLY it worked.

>=20
> lyang001@lyang0-9010:~/intel-xeon-core/layers/oe-core/meta/classes$ cat
> image.bbclass |grep -E "^RRECOM|^PACKAGE_INSTALL_ATTEMPTONLY"
> RRECOMMENDS +=3D "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
> PACKAGE_INSTALL_ATTEMPTONLY ?=3D "${FEATURE_INSTALL_OPTIONAL}"
>=20
>=20
>   Lei
>=20
>=20
>=20
> > Thanks,
> > Mihai
> >> Lei
> >> :-)
> >>
> >>> +    kernel-module-kvm \
> >>> +    kernel-module-kvm-intel \
> >>> +    kernel-module-kvm-amd \
> >>> +    "


