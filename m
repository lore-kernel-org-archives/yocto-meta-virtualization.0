Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2551DE009B2; Tue,  7 Mar 2017 07:10:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EFC6E0052B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Mar 2017 07:10:52 -0800 (PST)
Received: by mail-ua0-f195.google.com with SMTP id f54so945856uaa.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Mar 2017 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=V+dmJ1t6X6rzHOlpvmOn9WCvFqFx4Ad0RdMkQtRLjqw=;
	b=GBJUNHEPqgCPzCycEXAvkx0UU/ZrUvIYQyzjSZCtJy3S2UAWCnfpGGNZr2QP5qTdGU
	Ld5JURDsX0XCgJEFrZRPaFz224uM7oXzQuUAR1gjINpDVSNR4S414E80+qEZvM1s+eeJ
	TJaid2O9/ZjgvHJqfO1xsXGmzWZeYQGdmmvbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=V+dmJ1t6X6rzHOlpvmOn9WCvFqFx4Ad0RdMkQtRLjqw=;
	b=N+dTxh31aK+Ct3LuopnmE/HalUVlEGe+v5gc+1wr5CnanCA3mtc3VQaPCwzZd1LVad
	N9NCghcbW16vn5OCziEIhC+ZLY7gQWHG2uRFK5azADI5tErEse/04UwVOcZPR3TLYSO9
	VfkeOBL0AKDUCaLvrc3cNuEHtoVbJMs69LtwZ2NliytydGeKzpPp7DVfyt1wxRivVykT
	s5pKIQoFR1YqifYF135qTOqiisd4AdgjCW/PbiR0/KE8eqX4NHoRc/laJqxaUKkmfyLf
	v36pxAuZ8rA4zYRTcNtF2DroOBioBauWMtgqcah1P0vll5ZJQa9flmFl4FTIImKWnL+d
	S9LQ==
X-Gm-Message-State: AMke39lO7Tqi2XqxO/kB55NB1ee89CIp68MvH//W0ZaG9aQZk+n+lXE6Lo3KlRLHXwzmnA==
X-Received: by 10.37.64.5 with SMTP id n5mr327381yba.166.1488899451342;
	Tue, 07 Mar 2017 07:10:51 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	w124sm103973ywa.8.2017.03.07.07.10.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 07:10:50 -0800 (PST)
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
	meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
	meta-virtualization@yoctoproject.org, matha@xilinx.com,
	Alistair Francis <alistair23@gmail.com>
References: <CAFL6qn435A8JDM30SnfJ9TyxnRiRAm2fD0bUEysSiVn7W+fwQA@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <47c53fbd-57ec-d7e5-a45a-2298fa1cee2a@cardoe.com>
Date: Tue, 7 Mar 2017 09:10:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFL6qn435A8JDM30SnfJ9TyxnRiRAm2fD0bUEysSiVn7W+fwQA@mail.gmail.com>
Subject: Re: Building a Xen image on Yocto for ZCU102 board
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
X-List-Received-Date: Tue, 07 Mar 2017 15:10:54 -0000
X-Groupsio-MsgNum: 2465
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="kJ0fELhaL0e5JHC7UXkjUWb5DlOl7TdxR"

--kJ0fELhaL0e5JHC7UXkjUWb5DlOl7TdxR
Content-Type: multipart/mixed; boundary="6aiMgjJoFIEo1qLwev4SpLAc9sW154SEr";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
 meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
 meta-virtualization@yoctoproject.org, matha@xilinx.com,
 Alistair Francis <alistair23@gmail.com>
Message-ID: <47c53fbd-57ec-d7e5-a45a-2298fa1cee2a@cardoe.com>
Subject: Re: Building a Xen image on Yocto for ZCU102 board
References: <CAFL6qn435A8JDM30SnfJ9TyxnRiRAm2fD0bUEysSiVn7W+fwQA@mail.gmail.com>
In-Reply-To: <CAFL6qn435A8JDM30SnfJ9TyxnRiRAm2fD0bUEysSiVn7W+fwQA@mail.gmail.com>

--6aiMgjJoFIEo1qLwev4SpLAc9sW154SEr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 3/7/17 3:41 AM, Pello Heriz wrote:
> Hi all,
>=20
> as you know, I'm trying to build a Xen image using Yocto master branch
> for ZCU102 board.
>=20
> I have been experimenting some errors during the last days when I have
> tried to execute bitbake xen-image-minimal command.
>=20
> Some of you have told me to change to a stable branch in order to don't=

> have errors, but some weeks ago I tried to build a core-image-minimal
> for ZCU102 using Morty branch and I couldn't. I think that this branch
> has not enough support in order to build images for this (ZCU102)
> target. Anyway if this information is not correct, I need to test the
> image using QEMU emulator, and this also would't be possible with Morty=

> for the ZCU102 board case.

