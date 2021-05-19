Subject: crun fetching problems #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: camorga1@gmail.com
X-Originating-Location: Odense, South Denmark, DK (5.103.15.60)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 May 2021 05:18:29 -0700
Message-ID: <y1Mg.1621426709451334377.jzDQ@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="fNO4wuPVRqXKoNV3Yndt"

--fNO4wuPVRqXKoNV3Yndt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have recently had some problems fetching crun in my project. After some =
debugging time today, I noticed that the problem was specifically libocispe=
c and the fact that they have renamed their only branch from master to main=
 ( https://github.com/containers/libocispec/commit/e9d10a610d95a3acd7713072=
410a2904f265d0c2 ) on the 15-05-21.
I have a fix and I'll send it as soon as I have it ready. However, I'm a f=
irst-time contributor here and I need to figure out the whole mechanism. Si=
nce the issue is sort of critical (IMHO), please feel free to go ahead and =
submit a patch before I get mine ready.

BR,
Carlos

--fNO4wuPVRqXKoNV3Yndt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I have recently had some problems fetching crun in my projec=
t. After some debugging time today, I noticed that the problem was specific=
ally libocispec and the fact that they have renamed their only branch from =
master to main (<a href=3D"https://github.com/containers/libocispec/commit/=
e9d10a610d95a3acd7713072410a2904f265d0c2" target=3D"_blank" rel=3D"noopener=
">https://github.com/containers/libocispec/commit/e9d10a610d95a3acd77130724=
10a2904f265d0c2</a>) on the 15-05-21.<br />I have a fix and I'll send it as=
 soon as I have it ready. However, I'm a first-time contributor here and I =
need to figure out the whole mechanism. Since the issue is sort of critical=
 (IMHO), please feel free to go ahead and submit a patch before I get mine =
ready.<br /><br />BR,<br />Carlos

--fNO4wuPVRqXKoNV3Yndt--
