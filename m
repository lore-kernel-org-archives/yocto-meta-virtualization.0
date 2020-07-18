Subject: Re: image-oci.bbclass creates faulty arm/variant entry in index.json
To: meta-virtualization@lists.yoctoproject.org
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
X-Originating-Location: Athens, Attica, GR (2.86.134.132)
X-Originating-Platform: Linux Firefox 78
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 18 Jul 2020 05:39:08 -0700
References: <CADkTA4MkH_MXMBX3aKXua3YF=kV=CMJ+LxT8FhPYs_LpZ35kBA@mail.gmail.com>
In-Reply-To: <CADkTA4MkH_MXMBX3aKXua3YF=kV=CMJ+LxT8FhPYs_LpZ35kBA@mail.gmail.com>
Message-ID: <6993.1595075948711564548@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="jLjHezedjc98wvjJeq4x"

--jLjHezedjc98wvjJeq4x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks!

Some space before "variant": "v7", to align with the character above would=
 make it better readable, but this works for me as well.

{
"schemaVersion": 2,
"manifests": [
{
"mediaType": "application/vnd.oci.image.manifest.v1+json",
"size": 420,
"digest": "sha256:15324340cf7e067ee2e80c9409aee370a797d37dd14fe0cd62d68718=
fce1ed06",
"platform": {
"architecture": "arm",
"variant": "v7",
"os": "linux"
},
"annotations": {
"org.opencontainers.image.ref.name": "latest"
}
}
]
}

--jLjHezedjc98wvjJeq4x
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />Thanks!<br /><br />Some space before "variant": "v7", to ali=
gn with the character above would make it better readable, but this works f=
or me as well.<br /><br />{ <br />&nbsp; "schemaVersion": 2,<br />&nbsp; "m=
anifests": [<br />&nbsp;&nbsp;&nbsp; { <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 "mediaType": "application/vnd.oci.image.manifest.v1+json",<br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; "size": 420,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "dige=
st": "sha256:15324340cf7e067ee2e80c9409aee370a797d37dd14fe0cd62d68718fce1ed=
06",<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "platform": {<br />&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; "architecture": "arm",<br />"variant": "v7",<br=
 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "os": "linux"<br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; },<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "annotations": =
{<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "org.opencontainers.image=
.ref.name": "latest"<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp=
;&nbsp; }<br />&nbsp; ]<br />}

--jLjHezedjc98wvjJeq4x--
