Return-Path: <Ben.Warren@spidercloud.com>
Received: from berg.int.copivia.com (mail.spidercloud.com [209.49.242.60])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73B6AE0051D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:01:21 -0700 (PDT)
Received: from mailx.spidercloud.com ([10.1.1.225])
	by berg.int.copivia.com (8.13.8/8.13.8) with ESMTP id r4GL1KUY008549
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:01:21 -0700
Received: from sofia.us.spidercloud.com ([10.1.1.225]) by
	sofia.us.spidercloud.com ([10.1.1.225]) with mapi;
	Thu, 16 May 2013 14:01:21 -0700
From: Ben Warren <Ben.Warren@spidercloud.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Date: Thu, 16 May 2013 14:01:19 -0700
Thread-Topic: meta-virtualization Digest, Vol 6, Issue 4
Thread-Index: Ac5SeIPtBELOLDylTtGrAszdcCqYRg==
Message-ID: <9D709999-1879-49C8-A4ED-B91B8DCB2500@spidercloud.com>
References: <mailman.1.1368126001.16184.meta-virtualization@yoctoproject.org>
In-Reply-To: <mailman.1.1368126001.16184.meta-virtualization@yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: meta-virtualization Digest, Vol 6, Issue 4
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
X-List-Received-Date: Thu, 16 May 2013 21:01:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

A week's gone by and nothing but crickets.  Does anybody have an idea of wh=
at might be causing this build problem?  I'm not trying to do anything exot=
ic, just add meta-virtualization support to a bare-bones crystalforest (low=
 power Xeon)-based platform.  The host is Ubuntu 12.10 64-bit.

thanks,
Ben =20

> Date: Wed, 8 May 2013 13:57:45 -0700
> From: Ben Warren <Ben.Warren@spidercloud.com>
> To: "meta-virtualization@yoctoproject.org"
> 	<meta-virtualization@yoctoproject.org>
> Subject: [meta-virtualization] `virNetTLSInit' link error when
> 	building	libvirt
> Message-ID: <89EFFFA7-0CB8-409C-BF0F-2355ED1BA0FD@spidercloud.com>
> Content-Type: text/plain; charset=3D"Windows-1252"
>=20
> Hello,
>=20
> I'm trying to add virtualization support to my Yocto project and can't ge=
t libvirt to build.  In particular, the following link error occurs:
>=20
> | ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'
> | collect2: error: ld returned 1 exit status
>=20
> Looking at the code, this function is conditionally compiled as:
>=20
> #ifdef WITH_GNUTLS
>    virNetTLSInit();
> #endif
>=20
> and the function itself is here:
> libvirt-1.0.3/src/rpc/virnettlscontext.c
>=20
> I don't see any .o files in that 'rpc' directory, so it appears that the =
files aren't being compiled, hence the link error.
>=20
> I'm using the following code revisions:
> 	? poky @ git tag 'dylan 9.0.0'
> 	? meta-virtualization @ git commit 22e7b5e92b33e5fe18723083ce69867749839=
894 (5/3/2013)
> 	? meta-oa @ git commit a8b96b69bd418b74f48dc4d111caac676ae667f5 (4/27/20=
13 from git://github.com/openembedded/meta-oe.git)
>=20
> My build command line is:
>=20
> MACHINE=3Dscw-appscard bitbake kvm-image-minimal
>=20
> where the 'scw_appscard' BSP is identical to 'crystalforest' (x86_64) wit=
h some kernel config modifications.
>=20
> My bblayers are:
> BBLAYERS ?=3D " \
>  /opt/poky/meta \
>  /opt/poky/meta-yocto \
>  /opt/poky/meta-yocto-bsp \
>  /opt/meta-oe/meta-oe \
>  /opt/meta-oe/meta-networking \
>  /opt/meta-virtualization \
>  /opt/meta-scw-appscard \
>  "
>=20
> Does anybody have insight as to why this won't build?
>=20
> thanks,
> Ben
>=20
> ------------------------------
>=20
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20


