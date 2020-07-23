Subject: Re: Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: "Ashish" <ashishm@mvista.com>
X-Originating-Location: Thane, Maharashtra, IN (139.5.45.149)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jul 2020 04:57:16 -0700
References: <CAEkELtCLCEar4fLH=jp7kJTarUb-h_Fkceyi7F2jd6y6U1891A@mail.gmail.com>
In-Reply-To: <CAEkELtCLCEar4fLH=jp7kJTarUb-h_Fkceyi7F2jd6y6U1891A@mail.gmail.com>
Message-ID: <27576.1595505436667253209@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="Sq766fjgtcS6rAXsGfVF"

--Sq766fjgtcS6rAXsGfVF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Based on my understanding , it seems problem with your network
( *fatal: read error: Connection reset by peer* )

Can you try just fetching all the prerequisites first :
$ bitbake -c cleanall linux-raspberrypi
$ bitbake -c fetch linux-raspberrypi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ( Fetch only Linux )
or
$ bitbake -c fetchall xen-image-minimal=C2=A0 =C2=A0 ( Fetch all packages =
for concerned image )

--Sq766fjgtcS6rAXsGfVF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Based on my understanding , it seems problem with your network <br />(<span=
 style=3D"text-decoration: underline;"><strong> fatal: read error: Connecti=
on reset by peer</strong></span> )<br /><br />Can you try just fetching all=
 the prerequisites first :<br />&nbsp; &nbsp; $ bitbake -c cleanall linux-r=
aspberrypi<br />&nbsp; &nbsp;&nbsp;$ bitbake -c fetch linux-raspberrypi&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ( Fetch only Linux )<br />&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; or&nbsp;<br />&nbsp; &n=
bsp;&nbsp;$ bitbake -c fetchall xen-image-minimal&nbsp; &nbsp; ( Fetch all =
packages for concerned image )<br /><br /><br />

--Sq766fjgtcS6rAXsGfVF--