I can build for the zcu102 for krogoth and morty so support is certainly
there. I couldn't guess what issue you ran into however.

>=20
> In the other hand, when I try to execute xen-image-minimal using master=

> branch, I experimented this error:
>=20
> Txertatutako irudia 1

A screenshot is really not helpful. You've also snipped out any of the
context so its impossible to say why it failed.


>=20
> As you can see, it's an error related to compilation. I have read that
> the error can be due to the GCC compiler version in the next
> link: https://lists.yoctoproject.org/pipermail/meta-virtualization/2015=
-December/001589.html
> Could this be the problem? If yes, how can I solve it? in which file do=

> I need to change the compiler version I want to use?

No way of knowing. Its likely not the issue. The issue is most likely
related to the fact that Yocto master uses a newer version of GCC than
is supported by the Xen 4.8 release. There's probably some new warnings
added that are causing the issue but again there's no context in your
bug report so its impossible to tell.

>=20
> On the other side, do I need to include meta-petalinux layer in my
> project in order to use Xen? That's what I have read in the next link:
> http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Flow
> This link also says that the used machine can be qemuzynqmp and that's
> not correct. In my case, I'm trying to build the image using
> zcu102-zynqmp machine.

In one of your previous emails I mentioned that I am able to build for
the qemu Zynq target without meta-petalinux so that should not be
necessary. PetaLinux is just Xilinx's flavor of Yocto and includes a lot
of software packages they promote.

> Anyway, if I include meta-petalinux layer on my project, I got an error=

> related to qt5. I have tried to include meta-qt5 layer too, but I got
> the next error:
>=20
> Txertatutako irudia 2

Once again this screenshot snips out any of the context about the issue
so its impossible to tell. I can tell you from the warnings about using
deprecated things that this layer is likely not meant to be built with
Yocto master and will likely fail.


>=20
> Other thing that I have read that I need to add to my project in order
> to configure the kernel for using Xen, has been to append in the
> local.conf file the DISTRO_FEATURES_append =3D " xen". I also have done=

> this, but the bitbake result was the same as first reported image where=

> it says that has occurred a compilation error.
>=20
> So can anybody answer this questions please?

I'm not really sure what the above means.

>=20
> Just for adding some more information, the layers that I have add in my=

> bblayers file are the next:
>=20
> BBLAYERS ?=3D " \
>   /opt/yocto_GE/yocto_master_v2/poky/meta \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-poky \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-yocto-bsp \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-xilinx \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-virtualization \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-oe \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-networking =
\
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-filesystems=
 \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-python \
>   /opt/yocto_GE/yocto_master_v2/poky/oe-meta-go \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-selinux \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-petalinux \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-qt5 \
>   "=20

If you're just trying to build a basic Xen image you've got a lot of
unnecessary layers which can certainly contribute to problems.

--=20
Doug Goldstein


--6aiMgjJoFIEo1qLwev4SpLAc9sW154SEr--

--kJ0fELhaL0e5JHC7UXkjUWb5DlOl7TdxR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYvs14XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUJNAQAJU70u+69V9TyEn0Lyk4cFpZ
bLogZZbp9wHtMhILyFuI2ncgkNmXWMgoVovDtBSUMQIVGmGfHBlxR6JHazL/VZqX
p0tqG11Nx/MQ6TKrR7YYnDVIHXUWKpIJzQHF9C5mJRnnPxHElNN66fOfpc66rKo6
2TBuGAxtGuSEr6m2QZ2C8Vh3r5YtXffYeLVxg3++ai9z+4eQHyoaRQfgduJ+M2So
TbHrFmrO57cKfhfgJkNCaos4e69LLAaK7SnGpv8FFcI3CMT22HWti8isJXc9NOdl
xql4oeBzacNMwwHO+1CH32B1XEY0I0iuhPXLI83Hbbf74JUCXjRAPw08Nn6nMeD4
18QfHXLUi+5j3iZV1XTZssxoirZ3VqOb8eheXsK+N+bfYQWt2+Lmpz58gGDccDdx
p3Xp17vBdVOMp+fmHK6DdxHZEk0gTQio8FR8HIkh6sSA1kYRZHnqFGO5YFtej2O0
XKcpFRawK5VRhJql95FW+w5dEnI22qp/G7Zw/MNNwqbe6Ns8EWxQgtmdaqXSONds
Uh/Uul3ao9Xv/x+HqJEUeFk56n0uz9GcuwSgfMJ6F4b+9VwUTdWWOAuQk6fJ+9fY
MvuqxMz0eAGeES2eTufd+UloUhdp7Ep2ibZbgri774swo9AAZwWiNm8FsYmhdTNU
nMZTK05sGoj8juhOsxUX
=tyAo
-----END PGP SIGNATURE-----

--kJ0fELhaL0e5JHC7UXkjUWb5DlOl7TdxR--
