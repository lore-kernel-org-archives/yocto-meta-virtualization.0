Subject: Re: [PATCH 1/3] xen-tools: Load xen related kernel modules during system boot
To: meta-virtualization@lists.yoctoproject.org
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
X-Originating-Location: Manchester, England, GB (217.140.99.251)
X-Originating-Platform: Linux Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Dec 2021 04:08:03 -0800
References: <CACMJ4GaWgstGJ6dSL2bb7f8u3esuBf0eY2G0md37_-e3qRs4zg@mail.gmail.com>
In-Reply-To: <CACMJ4GaWgstGJ6dSL2bb7f8u3esuBf0eY2G0md37_-e3qRs4zg@mail.gmail.com>
Message-ID: <14286.1639051683388035931@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="GrjEbooFxRdHnuvsAUQi"

--GrjEbooFxRdHnuvsAUQi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

>=20
>=20
>=20
> Is there any reason that you chose=C2=A0to drop specifying the install
> directory via the flags passed to EXTRA_OECONF?
>=20
>=20

I have dropped setting install directory, because it seemed for me to be re=
dundant,

but I missed the case, when user customize exec_prefix or nonarch_libdir, s=
o I will apply your suggestion.

Thanks, Kamil

--GrjEbooFxRdHnuvsAUQi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Christopher,</p>
<blockquote>
<p>Is there any reason that you chose&nbsp;to drop specifying the install d=
irectory via the flags passed to EXTRA_OECONF?</p>
</blockquote>
<p>I have dropped setting install directory, because it seemed for me to be=
 redundant,</p>
<p>but I missed the case, when user customize exec_prefix or nonarch_libdir=
, so I will apply your suggestion.<br /><br />Thanks, Kamil</p>

--GrjEbooFxRdHnuvsAUQi--
