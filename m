Subject: image-oci.bbclass creates faulty arm/variant entry in index.json
To: meta-virtualization@lists.yoctoproject.org
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
X-Originating-Location: Athens, Attica, GR (2.86.134.132)
X-Originating-Platform: Linux Firefox 78
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 17 Jul 2020 10:56:32 -0700
Message-ID: <7Rna.1595008592154117129.JcM3@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="Ozvt1e9ADb7oOC9SVxrg"

--Ozvt1e9ADb7oOC9SVxrg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

index.json looks like this:

{
"schemaVersion": 2,
"manifests": [
{
"mediaType": "application/vnd.oci.image.manifest.v1+json",
"size": 420,
"digest": "sha256:63f34b526be88da860b1ae7969430bc7d20f233a58e13fc0f3770e61=
e037ebba",
"platform": {
"architecture": "arm",
\"variant\": "v7",
"os": "linux"
},
"annotations": {
"org.opencontainers.image.ref.name": "latest"
}
}
]
}

\"variant\": "v7" should be "variant": "v7"

I just hacked it like this in one of my custom scripts:

sed -i 's/\\"variant\\"/"variant"/g' ${OCI}/index.json

But this is not an appropriate fix.

The problem seems to be a combination of image-oci.bbclass and sloci-image=
.

Regards,

Robert

--Ozvt1e9ADb7oOC9SVxrg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

index.json looks like this:<br /><br />{ <br />&nbsp; "schemaVersion": 2,<b=
r />&nbsp; "manifests": [<br />&nbsp;&nbsp;&nbsp; { <br />&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; "mediaType": "application/vnd.oci.image.manifest.v1+json",<br=
 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "size": 420,<br />&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; "digest": "sha256:63f34b526be88da860b1ae7969430bc7d20f233a58e13fc0f=
3770e61e037ebba",<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "platform": {<br />&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "architecture": "arm",<br />&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \"variant\": "v7",<br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; "os": "linux"<br />&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; },<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "annotations": {<br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "org.opencontainers.image.ref.name": "late=
st"<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&n=
bsp; ]<br />}<br /><br />\"variant\": "v7" should be "variant": "v7"<br /><=
br />I just hacked it like this in one of my custom scripts:<br /><br />sed=
 -i 's/\\"variant\\"/"variant"/g' ${OCI}/index.json<br /><br />But this is =
not an appropriate fix.<br /><br />The problem seems to be a combination of=
 image-oci.bbclass and sloci-image.<br /><br />Regards,<br /><br />Robert

--Ozvt1e9ADb7oOC9SVxrg--
