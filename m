Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F1DEE00709
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 04:06:40 -0800 (PST)
Received: by mail-pb0-f51.google.com with SMTP id ro12so10019358pbb.24
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JIzneNdVI/XNe2Ve+RRIPAI3ZUjm1awNssOZjGB0SZw=;
	b=KbtZ7Nii/vk+gxZxl+zezs1CnflX2XMRbsJO2jGSPOZKtERohVIZsXofrsf0YgvxKu
	eRLPYsfnFP65uc/u2bj9GLrkKhRdo+AzmTx8K0LWd+Yee58jEz33Is/W5kUi8IeIi0yL
	Ef8iOE3A/hCDWmV3KE1BEl5oWoBMzx1QiK32UQcpF+T7kNuJy1aRefHWGemf3YZIvwY2
	p8gSnztLLVt9V0KzmyRcODOibmlnkliymbbGLC0cZVtH89ndTucFG0HYZZuK/dtFG948
	3gDeHipVl8wJdWQor7MVLcVM3pcdiajrgeh3X1NNGcg/alUxO9/97oHjbqXkXpcGzIn8
	DVxg==
X-Received: by 10.66.88.198 with SMTP id bi6mr169081269pab.54.1357474000382;
	Sun, 06 Jan 2013 04:06:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id p10sm36746837pax.27.2013.01.06.04.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:06:39 -0800 (PST)
Date: Sun, 6 Jan 2013 13:06:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106120638.GE3272@jama>
References: <1357460412-11889-1-git-send-email-lei.yang@windriver.com>
	<50E966F7.1040909@gmail.com>
MIME-Version: 1.0
In-Reply-To: <50E966F7.1040909@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sun, 06 Jan 2013 05:13:14 -0800
Cc: meta-virtualization@yoctoproject.org, Joe.MacDonald@windriver.com
Subject: Re: [oe] [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Sun, 06 Jan 2013 12:06:40 -0000
X-Groupsio-MsgNum: 144
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 12:58:47PM +0100, David Nystr=F6m wrote:
> On 01/06/2013 09:20 AM, lei.yang@windriver.com wrote:
> > +SECTION =3D "console/network"
> > +inherit update-alternatives gettext
> > +
> > +ALTERNATIVE_${PN} =3D "nc"
> > +ALTERNATIVE_PRIORITY =3D "100"
>=20
> This means that both versions of netcat have alt. prio 100. what happens=
=20
> when both are installed on the rootfs at the same time. where does the=20
> symlink point ?

The one installed later (at least for opkg implementation).=20
So it's better to change it to different number.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpaM4ACgkQN1Ujt2V2gBwcIgCfSoEhe235LDeMQ5vgqbDhk9ra
yDAAn23kWe+nqaIwJZyZhbjbu7A4QHWA
=e+MI
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
